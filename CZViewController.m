//
//  CZViewController.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "CZViewController.h"
#import "CZDetailViewController.h"
@interface CZViewController ()<UITextFieldDelegate>
{
    UITextField *rechargeText;
    UIButton *rechargeBtn;
    int keyBoardHeight;
    UIView *contenView;
}


@end

@implementation CZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
   
    
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
    rechargeBtn.backgroundColor = COLOR;
    [rechargeBtn setTitle:@"充值" forState:UIControlStateNormal];
    [rechargeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [contenView addSubview:rechargeBtn];
    
    
    contenView.sd_layout
    .topSpaceToView(self.view,0)
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
    if ([rechargeText.text intValue]) {
        if ([rechargeText.text intValue]<=0) {
            [MBProgressHUD showError:@"请输入正确的整数金额"];
        }
        CZDetailViewController *CZD = [[CZDetailViewController alloc]init];
        CZD.money = [rechargeText.text intValue];
        [self.navigationController pushViewController:CZD animated:YES];

    }else{
        [MBProgressHUD showError:@"请输入正确的金额"];
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
