//
//  PayViewController.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "PayViewController.h"
#import "PayFirstTableViewCell.h"
#import "PayCell.h"

@interface PayViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong) UIButton *payCommit;
//判断支付宝Or微信支付
@property(nonatomic,assign) int count;
@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付订单";
    HaHaHaAddBackGroundImage
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    self.count = 10;
    [self createPayCommitBtn];
}
-(void)createPayCommitBtn{
    self.payCommit = [[UIButton alloc]init];
    [_tableView addSubview:self.payCommit];
    self.payCommit.frame = CGRectMake(10, 300, kScreenWidth-20, 44);
    self.payCommit.layer.cornerRadius = 5;
    self.payCommit.backgroundColor = COLOR;
    [self.payCommit setTitle:@"确认支付" forState:UIControlStateNormal];
    [self.payCommit addTarget:self action:@selector(payCommitBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}
/**
 *  确认付款
 *
 */
-(void)payCommitBtnClicked:(UIButton *)button{
    
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


#pragma  mark tableViewDelegate and DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 80;
    }
    return 50.0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section == 0?1:2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        static NSString *CellIdentifier = @"FirstCell";
        BOOL nibsRegistered = NO;
        if (!nibsRegistered) {
            UINib *nib = [UINib nibWithNibName:NSStringFromClass([PayFirstTableViewCell class]) bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
            nibsRegistered = YES;
        }
        PayFirstTableViewCell *cell = (PayFirstTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled = NO;
        return cell;
    }
    else
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
            //            cell.image.image = [UIImage imageNamed:@"UMS_alipay_off"];
            
        }else
        {
            cell.name.text = @"微信支付";
            cell.content.text = @"推荐安装微信5.0及以上版本的用户使用";
            //            cell.image.image = [UIImage imageNamed:@"UMS_wechat_icon"];
        }
        
        
        return cell;
    }
    
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
