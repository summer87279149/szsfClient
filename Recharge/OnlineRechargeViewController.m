//
//  OnlineRechargeViewController.m
//  FootMassage
//
//  Created by Admin on 16/4/22.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "OnlineRechargeViewController.h"
#import "RechargeTimeTableViewCell.h"
#import "RechargeTypeTableViewCell.h"

@interface OnlineRechargeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *onlineTable;
}

@end


@implementation OnlineRechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    onlineTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    //    m_mineTtabView.style = UITableViewStylePlain;
    onlineTable.dataSource = self;
    onlineTable.delegate = self;
//    onlineTable.scrollEnabled = NO;
    onlineTable.backgroundColor = [UIColor getColor:@"E5E5E5"];
    [self.view addSubview:onlineTable];
    //去掉表格顶部空白部分
    onlineTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, onlineTable.bounds.size.width, 0.01f)];
    
    UIButton *rechargeBtn = [[UIButton alloc]init];
    [rechargeBtn addTarget:self action:@selector(rechargeBtnPress) forControlEvents:UIControlEventTouchUpInside];
    rechargeBtn.backgroundColor = [UIColor getColor:@"4DB748"];
    [rechargeBtn setTitle:@"充值" forState:UIControlStateNormal];
    [rechargeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:rechargeBtn];
    
    onlineTable.sd_layout
    .widthIs(viewWidth)
    .heightIs(viewHeight);
    
    rechargeBtn.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .heightIs(50);
}

//支付按钮
- (void)rechargeBtnPress
{
    
}

#pragma mark - UItableView delegate
//设置表头
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    return 3;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //时间和金额
        static NSString *tableCell = @"RechargeTimeCell";
        RechargeTimeTableViewCell *cell = (RechargeTimeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
        if (cell == nil)
        {
            cell = [[RechargeTimeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:tableCell];
        }
  
        return cell;
    }
    //选择支付方式
    static NSString *tableCell = @"RechargeTypeCell";
    RechargeTypeTableViewCell *cell = (RechargeTypeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil)
    {
        cell = [[RechargeTypeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:tableCell];
    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
