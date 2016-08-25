//
//  UnCompleteViewController.m
//  foot
//
//  Created by Admin on 16/8/20.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "UnCompleteViewController.h"
#import "MyOrderTableViewCell.h"
@interface UnCompleteViewController ()<UITableViewDelegate,UITableViewDataSource,MyOrderTableViewCellDelegate>
{
    UITableView *tableview;
}
@end

@implementation UnCompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"未完成订单";
    HaHaHaAddBackGroundImage;
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStyleGrouped];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.delegate = self;
    tableview.dataSource = self;
    ;
    [self.view addSubview: tableview];

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
    cell.status.text = @"未完成";
    cell.button.hidden = YES;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    MyOrderTableViewCell * VC = [[MyOrderTableViewCell alloc]init];
    //    [self.navigationController pushViewController:VC animated:YES];
    
    
}


-(void)MyOrderCellBtnClicked{
    
}
//评价
-(void)MyOrderCellBtnClickedComment{
    
}




































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
