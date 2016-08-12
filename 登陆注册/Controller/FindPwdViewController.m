//
//  FindPwdViewController.m
//  都市摇摇看
//
//  Created by Admin on 16/7/28.
//  Copyright © 2016年 hackcc. All rights reserved.
//

#import "FindPwdViewController.h"
#import "UserTool.h"
#import "KeyInputView.h"
#import "MBProgressHUD+MJ.h"
@interface FindPwdViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneNumText;
@property (weak, nonatomic) IBOutlet UITextField *testNumText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *passwordTwo;
@property (weak, nonatomic) IBOutlet UIButton *findBtn;
@property (assign, nonatomic) BOOL isKey;
@end

@implementation FindPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    // Do any additional setup after loading the view from its nib.
    self.title = @"找回密码";
    [self initUserRegisterView];
}
// 初始化注册界面
- (void)initUserRegisterView {
   
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
    
    self.passwordTwo.inputAccessoryView = keyView;
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}



- (IBAction)findbtnClicked:(id)sender {
    
    // 1.验证
    NSString *username = self.phoneNumText.text;
    if (username.length != 11) { // 没有输入用户名
        [MBProgressHUD showError:@"请输入正确的手机号"];
        return;
    }
    
    NSString *pwd = self.passwordText.text;
    if (pwd.length == 0) { // 没有输入密码
        [MBProgressHUD showError:@"请输入密码"];
        return;
    }
    NSString *YZM = self.testNumText.text;
    if (YZM.length == 0) { // 没有输入密码
        [MBProgressHUD showError:@"请输入短信效验码"];
        return;
    }
    
    if(![self.passwordText.text isEqualToString:self.passwordTwo.text])
    {
        [MBProgressHUD showError:@"两次输入密码不一致"];
        
        return;
    }
    
    //下面输入修改密码步骤
    
    
    
    
    
    
    
    
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
