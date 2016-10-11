//
//  MineViewController.m
//  FootMassage
//
//  Created by Admin on 16/4/13.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "UserCenterViewController.h"
#import "CZViewController.h"
#import "MyOrderViewController.h"
#import "MineViewController.h"
#import "RechargeViewController.h"
#import "SettingViewController.h"
#import "FeedbackViewController.h"
#import "MyFocusViewController.h"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UITableView *m_mineTtabView;
    NSMutableArray *m_mineArr;
    UIView *headerView;
}
@property (strong, nonatomic) UIImageView *avatarImage;
@property (nonatomic,strong) NSData *avatarImageData;
@property(nonatomic,strong)UILabel *nameLbel;

@property(nonatomic,copy)NSString *imageUrl;

@property(nonatomic,copy)NSString *nickName;

@property(nonatomic,copy)NSString *telNum;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeVCBackgroundImage"]];
    imageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:imageView];
    m_mineArr = [[NSMutableArray alloc]initWithObjects:@"个人信息"/*,@"充值"*/,@"我的关注",@"我的订单",@"我的消息",@"意见反馈",@"设置", nil];
    
//    self.navigationItem.rightBarButtonItem = [self phoneButton];
    
    m_mineTtabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    //m_mineTtabView.style = UITableViewStylePlain;
    m_mineTtabView.dataSource = self;
    m_mineTtabView.delegate = self;
    m_mineTtabView.backgroundView = imageView;
    [self.view addSubview:m_mineTtabView];
    
    m_mineTtabView.sd_layout
    .widthIs(viewWidth)
    .bottomSpaceToView(self.view,0);
    
    headerView = [[UIView alloc]init];
    
    headerView.backgroundColor = [UIColor clearColor];
    
    self.avatarImage = [[UIImageView alloc]init];
    self.avatarImage.backgroundColor = [UIColor getColor:@"3b2935"];
    self.avatarImage.layer.cornerRadius = self.avatarImage.bounds.size.width/2.0;
    self.avatarImage.layer.cornerRadius = 45;
    self.avatarImage.layer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:0.75].CGColor;
    self.avatarImage.layer.borderWidth = 2.0;
    self.avatarImage.clipsToBounds = YES;
    self.avatarImage.contentMode = UIViewContentModeScaleAspectFit;
    [headerView addSubview:self.avatarImage];
    
    UIImageView *topimageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我的"]];
    topimageView.contentMode = UIViewContentModeScaleAspectFit;
    [headerView addSubview:topimageView];
    
    UIButton *headBtn = [[UIButton alloc]init];
    headBtn.backgroundColor = [UIColor clearColor];
//    [headBtn addTarget:self action:@selector(changeImage) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:headBtn];
    
    _nameLbel = [[UILabel alloc]init];
    _nameLbel.backgroundColor = [UIColor clearColor];
    _nameLbel.textColor = [UIColor whiteColor];
    _nameLbel.text = @"";
    _nameLbel.textAlignment = 1;
    [headerView addSubview:_nameLbel];
  /*
    UIView *priceView = [[UIView alloc]init];
    priceView.backgroundColor = [UIColor clearColor];
    [headerView addSubview:priceView];
    
    UILabel *priceLbl = [[UILabel alloc]init];
    priceLbl.backgroundColor = [UIColor clearColor];
    priceLbl.backgroundColor = [UIColor clearColor];
    priceLbl.text = @"金额";
    priceLbl.textAlignment = 0;
    priceLbl.font = [UIFont boldSystemFontOfSize:16];
    [priceView addSubview:priceLbl];
    
    UILabel *priceNumLbl = [[UILabel alloc]init];
    priceNumLbl.backgroundColor = [UIColor clearColor];
    priceNumLbl.textColor = [UIColor getColor:@"3b2935"];
    priceNumLbl.text = @"0元";
    priceNumLbl.font = [UIFont boldSystemFontOfSize:16];
    priceNumLbl.textAlignment = 2;
    [priceView addSubview:priceNumLbl];
    
    UIImageView *lineView = [[UIImageView alloc]init];
    lineView.backgroundColor = [UIColor getColor:@"3b2935"];
    [priceView addSubview:lineView];
    
    UIImageView *lineView2 = [[UIImageView alloc]init];
    lineView2.backgroundColor = [UIColor getColor:@"3b2935"];
    [priceView addSubview:lineView2];
    
    UIImageView *lineView3 = [[UIImageView alloc]init];
    lineView3.backgroundColor = [UIColor getColor:@"3b2935"];
    [priceView addSubview:lineView3];
    
    UILabel *couponLbl = [[UILabel alloc]init];
    couponLbl.backgroundColor = [UIColor clearColor];
    couponLbl.text = @"优惠券";
    couponLbl.textAlignment = 0;
    couponLbl.font = [UIFont boldSystemFontOfSize:16];
    [priceView addSubview:couponLbl];
    
    UILabel *couponNumLbl = [[UILabel alloc]init];
    couponNumLbl.backgroundColor = [UIColor clearColor];
    couponNumLbl.textColor = [UIColor getColor:@"3b2935"];
    couponNumLbl.text = @"0张";
    couponNumLbl.font = [UIFont boldSystemFontOfSize:16];
    couponNumLbl.textAlignment = 2;
    [priceView addSubview:couponNumLbl];
    
   */
    
     //如果需要显示金额和充值的话头部视图170改为200
    headerView.sd_layout
    .widthIs(m_mineTtabView.frame.size.width)
    .heightIs(200);
    
    self.avatarImage.sd_layout
    .centerXEqualToView(headerView)
    .topSpaceToView(headerView,120)
    .widthIs(90)
    .heightIs(90);
    
    topimageView.sd_layout
    .centerXEqualToView(headerView)
    .bottomSpaceToView(self.avatarImage,-10)
    .widthIs(100)
    .heightIs(100);
    
    headBtn.sd_layout
    .centerXEqualToView(headerView)
    .centerYEqualToView(self.avatarImage)
    .widthIs(90)
    .heightIs(90);
    
    _nameLbel.sd_layout
    .centerXEqualToView(headerView)
    .topSpaceToView(self.avatarImage,10)
    .widthIs(viewWidth)
    .heightIs(30);
 /*
    priceView.sd_layout
    .leftSpaceToView(headerView,0)
    .rightSpaceToView(headerView,0)
    .heightIs(40)
    .bottomSpaceToView(headerView,0);
    
    priceLbl.sd_layout
    .leftSpaceToView(priceView,20)
    .centerYEqualToView(priceView)
    .heightIs(30)
    .widthIs(80);
    
    lineView.sd_layout
    .leftSpaceToView(priceView,viewWidth/2)
    .centerYEqualToView(priceLbl)
    .heightIs(40)
    .widthIs(1);
    
    lineView2.sd_layout
    .bottomSpaceToView(lineView,1)
    .heightIs(1)
    .widthIs(kScreenWidth);
    
    lineView3.sd_layout
    .topSpaceToView(lineView,1)
    .heightIs(1)
    .widthIs(kScreenWidth);
    
    priceNumLbl.sd_layout
    .rightSpaceToView(lineView,10)
    .centerYEqualToView(priceView)
    .heightIs(30)
    .widthIs(90);
    
    couponLbl.sd_layout
    .leftSpaceToView(lineView,10)
    .centerYEqualToView(priceView)
    .heightIs(30)
    .widthIs(90);
    
    couponNumLbl.sd_layout
    .rightSpaceToView(priceView,10)
    .centerYEqualToView(priceView)
    .heightIs(30)
    .widthIs(90);
   */
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self getRequestData];
}


- (UIBarButtonItem *)phoneButton
{
    UIImage *image = [UIImage imageNamed:@"phoneW.png"];
    CGRect buttonFrame = CGRectMake(0, 0,35, 35);
    
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(phoneView) forControlEvents:UIControlEventTouchUpInside];
    //    [button setTitle:@"电话" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    button.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,0);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

- (void)phoneView
{
    NSString *phoneNum = @"4006767235";// 电话号码
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];   [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}
#pragma mark - http
-(void)getRequestData{
    WS(weakSelf)
    [SomeOtherRequest GetMineInfoWithUserID:[YCUserModel userId] success:^(id response) {
        NSLog(@"‘我的’页面返回数据:%@",response);
        weakSelf.imageUrl = [NSString stringWithFormat:@"%@",response[@"headimgurl"]];
        weakSelf.nickName = [NSString stringWithFormat:@"%@",response[@"nickname"]];
        weakSelf.telNum = [NSString stringWithFormat:@"%@",response[@"tel"]];
        
        [weakSelf.avatarImage sd_setImageWithURL:URLWITHSTRING(response[@"headimgurl"])];
        weakSelf.nameLbel.text = response[@"nickname"];
    } error:^(id response) {
        
    }];
}
#pragma mark - UItableView delegate
//设置表头
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 250;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [m_mineArr count];
    
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
    
    cell.textLabel.text = [m_mineArr objectAtIndex:indexPath.row];
    //    cell.imageView.image = [UIImage imageNamed:[m_mineArr objectAtIndex:indexPath.row]];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.imageView.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[m_mineArr objectAtIndex:indexPath.row] isEqualToString:@"充值"])
    {
        CZViewController *rechargeCtr = [[CZViewController alloc]init];
        rechargeCtr.title = @"充值";
        [self.navigationController pushViewController:rechargeCtr animated:YES];
    }
    else if([[m_mineArr objectAtIndex:indexPath.row] isEqualToString:@"意见反馈"])
    {
        FeedbackViewController *feedbackCtr = [[FeedbackViewController alloc]init];
        feedbackCtr.title = @"意见反馈";
        [self.navigationController pushViewController:feedbackCtr animated:YES];
    }
    else if([[m_mineArr objectAtIndex:indexPath.row] isEqualToString:@"设置"])
    {
        SettingViewController *setCtr = [[SettingViewController alloc]init];
        setCtr.title = @"设置";
        [self.navigationController pushViewController:setCtr animated:YES];
    }
    else if([[m_mineArr objectAtIndex:indexPath.row] isEqualToString:@"我的关注"])
    {
        MyFocusViewController *fucu = [[MyFocusViewController alloc]init];
        [self.navigationController pushViewController:fucu animated:YES];
    }
    else if([[m_mineArr objectAtIndex:indexPath.row] isEqualToString:@"我的订单"])
    {
        MyOrderViewController *orderVC = [[MyOrderViewController alloc]init];
        [self.navigationController pushViewController:orderVC animated:YES];
    }
    else if([[m_mineArr objectAtIndex:indexPath.row] isEqualToString:@"个人信息"])
    {
        UserCenterViewController *orderVC = [[UserCenterViewController alloc]init];
        orderVC.imageUrl = self.imageUrl;
        orderVC.nickName = self.nickName;
        orderVC.telNum = self.telNum;
        [self.navigationController pushViewController:orderVC animated:YES];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
