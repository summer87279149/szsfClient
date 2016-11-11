//
//  MyMessageViewController.m
//  foot
//
//  Created by Admin on 16/10/14.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "MyMessageModel.h"
#import "MyMessageViewController.h"
#import "MyMessageTableViewCell.h"
@interface MyMessageViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray * messageArr;
}
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MyMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    messageArr = [[NSMutableArray alloc]initWithCapacity:0];
    self.navigationItem.title = @"我的关注";
    HaHaHaAddBackGroundImage
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.estimatedRowHeight = 56;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [_tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 自动刷新(一进入程序就下拉刷新)
    [_tableView headerBeginRefreshing];
    [self.view addSubview:_tableView];

}
-(void)headerRereshing{
    
    [self getRequestData];
}
-(void)getRequestData{
   
    
}
-(void)applyData{
    
    [_tableView reloadData];
    [self loadFinished];
}
-(void)loadFinished{
    [_tableView headerEndRefreshing];
    
}

#pragma  mark tableViewDelegate and DataSource
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 100.0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return messageArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    static NSString *CellIdentifier = @"OrderCell";
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([MyMessageTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        nibsRegistered = YES;
    }
    //服务订单cell
    MyMessageTableViewCell *cell = (MyMessageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (ArrayNonNull(messageArr)) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        MyMessageModel *model = messageArr[indexPath.row];
        cell.myMessageModel = model;
    }
    return cell;

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
