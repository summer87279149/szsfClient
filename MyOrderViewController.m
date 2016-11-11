//
//  MyOrderViewController.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "UserTool.h"
#import "MyOrderCellModel.h"
#import "CommentViewController.h"
#import "PayViewController.h"
#import "XFSegmentView.h"
#import "MyOrderViewController.h"
#import "MyOrderTableViewCell.h"
@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource,MyOrderTableViewCellDelegate,XFSegmentViewDelegate>
{
    NSInteger selectedIndex;
    BOOL dataHasMore;
    NSInteger page ;
    //已完成模型数组
    NSMutableArray *cellCompleteArr;
    //“未完成”订单模型数组
    NSMutableArray *cellUncompleteArr;
    //临时数组
    NSMutableArray *tempArr;
}
@property(nonatomic,copy)NSString *isCompleteOrder;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)XFSegmentView *segView;
@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的订单";
    
    HaHaHaAddBackGroundImage
    dataHasMore = YES;
    cellCompleteArr  = [NSMutableArray arrayWithCapacity:0];
    cellUncompleteArr = [NSMutableArray arrayWithCapacity:0];
    tempArr = [NSMutableArray arrayWithCapacity:0];
    _segView=[[XFSegmentView alloc]initWithFrame:Frame(0, 0, kScreenWidth, 30)];
    [self.view addSubview:_segView];
    _segView.delegate = self;
    _segView.titles = @[@"已完成",@"未完成"];
    _segView.titleFont = Font(16);
    selectedIndex = 0;
    _isCompleteOrder = @"1";
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, kScreenHeight-64-30) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
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
            [cellUncompleteArr removeAllObjects];
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
            [tempArr addObject:model];
        }
        if ([isComplete isEqualToString:@"1"]) {
            cellCompleteArr = tempArr;
        }else{
            cellUncompleteArr = tempArr;
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
    _segView.userInteractionEnabled = YES;
    [_tableView headerEndRefreshing];
    [_tableView footerEndRefreshing];
}
- (void)footerRereshing
{
    _segView.userInteractionEnabled = NO;
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
    _segView.userInteractionEnabled = NO;
    [self GetRequestisComplete:_isCompleteOrder isHeaderRefresh:YES];

    
}

#pragma mark segmentViewDelegate
-(void)segmentView:(XFSegmentView *)segmentView didSelectIndex:(NSInteger)index{
    if (_segView.userInteractionEnabled == NO) {
        return;
    }
    selectedIndex = index;
    if (index == 0) {
        _isCompleteOrder = @"1";
        NSLog(@"当前选择的是已完成订单");
    }else{
        _isCompleteOrder = @"0";
        NSLog(@"当前选择的是未完成订单");
        
    }

    [_tableView headerBeginRefreshing];
    

}
#pragma mark MyOrderTableViewCellDelegate
// 预约按钮点击 已取消 的
-(void)MyOrderCellBtnClicked:(UITableViewCell *)cell{
    if (selectedIndex == 1) {
        NSIndexPath *index = [_tableView indexPathForCell:cell];
        if (ArrayNonNull(cellUncompleteArr)){
            MyOrderCellModel *model = cellUncompleteArr[index.section];
            NSLog(@"当前点击的订单的订单号是:%@",model.orderNnumber);
        }
    }
    
}
// 预约按钮点击 评价
-(void)MyOrderCellBtnClickedComment:(UITableViewCell *)cell{
    if (selectedIndex == 0) {
        NSIndexPath *index = [_tableView indexPathForCell:cell];
        if (ArrayNonNull(cellCompleteArr)){
            MyOrderCellModel *model = cellCompleteArr[index.section];
            NSLog(@"当前点击的订单的订单号是:%@",model.orderNnumber);
        }
//        CommentViewController *comment = [[CommentViewController alloc]init];
//        [self.navigationController pushViewController:comment animated:YES];
    }
}


#pragma  mark tableViewDelegate and DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 160.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([_isCompleteOrder isEqualToString:@"1"]) {
        return cellCompleteArr.count;
    }else{
        return cellUncompleteArr.count;
    }
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
    if ([_isCompleteOrder isEqualToString:@"1"]) {
        cell.myOrderCellModel = cellCompleteArr[indexPath.section];
    }else{
        
        cell.myOrderCellModel = cellUncompleteArr[indexPath.section];
    }
   
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    MyOrderTableViewCell * VC = [[MyOrderTableViewCell alloc]init];
//    [self.navigationController pushViewController:VC animated:YES];
    
    
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
