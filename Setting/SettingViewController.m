//
//  SettingViewController.m
//  FootMassage
//
//  Created by Admin on 16/4/22.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "MainTabBarController.h"
#import "MainNavViewController.h"
#import "UserLoginController.h"
#import "SettingViewController.h"
//#import "AFHTTPClient.h"
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIAlertViewDelegate>
{
    NSMutableArray *setArr;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HaHaHaAddBackGroundImage
    setArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    
    UITableView *settingTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    //    m_mineTtabView.style = UITableViewStylePlain;
    settingTable.dataSource = self;
    settingTable.delegate = self;
    settingTable.scrollEnabled = NO;
    settingTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:settingTable];
    //去掉表格顶部空白部分
    settingTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, settingTable.bounds.size.width, 0.01f)];
    
    
    UIButton *rechargeBtn = [[UIButton alloc]init];
    [rechargeBtn addTarget:self action:@selector(loginOutPress) forControlEvents:UIControlEventTouchUpInside];
    rechargeBtn.backgroundColor = COLOR;
    [rechargeBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [rechargeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rechargeBtn addTarget:self action:@selector(loginOutPress) forControlEvents:UIControlEventTouchDragInside];
    [self.view addSubview:rechargeBtn];
    
    settingTable.sd_layout
    .widthIs(viewWidth)
    .heightIs(viewHeight);
    
//    loginBtn.sd_layout
//    .centerXEqualToView(self.view)
//    .leftSpaceToView(self.view,50)
//    .rightSpaceToView(self.view,50)
//    .heightIs(45)
//    .bottomSpaceToView(self.view,90);
    
    rechargeBtn.sd_layout
    .centerXEqualToView(self.view)
    .leftSpaceToView(self.view,50)
    .rightSpaceToView(self.view,50)
    .heightIs(45)
    .bottomSpaceToView(self.view,20);
    
}

//登录
- (void)loginPress
{
    
}


//退出登录
- (void)loginOutPress
{
    UIAlertView *vAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否退出登录" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [vAlert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    switch (buttonIndex) {
        case 0: //取消退出登录
            break;
        case 1: //确定退出登录，写退出登入代码
        {
            [[YCUserModel shareManager] logOut];
            
            
            [self.navigationController popToRootViewControllerAnimated:NO];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"loginOut" object:nil];
        }
            break;
    }
}

#pragma mark - UItableView delegate
//设置表头
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [setArr count];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableCell = @"SettingCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:tableCell];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [setArr objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//开关按钮
- (void)witchpress
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
