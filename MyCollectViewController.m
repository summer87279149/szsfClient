//
//  MyCollectViewController.m
//  foot
//
//  Created by Admin on 16/11/4.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "ShopDetailVC.h"
#import "MyCollectViewController.h"
#import "MyCollectTableViewCell.h"
#import "MyCollectionModel.h"
@interface MyCollectViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * cellArr;
    BOOL dataHasMore;
    NSInteger page ;
    MyCollectionModel*myCollectionModel;
}
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MyCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的收藏";
    HaHaHaAddBackGroundImage
    dataHasMore = YES;
    [self createTableview];
}

-(void)createTableview{
    cellArr = [[NSMutableArray alloc]initWithCapacity:0];

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[MyCollectTableViewCell class] forCellReuseIdentifier:@"myCollectTableViewCell"];
    // _tableView.backgroundColor = [UIColor clearColor];
    //_tableView.estimatedRowHeight = 56;
    // _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    [self setupRefresh];
}
- (void)setupRefresh
{
    [_tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    [_tableView headerBeginRefreshing];
    [_tableView addFooterWithTarget:self action:@selector(footerRereshing)];
}

- (void)loadiewFinished
{
    [_tableView headerEndRefreshing];
    [_tableView footerEndRefreshing];
}
-(void)requestDataisHeaderRefresh:(BOOL)isHeaderRefresh{
    if (isHeaderRefresh) {
        page = 1;
    }else{
        ++page;
    }
    WS(weakSelf)
    [SomeOtherRequest getMyCollectionShopByUserID:[YCUserModel userId] page:page success:^(id response) {
        NSLog(@"查询我收藏的店铺:%@",response);
        if (isHeaderRefresh) {
            [cellArr removeAllObjects];
        }
        if ([response[@"overflow"] isEqualToString:@"0"]) {
            dataHasMore = YES;
        }else{
            dataHasMore = NO;
        }
        for(NSDictionary *dic in response[@"shop"]){
            myCollectionModel = [[MyCollectionModel alloc]initFromDictionary:dic];
            [cellArr addObject:myCollectionModel];

        }
        
        [weakSelf applyDataFromResponseObject];
    } error:^(id response) {
        
    }];
    
}
- (void)footerRereshing
{
    if (dataHasMore == YES) {
        [self requestDataisHeaderRefresh:NO];
    }
    else
    {
        [_tableView footerEndRefreshing];
    }
}

- (void)headerRereshing
{
    
    [self requestDataisHeaderRefresh:YES];
}

#pragma mark- 设置数据
-(void)applyDataFromResponseObject{
    
    [_tableView reloadData];
    
    [self loadiewFinished];
}
#pragma mark - UITableViewDelegate
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"取消收藏";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        MyCollectionModel *model = cellArr[indexPath.row];
    [SomeOtherRequest cancelCollectShopID:model.shopID userID:[YCUserModel userId] success:^(id response) {
       NSLog(@"取消关注:%@",response);
        // 从数据源中删除
        [cellArr removeObjectAtIndex:indexPath.row];
        // 从列表中删除
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } error:^(id response) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellArr.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCollectTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cellArr.count>0) {
        cell.myCollectionModel = cellArr[indexPath.row];
        NSLog(@"cell.myCollectionModel=%@",cell.myCollectionModel);
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (cellArr.count>0) {
        MyCollectionModel*model = cellArr[indexPath.row];
        if (StringNonNull(model.shopID)) {
            ShopDetailVC *push = [[ShopDetailVC alloc]init];
            push.shopID =model.shopID;
            push.title = @"商家";
            [self.navigationController pushViewController:push animated:YES];
        }
    }else{
        [MBProgressHUD showError:@"请等待刷新完成"];
    }
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
