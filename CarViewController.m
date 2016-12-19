//
//  ViewController.m
//  ShoppingList_Demo
//
//  Created by 李金华 on 15/4/20.
//  Copyright (c) 2015年 LJH. All rights reserved.
//

#import "CarViewController.h"
#import "MyCustomCell.h"
#import "GoodsInfoModel.h"

#import "BuyVC.h"
@interface CarViewController ()<UITableViewDataSource,UITableViewDelegate,MyCustomCellDelegate>
{
    UITableView *_MyTableView;
    float allPrice;
    NSMutableArray *infoArr;
}

@property(strong,nonatomic)UIButton *allSelectBtn;
@property(strong,nonatomic)UILabel *allPriceLab;

@end

@implementation CarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
    self.title = @"购物车";
    //初始化数据
    allPrice = 0.0;
    infoArr = [[NSMutableArray alloc]initWithCapacity:0];
    
//    [self getRequestData];
    if ([YCUserModel userId]) {
        SHOWHUD
        [self getRequestData];
    }else{
        UserLoginController *a = [[UserLoginController alloc]init];
        MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:a];
        [self.navigationController presentViewController:naVC animated:YES completion:nil];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
-(void)getRequestData{
    
    [SomeOtherRequest GetProductCarWithUserID:[YCUserModel userId] success:^(id response) {
        NSLog(@"购物车的返回结果是:%@,%@",response,[YCUserModel userId]);
        //封装数据模型
        NSArray *arr = response;
        NSLog(@"arr shi %@",arr);
        for(NSDictionary *dic in arr){
            GoodsInfoModel *goodsModel = [[GoodsInfoModel alloc]initWithDict:dic];
            [infoArr addObject:goodsModel];
        }
        [self createTableView];
        
    } error:^(id response) {
        HIDEHUD
    }];
    
}


-(void)createTableView{
    /**
     创建表格，并设置代理
     */
    _MyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _MyTableView.dataSource = self;
    _MyTableView.delegate = self;
    _MyTableView.showsVerticalScrollIndicator = NO;
    //给表格添加一个尾部视图
    _MyTableView.tableFooterView = [self creatFootView];
    _MyTableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_MyTableView];
    HIDEHUD
}

/**
 *  创建表格尾部视图
 *
 *  @return 返回一个UIView 对象视图，作为表格尾部视图
 */
-(UIView *)creatFootView{
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    
    //添加一个全选文本框标签
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 150, 10, 50, 30)];
    lab.text = @"全选";
    [footView addSubview:lab];
    
    //添加全选图片按钮
    _allSelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _allSelectBtn.frame = CGRectMake(self.view.frame.size.width- 100, 10, 30, 30);
    [_allSelectBtn setImage:[UIImage imageNamed:@"复选框-未选中"] forState:UIControlStateNormal];
    [_allSelectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:_allSelectBtn];
    
    //添加小结文本框
    UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 150, 40, 60, 30)];
    lab2.textColor = [UIColor redColor];
    lab2.text = @"小结：";
    [footView addSubview:lab2];
    
    //添加一个总价格文本框，用于显示总价
    _allPriceLab = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 100, 40, 100, 30)];
    _allPriceLab.textColor = [UIColor redColor];
    _allPriceLab.text = @"0.0";
    [footView addSubview:_allPriceLab];
    
    
    //添加一个结算按钮
    UIButton *settlementBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [settlementBtn setTitle:@"去结算" forState:UIControlStateNormal];
    [settlementBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    settlementBtn.frame = CGRectMake(10, 80, self.view.frame.size.width - 20, 30);
    [settlementBtn addTarget:self action:@selector(goToPay) forControlEvents:UIControlEventTouchUpInside];
    settlementBtn.backgroundColor = COLOR;
    settlementBtn.layer.cornerRadius = 3;
    [footView addSubview:settlementBtn];
    return footView;
}
-(void)goToPay{
    if(infoArr.count==0){
        [MBProgressHUD showError:@"没有商品"];
        return;
    }
    NSMutableArray *pushInfoArr = [[NSMutableArray alloc]initWithCapacity:0];
    NSMutableArray *requestArr = [[NSMutableArray alloc]initWithCapacity:0];
    for (NSInteger i = 0; i<infoArr.count; ++i) {
        GoodsInfoModel *goodsModel = infoArr[i];
        if (goodsModel.selectState == YES){
            NSNumber *goodNum = [NSNumber numberWithInt:goodsModel.goodsNum];
            NSDictionary *dic = @{@"pid":goodsModel.pid,@"number":goodNum};
            [requestArr addObject:dic];
            [pushInfoArr addObject:goodsModel];
        }
    }
    if (requestArr.count == 0) {
        [MBProgressHUD showError:@"没有已选择的商品"];
        return;
    }
    BuyVC *buy = [[BuyVC alloc]init];
    buy.infoArr = [NSMutableArray arrayWithArray:pushInfoArr];
    buy.requestArr = [NSMutableArray arrayWithArray:requestArr];
    buy.allPrice = [_allPriceLab.text floatValue];
    [self.navigationController pushViewController:buy animated:YES];
}

#pragma mark - tableViewDelegate
//返回单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return infoArr.count;
}
//定制单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *identify =  @"indentify";
    MyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell)
    {
        cell = [[MyCustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
         cell.delegate = self;
    }
   //调用方法，给单元格赋值
    [cell addTheValue:infoArr[indexPath.row]];
    
    return cell;
}

//返回单元格的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    GoodsInfoModel *model = infoArr[indexPath.row];
    [SomeOtherRequest deleteItemWithItemID:model.pid AndUserID:[YCUserModel userId] success:^(id response) {
        NSLog(@"%@",response);
        // 从数据源中删除
        [infoArr removeObjectAtIndex:indexPath.row];
        // 从列表中删除
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } error:^(id response) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
   
}
//单元格选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  判断当期是否为选中状态，如果选中状态点击则更改成未选中，如果未选中点击则更改成选中状态
     */
    GoodsInfoModel *model = infoArr[indexPath.row];

    if (model.selectState)
    {
        model.selectState = NO;
    }
    else
    {
        model.selectState = YES;
    }

    //刷新整个表格
//    [_MyTableView reloadData];
    
    //刷新当前行
    [_MyTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self totalPrice];
}

/**
 *  全选按钮事件
 *
 *  @param sender 全选按钮
 */
-(void)selectBtnClick:(UIButton *)sender
{
    //判断是否选中，是改成否，否改成是，改变图片状态
    sender.tag = !sender.tag;
    if (sender.tag)
    {
        [sender setImage:[UIImage imageNamed:@"复选框-选中.png"] forState:UIControlStateNormal];
        
    }else{
        [sender setImage:[UIImage imageNamed:@"复选框-未选中.png"] forState:UIControlStateNormal];
    }
    //改变单元格选中状态
    for (int i=0; i<infoArr.count; i++)
    {
        GoodsInfoModel *model = [infoArr objectAtIndex:i];
        model.selectState = sender.tag;
    }
    //计算价格
    [self totalPrice];
    //刷新表格
    [_MyTableView reloadData];
    
}

#pragma mark -- 实现加减按钮点击代理事件

/**
 *  实现加减按钮点击代理事件
 *
 *  @param cell 当前单元格
 *  @param flag 按钮标识，11 为减按钮，12为加按钮
 */
-(void)btnClick:(UITableViewCell *)cell andFlag:(int)flag
{
    switch (flag) {
        case 11:
        {
            
            NSIndexPath *index = [_MyTableView indexPathForCell:cell];
            GoodsInfoModel *model = infoArr[index.row];
            //做减法
            //先获取到当期行数据源内容，改变数据源内容，刷新表格
           
            if (model.goodsNum > 1)
            {   WS(weakSelf)
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                [SomeOtherRequest decreaseItemWithItemID:model.pid AndUserID:[YCUserModel userId] success:^(id response) {
                    model.goodsNum --;
//                    infoArr[index.row] = model;
                    //刷新表格
                    [_MyTableView reloadData];
                    //计算总价
                    [weakSelf totalPrice];
                    [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
                } error:^(id response) {
                    [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
                }];
                
                
            }
        }
            break;
        case 12:
        {   WS(weakSelf)
            NSIndexPath *index = [_MyTableView indexPathForCell:cell];
            GoodsInfoModel *model = infoArr[index.row];
            //做加法
//            GoodsInfoModel *model = infoArr[index.row];
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [SomeOtherRequest addItemWithItemID:model.pid AndUserID:[YCUserModel userId] success:^(id response) {
                model.goodsNum ++;
                //刷新表格
                [_MyTableView reloadData];
                //计算总价
                [weakSelf totalPrice];
                [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
            } error:^(id response) {
                [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
            }];
            
            
        }
            break;
        default:
            
            break;
    }
    
    
}

#pragma mark -- 计算价格
-(void)totalPrice
{
    //遍历整个数据源，然后判断如果是选中的商品，就计算价格（单价 * 商品数量）
    for ( int i =0; i<infoArr.count; i++)
    {
        GoodsInfoModel *model = [infoArr objectAtIndex:i];
        if (model.selectState)
        {
            allPrice = allPrice + model.goodsNum *[model.goodsPrice floatValue];
        }
    }
    
    //给总价文本赋值
    _allPriceLab.text = [NSString stringWithFormat:@"%.2f",allPrice];
    NSLog(@"%f",allPrice);
    
    //每次算完要重置为0，因为每次的都是全部循环算一遍
    allPrice = 0.0;
    
}


- (void)didReceiveMemoryWarning {    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
