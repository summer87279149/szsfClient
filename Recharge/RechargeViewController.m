//
//  RechargeViewController.m
//  FootMassage
//
//  Created by Admin on 16/4/22.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "RechargeViewController.h"
#import "OnlineRechargeViewController.h"

@interface RechargeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITableView *rechargeTable;
    UITextField *rechargeText;
    UIButton *rechargeBtn;
    int keyBoardHeight;
    UIView *contenView;
}
@end

@implementation RechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    rechargeTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    //    m_mineTtabView.style = UITableViewStylePlain;
    rechargeTable.dataSource = self;
    rechargeTable.delegate = self;
    rechargeTable.scrollEnabled = NO;
    rechargeTable.backgroundColor = [UIColor getColor:@"E5E5E5"];
    [self.view addSubview:rechargeTable];
    //去掉表格顶部空白部分
    rechargeTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, rechargeTable.bounds.size.width, 0.01f)];
    
    contenView = [[UIView alloc]init];
    contenView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contenView];
    
    rechargeText = [[UITextField alloc]init];
    rechargeText.delegate = self;
    rechargeText.placeholder = @"   请输入充值金额";
    [rechargeText setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
    [rechargeText setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    rechargeText.layer.borderWidth = 1;
    rechargeText.layer.borderColor = [UIColor lightGrayColor].CGColor;
    rechargeText.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    rechargeText.keyboardType = UIKeyboardTypeNumberPad;
//    contentText.layer.cornerRadius = 6;
//    contentText.backgroundColor = [UIColor whiteColor];
    rechargeText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [contenView addSubview:rechargeText];
    
    rechargeBtn = [[UIButton alloc]init];
    [rechargeBtn addTarget:self action:@selector(rechargeBtnPress) forControlEvents:UIControlEventTouchUpInside];
    rechargeBtn.backgroundColor = [UIColor getColor:@"4DB748"];
    [rechargeBtn setTitle:@"充值" forState:UIControlStateNormal];
    [rechargeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [contenView addSubview:rechargeBtn];
    
    rechargeTable.sd_layout
    .widthIs(viewWidth)
    .heightIs(viewHeight);
    
    contenView.sd_layout
    .bottomSpaceToView(self.view,0)
    .widthIs(viewWidth)
    .heightIs(60);
    
    rechargeText.sd_layout
    .topSpaceToView(contenView,10)
    .leftSpaceToView(contenView,10)
    .rightSpaceToView(contenView,80)
    .heightIs(40);
    
    rechargeBtn.sd_layout
    .topSpaceToView(contenView,10)
    .leftSpaceToView(rechargeText,10)
    .rightSpaceToView(contenView,10)
    .heightIs(40);
    
}

//充值按钮
 - (void)rechargeBtnPress
{
    
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
    
    return 2;
    
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
    }
    cell.textLabel.attributedText = [self createRiviewAttributedPriceString:@"充 " AndStringTwo:@"  500"];
    UILabel *songLbl = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 80, 30)];
    songLbl.attributedText = [self createRiviewAttributedPriceString:@"送 " AndStringTwo:@"  200"];
    [cell addSubview:songLbl];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OnlineRechargeViewController *onlineTable = [[OnlineRechargeViewController alloc]init];
    onlineTable.title = @"在线充值";
    [self.navigationController pushViewController:onlineTable animated:YES];
}

- (NSMutableAttributedString *)createRiviewAttributedPriceString:(NSString *)strOne AndStringTwo:(NSString *)strTwo
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",strOne,strTwo]];
    NSInteger locationIndex = strOne.length;
    NSInteger lengthIndex = strTwo.length;
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor getColor:@"606060"] range:NSMakeRange(0,locationIndex)];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0,locationIndex)];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(locationIndex,lengthIndex)];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor getColor:@"50B74A"] range:NSMakeRange(locationIndex,lengthIndex)];
    return attString;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    
    [textField resignFirstResponder];

    return YES;
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
