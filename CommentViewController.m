//
//  CommentViewController.m
//  foot
//
//  Created by Admin on 16/8/15.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "CommentViewController.h"
#import "TQStarRatingView.h"
@interface CommentViewController ()<StarRatingViewDelegate,UITextViewDelegate>
{
    TQStarRatingView *star;
    UITextView *textview;
    UIView *contenView;
    UILabel *wordCount;
    UILabel *projectName;
}
@property(nonatomic,assign)float socre;
@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
    [self createBtn];
    [self createTextView];

}
-(void)createBtn{
    
    projectName = [UILabel sharedWithFont:14 andColor:COLOR andAnligment:center andBackgroundColor:nil];
    projectName.frame = CGRectMake(10, 10, kScreenWidth-20, 20);
    projectName.text = @"清水足浴";
    [self.view addSubview:projectName];
    
    star = [[TQStarRatingView alloc]initWithFrame:CGRectMake(10, 30, kScreenWidth-20, (kScreenWidth-20)/5) numberOfStar:5];
    [star setScore:0.5 withAnimation:NO];
    star.delegate=self;
    self.socre = 0.5;
    [self.view addSubview:star];
}
-(void)createTextView{
    
    contenView = [[UIView alloc]init];
    contenView.backgroundColor = [UIColor getColor:@"E5E5E5"];
    [self.view addSubview:contenView];
    
    textview = [[UITextView alloc]init];
    [self.view addSubview:textview];
    textview = [[UITextView alloc]init];
    textview.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    textview.layer.borderWidth = 1;
    textview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textview.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [textview setScrollEnabled:YES];
    textview.userInteractionEnabled = YES;
    textview.showsVerticalScrollIndicator = YES;
    textview.font = [UIFont systemFontOfSize:15];
    CGSize size = CGSizeMake(kScreenWidth, 100.0f);
    [textview setContentSize:size];
    [contenView addSubview:textview];
    
    wordCount = [UILabel sharedWithFont:12 andColor:COLOR andAnligment:center andBackgroundColor:nil];
    [contenView addSubview:wordCount];
    self.navigationItem.rightBarButtonItem = [self rightButton];
    
    contenView.sd_layout
    .topSpaceToView(self.view,(kScreenWidth-20)/5+40)
    .widthIs(viewWidth)
    .heightIs(kScreenHeight/3);
    
    textview.sd_layout
    .topSpaceToView(contenView,25)
    .leftSpaceToView(contenView,10)
    .rightSpaceToView(contenView,10)
    .bottomSpaceToView(contenView,10);
    
    wordCount.sd_layout
    .topSpaceToView(contenView,0)
    .centerXEqualToView(contenView)
    .widthIs(kScreenWidth).heightIs(25);

}
- (UIBarButtonItem *)rightButton
{
    CGRect buttonFrame = CGRectMake(0, 0,35, 35);
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(submitBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

- (void)submitBtnPress
{
    if(textview.text.length == 0){
        [MBProgressHUD showError:@"请输入评价内容"];
        return;
    }
    WS(weakSelf)
    SHOWHUD
    self.navigationItem.rightBarButtonItem.enabled = NO;
    [SomeOtherRequest commentWithUserid:[YCUserModel userId] orderNum:self.orderNumber stars:self.socre  content:textview.text success:^(id response) {
        NSLog(@"提交评价结果是:%@",response);
        NSDictionary *res = response;
        if ([res[@"status"] isEqualToString:@"success"]) {
            HIDEHUDWeakSelf
            [MBProgressHUD showSuccess:@"评价成功"];
            [SomeOtherRequest makeSureOrderHasCompleted:weakSelf.orderNumber status:@"3" success:^(id response) {
                HIDEHUDWeakSelf
                //评价完成发送通知，刷新我的订单tableview
                [[NSNotificationCenter defaultCenter]postNotificationName:@"commentFinish" object:nil];
                weakSelf.navigationItem.rightBarButtonItem.enabled = YES;
                [weakSelf.navigationController popViewControllerAnimated:YES];
            } error:^(id response) {
            }];
            

        }else{
        HIDEHUDWeakSelf
            [MBProgressHUD showError:response[@"msg"]];
            [SomeOtherRequest makeSureOrderHasCompleted:weakSelf.orderNumber status:@"3" success:^(id response) {
            } error:^(id response) {
            }];
            NSLog(@"评价失败:%@",response[@"msg"]);
        }
        
        
    } error:^(id response) {
        HIDEHUDWeakSelf
        [MBProgressHUD showError:@"评价失败，请检查网络"];
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }];
}

-(void)changeOrderStatus{
    
}
#pragma mark starDelegate
-(void)starRatingView:(TQStarRatingView *)view score:(float)score{
    self.socre = score;
   NSLog(@"star == %f",score);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(range.location > 60){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"输入的自字符数不能超过60"
                                                       delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        
        return NO;
    }else{
//        NSLog(@"%lu",(unsigned long)textview.text.length);
        return YES;
    }
}


- (void)textViewDidChange:(UITextView *)textView{
    int count;
    count = 100.0 - textview.text.length;
    [wordCount setText:[NSString stringWithFormat:@"剩余输入%d字", count]];  //_wordCount是一个显示剩余可输入数字的label
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    [UIMenuController sharedMenuController].menuVisible = NO;  //donot display the menu
    [textview resignFirstResponder];                     //do not allow the user to selected anything
    return NO;
    
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
