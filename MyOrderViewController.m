//
//  MyOrderViewController.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "CommentViewController.h"
#import "PayViewController.h"
#import "XFSegmentView.h"
#import "MyOrderViewController.h"
#import "MyOrderTableViewCell.h"
@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource,MyOrderTableViewCellDelegate,XFSegmentViewDelegate>
{
    NSInteger selectedIndex;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)XFSegmentView *segView;
@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的订单";
    HaHaHaAddBackGroundImage
    
    _segView=[[XFSegmentView alloc]initWithFrame:Frame(0, 0, kScreenWidth, 30)];
    [self.view addSubview:_segView];
    _segView.delegate = self;
    _segView.titles = @[@"服务订单",@"商品订单"];
    _segView.titleFont = Font(16);
    selectedIndex = 0;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, kScreenHeight-64-30) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
}
#pragma mark segmentViewDelegate
-(void)segmentView:(XFSegmentView *)segmentView didSelectIndex:(NSInteger)index{
    selectedIndex = index;
    NSLog(@"当前选择的是%ld",(long)selectedIndex);
}
#pragma mark MyOrderTableViewCellDelegate
// 预约按钮点击 已取消 的
-(void)MyOrderCellBtnClicked{
    
}
// 预约按钮点击 评价
-(void)MyOrderCellBtnClickedComment{
    
    if (selectedIndex == 0) {
        CommentViewController *comment = [[CommentViewController alloc]init];
        [self.navigationController pushViewController:comment animated:YES];
    }else if (selectedIndex ==1){
        
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
    return 10;
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
