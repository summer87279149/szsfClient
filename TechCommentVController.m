//
//  TechCommentVController.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "TechnicianMode.h"
#import "TechCommentVController.h"
#import "ThreeTableViewCell.h"
#import "CommentCellModel.h"
@interface TechCommentVController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableview;
    //
    NSMutableArray *infoArr;
    BOOL dataHasMore;
    NSInteger page ;
}
@end
@implementation TechCommentVController

- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
    self.navigationItem.title = @"评价";
    infoArr = [[NSMutableArray alloc]initWithCapacity:0];
    dataHasMore = YES;
//    [self getRequestDataisHeaderRefresh:YES];
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.separatorColor = COLOR;
    [self setupRefresh];
    [self.view addSubview: tableview];
}
#pragma mark - setupRefresh
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
        [self getRequestDataisHeaderRefresh:NO];
    }
    else
    {
        [tableview footerEndRefreshing];
    }
    
}
- (void)headerRereshing
{
    
    [self getRequestDataisHeaderRefresh:YES];
 
}
-(void)getRequestDataisHeaderRefresh:(BOOL)isHeaderRefresh{
    if (isHeaderRefresh) {
        page = 1;
    }else{
        ++page;
    }
    NSNumber *pageNum = [NSNumber numberWithInteger:page];
    NSMutableDictionary *paraDic = [NSMutableDictionary dictionaryWithObject:pageNum forKey:@"page"];
    [paraDic addEntriesFromDictionary:self.para];
    NSLog(@"zidian shi %@",paraDic);
    WS(weakSelf)
    [SomeOtherRequest GetCommentWith:paraDic success:^(id response) {
        NSLog(@"评价页面返回数据是:%@",response);
        if (isHeaderRefresh) {
            [infoArr removeAllObjects];
        }
        if ([response[@"overflow"] isEqualToString:@"0"]) {
            dataHasMore = YES;
        }else{
            dataHasMore = NO;
        }
        NSArray *arr = response[@"remarks"];
        for (NSDictionary *dic in arr) {
          CommentCellModel *commentCellModel = [[CommentCellModel alloc]initFromDictionary:dic];
            [infoArr addObject:commentCellModel];
        }
        [weakSelf applyDataFromResponseObject];
    } error:^(id response) {
        
    }];
}
-(void)applyDataFromResponseObject{
    if (infoArr.count>0) {
        [tableview reloadData];
    }
    [self loadiewFinished];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return infoArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableview cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID=@"cell";
    ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[ThreeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(infoArr.count>0){
        cell.commentCellModel = infoArr[indexPath.row];
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
