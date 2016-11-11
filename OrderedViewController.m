//
//  OrderedViewController.m
//  foot
//
//  Created by Admin on 16/10/12.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "OrderedViewController.h"
#import "MyOrderCellModel.h"
#import "CommentViewController.h"
#import "MyOrderTableViewCell.h"
@interface OrderedViewController ()<UITableViewDelegate,UITableViewDataSource,MyOrderTableViewCellDelegate>
{
    BOOL dataHasMore;
    NSInteger page ;
    //已完成模型数组
    NSMutableArray *cellCompleteArr;
    
}
@property(nonatomic,copy)NSString *isCompleteOrder;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation OrderedViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
    self.navigationItem.title = @"我的订单";
    dataHasMore = YES;
    _isCompleteOrder = @"1";
    cellCompleteArr  = [NSMutableArray arrayWithCapacity:0];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-30) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(headerRereshing) name:@"commentFinish" object:nil];
    [self setupRefresh];
}
-(void)GetRequestisComplete:(NSString *)isComplete isHeaderRefresh:(BOOL)isHeaderRefresh{
    if (isHeaderRefresh) {
        page = 1;
    }else{
        ++page;
    }
    WS(weakSelf)
    [SomeOtherRequest queryMyOrderNumberWithUserID:[YCUserModel userId] isComplete:isComplete page:page isHeaderRefresh:isHeaderRefresh success:^(id response) {
        NSLog(@"我的订单返回%@",response);
        if (isHeaderRefresh) {
            [cellCompleteArr removeAllObjects];
        }
        if ([response[@"overflow"] isEqualToString:@"0"]) {
            dataHasMore = YES;
        }else{
            dataHasMore = NO;
        }
        //如果是查询的已完成订单
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
        arr = response[@"order"];
        for (NSDictionary *dic  in arr) {
            MyOrderCellModel *model = [[MyOrderCellModel alloc]initFromDictionary:dic];
            [cellCompleteArr addObject:model];
        }
        
        [weakSelf applyDataFromResponseObject];
    } error:^(id response) {
        [weakSelf loadiewFinished];
        
    }];
    
}
//刷新 tableView
-(void)applyDataFromResponseObject{
    
    [_tableView reloadData];
    [self loadiewFinished];
}
#pragma mark 下拉刷新
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [_tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    
    // 自动刷新(一进入程序就下拉刷新)
    [_tableView headerBeginRefreshing];
    
    //2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
}

- (void)loadiewFinished
{
    [_tableView headerEndRefreshing];
    [_tableView footerEndRefreshing];
}
- (void)footerRereshing
{
    if (dataHasMore == YES) {
        [self GetRequestisComplete:_isCompleteOrder isHeaderRefresh:NO];
    }
    else
    {
        [_tableView footerEndRefreshing];
    }
}
- (void)headerRereshing
{
    [self GetRequestisComplete:_isCompleteOrder isHeaderRefresh:YES];
    
}

#pragma mark MyOrderTableViewCellDelegate

// 预约按钮点击 评价
-(void)MyOrderCellBtnClickedComment:(UITableViewCell *)cell{
    NSIndexPath *index = [_tableView indexPathForCell:cell];
    if (ArrayNonNull(cellCompleteArr)){
        MyOrderCellModel *model = cellCompleteArr[index.section];
        NSLog(@"当前点击的订单的订单号是:%@",model.orderNnumber);
        CommentViewController *comment = [[CommentViewController alloc]init];
        comment.orderNumber = model.orderNnumber;
        [self.navigationController pushViewController:comment animated:YES];
    }
   
    
}
//去完成delegate
-(void)MyOrderCellBtnClicked:(UITableViewCell *)cell{
    
}
#pragma  mark tableViewDelegate and DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    return 160.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return cellCompleteArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"OrderCell";
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([MyOrderTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        nibsRegistered = YES;
    }
    //服务订单cell
    MyOrderTableViewCell *cell = (MyOrderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    cell.myOrderCellModel = cellCompleteArr[indexPath.section];
    return cell;
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end


