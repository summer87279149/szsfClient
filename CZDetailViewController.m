//
//  CZDetailViewController.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "CZDetailViewController.h"
#import "PayCell.h"
@interface CZDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *rechargeTable;
    UIButton *button;
    UILabel *price;
}
//判断支付宝Or微信支付
@property(nonatomic,assign) int count;
@end

@implementation CZDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    HaHaHaAddBackGroundImage
    self.navigationItem.title = @"充值";
    price = [UILabel sharedWithFont:17 andColor:COLOR andAnligment:center andBackgroundColor:nil];
    price.text = [NSString stringWithFormat:@"充值金额为¥ %d",self.money];
    [self.view addSubview:price];
    price.sd_layout.centerXEqualToView(self.view).yIs(0).widthIs(kScreenWidth).heightIs(30);
    
    rechargeTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth, kScreenHeight-94) style:UITableViewStyleGrouped];
    rechargeTable.dataSource = self;
    rechargeTable.delegate = self;
    rechargeTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    rechargeTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:rechargeTable];
    self.count = 10;

    button = [[UIButton alloc]initWithFrame:CGRectMake(10, 220, kScreenWidth-20, 40)];
    [button addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:COLOR];
    button.layer.cornerRadius = 5;
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [rechargeTable addSubview:button];
    
    



}
/**
 *  发起支付宝或者微信
 *
 */
-(void)BtnClicked:(UIButton *)button{
    if (self.count ==0) {
        [MBProgressHUD showSuccess:@"发起支付宝支付请求"];
        /**
         *  支付宝支付
         *
         */
    }else if (self.count == 1){
        [MBProgressHUD showSuccess:@"发起微信支付请求"];
        /**
         *  微信支付
         *
         */
    }else{
        [MBProgressHUD showError:@"请选择一种支付方式"];
        return;
    }
}

#pragma mark - UItableView delegate

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
    static NSString *CellIdentifier = @"Cell";
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([PayCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        nibsRegistered = YES;
    }
    PayCell *cell = (PayCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.view.layer.cornerRadius = 10;
    cell.view.layer.borderWidth = 1;
    if(indexPath.row==0){
        cell.name.text = @"支付宝支付";
        cell.content.text = @"推荐有支付宝账号的用户使用";
    }else
    {
        cell.name.text = @"微信支付";
        cell.content.text = @"推荐安装微信5.0及以上版本的用户使用";
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PayCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.view.backgroundColor = COLOR;
    if (indexPath.row == 0) {
        self.count = 0;
    }
    else if (indexPath.row ==1 ){
        self.count = 1;
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
