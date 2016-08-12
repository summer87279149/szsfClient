//
//  UserRegisterController.m
//  都市摇摇看
//
//  Created by admin on 15/12/4.
//  Copyright © 2015年 hackcc. All rights reserved.
//

#import "UserRegisterController.h"
#import "UserTool.h"
#import "KeyInputView.h"

@interface UserRegisterController ()<UITextFieldDelegate>

// 手机号
@property (weak, nonatomic) IBOutlet UITextField *phoneNumText;

// 验证码
@property (weak, nonatomic) IBOutlet UITextField *testNumText;

// 发送验证码
@property (weak, nonatomic) IBOutlet UIButton *pushTestNumBtn;

// 密码
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

// 显示密码
@property (weak, nonatomic) IBOutlet UIButton *showPasswordBtn;

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (assign, nonatomic) BOOL isKey;

// 注册按钮
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation UserRegisterController

- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    [self initUserRegisterView];
}

// 初始化注册界面
- (void)initUserRegisterView {
    
    self.selectBtn.selected = YES;
    
    self.registerBtn.enabled = self.selectBtn.selected;

    self.passwordText.delegate = self;
    
    self.phoneNumText.delegate = self;
    
    KeyInputView *keyView = [KeyInputView keyInputView];
    
    KeyInputViewBlock keyBlock = ^(KeyInputView *kV) {
    
        [self.view endEditing:YES];
    };
    
    keyView.keyBlock = keyBlock;
    
    self.phoneNumText.inputAccessoryView = keyView;
    
    self.passwordText.inputAccessoryView = keyView;
    
    self.testNumText.inputAccessoryView = keyView;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 发送验证码
- (IBAction)pushTestNumClick:(UIButton *)sender {
}

// 显示密码
- (IBAction)showPasswordClick:(UIButton *)sender {
    
    self.showPasswordBtn.selected = !self.showPasswordBtn.selected;
    
    if (self.showPasswordBtn.selected) {
        
        [self.passwordText setSecureTextEntry:NO];
        
        [self.showPasswordBtn setTitle:@"隐藏密码" forState:UIControlStateNormal];
        
    }else {
        
        [self.passwordText setSecureTextEntry:YES];
        
        [self.showPasswordBtn setTitle:@"显示密码" forState:UIControlStateNormal];
    
    }
    
}

// 显示协议
- (IBAction)agreementClick:(UIButton *)sender {
}

// 同意协议
- (IBAction)selectAgreementClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    self.registerBtn.enabled = sender.selected;
    
}

// 注册
- (IBAction)registerBtnClick:(UIButton *)sender {
    
    // 1.判断是否为手机号
    BOOL res = [UserTool isValidateMobile:self.phoneNumText.text];
    
    if (res) { // 手机号码格式正确
        
        
    }else { // 手机号码格式错误
        
        [UserTool alertViewDisplayTitle:nil andMessage:@"请输入正确手机号" andDisplayValue:1.];
    
    }

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


@end
