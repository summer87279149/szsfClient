//
//  UserLoginController.m
//  都市摇摇看
//
//  Created by admin on 15/12/4.
//  Copyright © 2015年 hackcc. All rights reserved.
//
#import "AppDelegate.h"
#import "XTRequestManager.h"
#import "UserLoginController.h"
#import "UserRegisterController.h"
#import "UserTool.h"
#import "KeyInputView.h"
#import "AppDelegate.h"
#import "FindPwdViewController.h"
#import "MainTabBarController.h"
#import "JPUSHService.h"
@interface UserLoginController ()<UITextFieldDelegate>

// 手机号
@property (weak, nonatomic) IBOutlet UITextField *phoneNumText;

// 密码
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

// 显示密码
@property (weak, nonatomic) IBOutlet UIButton *showPasswordBtn;

// 登录
@property (weak, nonatomic) IBOutlet UIButton *loginBtnClick;

@property (weak, nonatomic) IBOutlet UIButton *QQBtn;

@property (weak, nonatomic) IBOutlet UIButton *WXBtn;

@property (assign, nonatomic) BOOL isKey;

@end

@implementation UserLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
       self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.QQBtn.hidden = YES;
    self.WXBtn.hidden = YES;
    [self initUserLoginView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
//-(void)setIsLoginOut:(int)isLoginOut{
//    [[self.navigationController.navigationBar.subviews objectAtIndex:1] setHidden:YES];
//    self.isLoginOut = isLoginOut;
//}
// 初始化登录页面
- (void)initUserLoginView {
    self.navigationItem.title = @"登入";
    self.passwordText.delegate = self;
    
    self.phoneNumText.delegate = self;
    
    KeyInputView *keyView = [KeyInputView keyInputView];
    
    KeyInputViewBlock keyBlock = ^(KeyInputView *kV) {
        
        [self.view endEditing:YES];
    };
    
    keyView.keyBlock = keyBlock;
    
    self.passwordText.inputAccessoryView = keyView;
    
    self.phoneNumText.inputAccessoryView = keyView;
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    
    registerBtn.frame = CGRectMake(0, 0, 50, 40);
    
    [registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *registerBar = [[UIBarButtonItem alloc] initWithCustomView:registerBtn];
    self.navigationItem.rightBarButtonItem = registerBar;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

// 显示密码
- (IBAction)showPassWordClick:(UIButton *)sender {
    
    self.showPasswordBtn.selected = !self.showPasswordBtn.selected;
    
    if (self.showPasswordBtn.selected) {
        
        [self.passwordText setSecureTextEntry:NO];
        
        [self.showPasswordBtn setTitle:@"隐藏密码" forState:UIControlStateNormal];
        
    }else {
        
        [self.passwordText setSecureTextEntry:YES];
        
        [self.showPasswordBtn setTitle:@"显示密码" forState:UIControlStateNormal];
        
    }
    
    
}

// 登录
- (IBAction)loginBtnClick:(UIButton *)sender {
    
    BOOL res = [UserTool isValidateMobile:self.phoneNumText.text];
    NSString *phoneNumber = self.phoneNumText.text;
    NSString *password = self.passwordText.text;
    if (res) {
        SHOWHUD

        [SomeOtherRequest loginWithPhoneNumber:phoneNumber password:password success:^(id response) {
            HIDEHUD
            NSLog(@"%@",response);
            if ([response[@"status"] isEqualToString:@"success"]) {
                YCUserModel *User = [YCUserModel shareManager];
                User.userId = response[@"userid"];
                [User save];
                [MBProgressHUD showSuccess:response[@"msg"]];
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"UserInfoChanged" object:nil];
                [JPUSHService setTags:nil alias:User.userId callbackSelector:nil object:nil];
                    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
  
              
            }else{
                [MBProgressHUD showError:response[@"msg"]];
            }
        } error:^(id response) {
            HIDEHUD
            [UserTool alertViewDisplayTitle:nil andMessage:@"登入失败，请检查网络连接" andDisplayValue:1.];
        }];
    }else {
        [UserTool alertViewDisplayTitle:nil andMessage:@"请输入正确手机号" andDisplayValue:1.];
    }
}

// 找回密码
- (IBAction)findPasswordClick:(UIButton *)sender {
    FindPwdViewController *find = [[FindPwdViewController alloc]init];
    [self.navigationController pushViewController:find animated:YES];
}


- (void)registerBtnClick:(UIButton *)btn {
    [self.view endEditing:YES];
    [self.view resignFirstResponder];
    [_passwordText endEditing:YES];
    [_passwordText resignFirstResponder];
    UserRegisterController *regVC = [[UserRegisterController alloc] init];
    [self.navigationController pushViewController:regVC animated:YES];
}

#pragma mark textField代理
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == self.phoneNumText) {
        
        if (range.location > 10) {
            
            return NO;
        }
        
    }else if (textField == self.passwordText) {
        
        if (range.location > 15) {
            
            return NO;
        }
        
    }
    
    return YES;
}

// 键盘出现时调用
- (void)keyboardWillShow:(NSNotification *)aNotification {
    
    NSDictionary *userInfo = [aNotification userInfo];
    
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    
    CGRect keyboarRect = [aValue CGRectValue];
    
    int height = keyboarRect.size.height;
    
    if (!self.isKey) {
        
        self.isKey = YES;
        
        [UIView animateWithDuration:1. animations:^{
            
            CGRect rect = self.view.frame;
            
            rect.origin.y -= height * 0.4;
            
            self.view.frame = rect;
            
        }];
    }
    
    
    
}

// 键盘退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification {
    
    NSDictionary *userInfo = [aNotification userInfo];
    
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    
    CGRect keyboarRect = [aValue CGRectValue];
    
    int height = keyboarRect.size.height;
    
    if (self.isKey) {
        
        self.isKey = NO;
        
        [UIView animateWithDuration:1. animations:^{
            
            CGRect rect = self.view.frame;
            
            rect.origin.y += height * 0.4;
            
            self.view.frame = rect;
            
        }];
        
    }
    
}

#pragma mark 第三方登录

- (IBAction)sinaLoginClick:(UIButton *)sender {
    

    
}
- (IBAction)qqLoginClick:(UIButton *)sender {
    
    
}
- (IBAction)winXinLoginClick:(UIButton *)sender {
    
   
        
  
}

@end
