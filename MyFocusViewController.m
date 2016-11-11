//
//  MyFocusViewController.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "MyFocusCellModel.h"
#import "MyFocusViewController.h"
#import "MyFocusTableViewCell.h"
#import "TechViewController.h"
@interface MyFocusViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * myFocusTableCellModelArr;
    MyFocusCellModel *myFocusCellModel;
}
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MyFocusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myFocusTableCellModelArr = [[NSMutableArray alloc]initWithCapacity:0];
    self.navigationItem.title = @"我的关注";
    HaHaHaAddBackGroundImage
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor = [UIColor clearColor];
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
    NSLog(@"我的userid是:%@",[YCUserModel userId]);
    WS(weakSelf)
    [SomeOtherRequest GetMyFocusTecWithUserID:[YCUserModel userId] success:^(id response) {
        NSLog(@"我的关注返回:%@",response);
        [myFocusTableCellModelArr removeAllObjects];
        NSArray *arr = response;
        for(NSDictionary *dic in arr){
            myFocusCellModel = [[MyFocusCellModel alloc]initFromDictionary:dic];
            [myFocusTableCellModelArr addObject:myFocusCellModel];
        }
        [weakSelf applyData];
        NSLog(@"我的关注的技师是 %@",response);
    } error:^(id response) {
    }];
}

-(void)applyData{
    [_tableView reloadData];
    [self loadFinished];
}

-(void)loadFinished{
    [_tableView headerEndRefreshing];
}

#pragma  mark tableViewDelegate and DataSource
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"取消关注";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    MyFocusCellModel *model = myFocusTableCellModelArr[indexPath.row];
    [SomeOtherRequest UserCancelFocusWithTecID:model.technicianID UserID:[YCUserModel userId] success:^(id response) {
        NSLog(@"取消关注的技师名字是:%@",model.techName);
        // 从数据源中删除
        [myFocusTableCellModelArr removeObjectAtIndex:indexPath.row];
        // 从列表中删除
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } error:^(id response) {
         [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return myFocusTableCellModelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"threeCell";
    MyFocusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[MyFocusTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (myFocusTableCellModelArr.count>0) {
        cell.myFocusCellModel = myFocusTableCellModelArr[indexPath.row];
        cell.userInteractionEnabled = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MyFocusCellModel *model = myFocusTableCellModelArr[indexPath.row];
    TechViewController *techVC = [[TechViewController alloc]init];
    NSLog(@"%@",model.technicianID);
    techVC.techID = model.technicianID;
    [self.navigationController pushViewController:techVC animated:YES];
    
    
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
