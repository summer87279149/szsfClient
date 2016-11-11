//
//  UnCompleteViewController.m
//  foot
//
//  Created by Admin on 16/8/20.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "PayViewController.h"
#import "BuyVC.h"
#import "MallSectionModel.h"
#import "UnCompleteViewController.h"
#import "MallOrderCellModel.h"
#import "MallOrderTableViewCell.h"
@interface UnCompleteViewController ()<UITableViewDelegate,UITableViewDataSource,MallOrderTableViewCellDelegate>
{
    UITableView *tableview;
    BOOL dataHasMore;
    NSInteger page ;
    //“未完成”订单模型数组
    NSMutableArray *cellUncompleteArr;
    //订单详细物品数组
    NSMutableArray *cellUncompleteDetailArr;
}
@property(nonatomic,copy)NSString *isCompleteOrder;
@end

@implementation UnCompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"未完成的商品订单";
    HaHaHaAddBackGroundImage;
    
    dataHasMore = YES;
    _isCompleteOrder = @"0";
    cellUncompleteArr = [NSMutableArray arrayWithCapacity:0];
    cellUncompleteDetailArr = [NSMutableArray arrayWithCapacity:0];
    
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStyleGrouped];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.delegate = self;
    tableview.dataSource = self;
    ;
    [self.view addSubview: tableview];
    if ([YCUserModel userId]) {
         [self setupRefresh];
    }else{
        UserLoginController *a = [[UserLoginController alloc]init];
        MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:a];
        [self.navigationController presentViewController:naVC animated:YES completion:nil];
    }
   
}

-(void)GetRequestisComplete:(NSString *)isComplete isHeaderRefresh:(BOOL)isHeaderRefresh{
    if (isHeaderRefresh) {
        page = 1;
    }else{
        ++page;
    }
    WS(weakSelf)
    [SomeOtherRequest QueryOrderFormWithUserID:[YCUserModel userId] FormType:0 page:page isHeaderRefresh:isHeaderRefresh success:^(id response) {
        if (isHeaderRefresh) {
            [cellUncompleteArr removeAllObjects];
            [cellUncompleteDetailArr removeAllObjects];
        }
        if ([response[@"overflow"] isEqualToString:@"0"]) {
            dataHasMore = YES;
        }else{
            dataHasMore = NO;
        }
        NSLog(@"未完成订单返回:%@",response);
        NSArray * arr1 = response[@"order"];
        for (NSDictionary *dic in arr1) {
            MallSectionModel *model1 = [[MallSectionModel alloc]initFromDictionary:dic];
            NSArray *arr2 = dic[@"products"];
            for (NSDictionary *dic2 in arr2) {
                MallOrderCellModel *model = [[MallOrderCellModel alloc]initFromDictionary:dic2];
                [model1.detailArr addObject:model];
            }
            [cellUncompleteArr addObject:model1];
        }
        [weakSelf applyDataFromResponseObject];
//        NSLog(@"未完成商品订单数组:%@",cellUncompleteArr);
    } error:^(id response) {
        
    }];
    
}
//刷新 tableView
-(void)applyDataFromResponseObject{
    
    [tableview reloadData];
    [self loadiewFinished];
}
#pragma mark 下拉刷新
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [tableview addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    // 自动刷新(一进入程序就下拉刷新)
    [tableview headerBeginRefreshing];
    
    //2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [tableview addFooterWithTarget:self action:@selector(footerRereshing)];
}
- (void)loadiewFinished
{
    [tableview headerEndRefreshing];
    [tableview footerEndRefreshing];
}
- (void)footerRereshing
{
    if (dataHasMore == YES) {
        [self GetRequestisComplete:_isCompleteOrder isHeaderRefresh:NO];
    }
    else
    {
        [tableview footerEndRefreshing];
    }
}
- (void)headerRereshing
{
    
    [self GetRequestisComplete:_isCompleteOrder isHeaderRefresh:YES];
}
#pragma mark MyOrderTableViewCellDelegate
// 预约按钮点击 已取消 的
-(void)MyOrderCellBtnClicked:(UITableViewCell *)cell{
    
    NSIndexPath *index = [tableview indexPathForCell:cell];
    if (ArrayNonNull(cellUncompleteArr)){
        MallOrderCellModel *model = cellUncompleteArr[index.section];
        NSLog(@"当前点击的订单的订单号是:%@",model.orderNnumber);
    }
}

#pragma  mark tableViewDelegate and DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 138.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MallSectionModel *model = cellUncompleteArr[section];
    NSLog(@"每个section的个数是:%lu",model.detailArr.count);
    return model.detailArr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return cellUncompleteArr.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 25)];
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"height20"]];
    [view addSubview:imageview];
    imageview.frame = CGRectMake(0, 0, kScreenWidth, 20);
    UILabel *text = [[UILabel alloc]init];
    text.font = [UIFont systemFontOfSize:15];
    text.textColor = COLOR;
    [view addSubview:text];
    text.frame = CGRectMake(10, 0, kScreenWidth, 20);
    MallSectionModel *model = cellUncompleteArr[section];
    text.text = [NSString stringWithFormat:@"订单号:%@",model.orderNumber];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 25)];
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"height20"]];
    [view addSubview:imageview];
    imageview.frame = CGRectMake(0, 0, kScreenWidth, 20);
    UILabel *text = [[UILabel alloc]init];
    text.font = [UIFont systemFontOfSize:15];
    text.textColor = COLOR;
    [view addSubview:text];
    text.frame = CGRectMake(0, 0, kScreenWidth-10, 20);
    MallSectionModel *model = cellUncompleteArr[section];
    text.text = [NSString stringWithFormat:@"总计:¥%@ ",model.totalPrice];
    text.textAlignment = NSTextAlignmentRight;
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.font = [UIFont systemFontOfSize:15];
    timeLabel.textColor = COLOR;
    [view addSubview:timeLabel];
    timeLabel.frame = CGRectMake(10, 0, kScreenWidth-30, 20);
    timeLabel.text = [NSString stringWithFormat:@"时间:%@",model.time];
    timeLabel.textAlignment = NSTextAlignmentLeft;
    
    //去完成button
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-60, 25, 50, 30)];
    btn.layer.cornerRadius=3;
    btn.layer.borderColor =[COLOR CGColor];
    btn.layer.borderWidth = 1;
    [btn setTitle:@"去完成" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:COLOR forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goFinishOrder:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    btn.tag = section;
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"OrderCell";
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([MallOrderTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        nibsRegistered = YES;
    }
    //服务订单cell
    MallOrderTableViewCell *cell = (MallOrderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (ArrayNonNull(cellUncompleteArr)) {
    
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.delegate = self;
        MallSectionModel *model = cellUncompleteArr[indexPath.section];
        cell.myOrderCellModel = model.detailArr[indexPath.row];
    }
    return cell;
    

}





-(void)goFinishOrder:(UIButton*)sender{
    if (ArrayNonNull(cellUncompleteArr)) {
        NSLog(@"按钮的tag是:%lu",sender.tag);
        MallSectionModel *model = cellUncompleteArr[sender.tag];
        NSLog(@"拿到的商品订单号是:%@，价格是:%@",model.orderNumber,model.totalPrice);
        /**
         *  继续写
         *
         *  @return <#return value description#>
         */
        PayViewController *pay = [[PayViewController alloc]init];
        pay.orderNumber = model.orderNumber;
        pay.totalPrice = model.totalPrice;
        [self.navigationController pushViewController:pay animated:YES];
    }
}

































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
