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
#import "MainTabBarController.h"
#import "YinSiViewController.h"
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
@property (weak, nonatomic) IBOutlet UIButton *yinSiButton;

@end

@implementation UserRegisterController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"手机号注册";
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
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 发送验证码
- (IBAction)pushTestNumClick:(UIButton *)sender {
    
    BOOL res = [UserTool isValidateMobile:self.phoneNumText.text];
    
    if (res) { // 手机号码格式正确
        //    业务逻辑
        [self.pushTestNumBtn setTitle:@"正在发送" forState:UIControlStateNormal];
        self.pushTestNumBtn.enabled = NO;
        
        [self codeCountDown];
        [SomeOtherRequest sendVerifyCodeWithPhoneNumber:self.phoneNumText.text success:^(id response) {
            
          
        } error:^(id response) {
 
       
}];
    }else { // 手机号码格式错误
        
        [UserTool alertViewDisplayTitle:nil andMessage:@"请输入正确手机号" andDisplayValue:1.];
        
    }
    
    
        
    
}
//GCD定时器
- (void)codeCountDown
{
    __block int timeout=30; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据需求设置
                [self.pushTestNumBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                self.pushTestNumBtn.enabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.pushTestNumBtn setTitle:[NSString stringWithFormat:@"%@秒",strTime] forState:UIControlStateNormal];
                self.pushTestNumBtn.enabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}









// 显示协议
- (IBAction)agreementClick:(UIButton *)sender {
}

// 同意协议
- (IBAction)selectAgreementClick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    self.registerBtn.enabled = sender.selected;
    
}
-(BOOL)checkPassWord:(NSString *)password
{
    //6-20位数字和字母组成
    NSString *regex = @"^[a-zA-Z0-9]{6,16}$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:password]) {
        return YES ;
    }else
        return NO;
}
- (IBAction)yinSiButtonClicked:(UIButton *)sender {
    YinSiViewController *yinsi = [[ YinSiViewController alloc]init];
    [self.navigationController pushViewController:yinsi animated:YES];
}
// 注册
- (IBAction)registerBtnClick:(UIButton *)sender {
    
    // 1.判断是否为手机号
    if(![UserTool isValidateMobile:self.phoneNumText.text]){
        [UserTool alertViewDisplayTitle:nil andMessage:@"请输入正确手机号" andDisplayValue:1.];
        return;
    }
    if(_testNumText.text.length==0){
        [UserTool alertViewDisplayTitle:nil andMessage:@"请输入验证码" andDisplayValue:1.];

    }
    if (![self checkPassWord:_passwordText.text]) { // 手机号码格式正确
        
     [UserTool alertViewDisplayTitle:nil andMessage:@"请输入正确格式的密码" andDisplayValue:1.];
        return;
    }
    SHOWHUD
    WS(weakSelf)
        [SomeOtherRequest registWith:self.phoneNumText.text password:_passwordText.text smsCode:_testNumText.text success:^(id response) {
            HIDEHUD
            if ([response[@"status"] isEqualToString:@"success"]) {
               [UserTool alertViewDisplayTitle:nil andMessage:response[@"msg"] andDisplayValue:1.];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else{
                [UserTool alertViewDisplayTitle:nil andMessage:response[@"msg"] andDisplayValue:1.];
            }
            
        } error:^(id response) {
            HIDEHUD
            [UserTool alertViewDisplayTitle:nil andMessage:response[@"msg"] andDisplayValue:1.];
        }];
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
