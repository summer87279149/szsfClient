//
//  OrderViewController.m
//  foot
//
//  Created by Admin on 16/8/14.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "MainNavViewController.h"
#import "KeyInputView.h"
#import "OrderViewController.h"
#import "GoodsNumber.h"
#import "OrderAddressViewController.h"
#import "UserTool.h"
#import "PayServiceViewController.h"

@interface OrderViewController ()<GoodsNumberDelegate,UITextFieldDelegate>
{
    UIScrollView * scrollView;
    GoodsNumber *goods;
    UITextField *contenText;
    UIView *contenView;
    UIView *viewThird;
    UIButton *complish;
    BOOL isToShop;
}
@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,strong)UIButton *datepickerBtn;
@property(nonatomic,strong)UIButton *placeholderBtn;
@property(nonatomic,strong) NSDate *getDate;
@property(nonatomic,strong)UIView *view3;
@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"提交订单";
    HaHaHaAddBackGroundImage
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollEnabled = YES;
    scrollView.bounces = YES;
    [self.view addSubview:scrollView];
    

    [self createTopView];
    [self createSecondView];
    //服务方式
    [self createThirdView];
    [self createDataPicker];
    [self createKeyInputView];
}
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self.phoneNumber resignFirstResponder];
    [contenText resignFirstResponder];
    return YES;
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    complish.hidden=NO;
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == contenText) {
        complish.hidden=YES;
    }
    if (textField == self.phoneNumber) {

    }
}
#pragma mark datePicker
-(void)createDataPicker{
    //创建日期
    NSCalendar *calender=[NSCalendar currentCalendar];
    NSDate *now=[NSDate date];
    NSDateComponents *components=[calender components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|kCFCalendarUnitHour fromDate:now];
    //开始日期
    NSDate* startDate=[calender dateFromComponents:components];
    //结束日期
    NSDate *enDate=[calender dateByAddingUnit:NSCalendarUnitDay value:3 toDate:startDate options:0];
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, kScreenHeight+100,kScreenWidth, 250*k_scale)];
    self.datePicker.backgroundColor= [UIColor whiteColor];
    NSInteger a =60;
    self.datePicker.minuteInterval =a;
    self.datePicker.minimumDate=startDate;
    self.datePicker.maximumDate=enDate;
    [self.view addSubview: self.datePicker];
    self.datepickerBtn = [[UIButton alloc]init];
    self.datepickerBtn.frame = CGRectMake(0, kScreenHeight+100,kScreenWidth, 250*k_scale);
    [self.datepickerBtn setBackgroundColor:[UIColor whiteColor]];
    [self.datepickerBtn setTitleColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.datepickerBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.datepickerBtn addTarget:self action:@selector(pickerComplete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.datepickerBtn];
    self.placeholderBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-25*k_scale-250*k_scale)];
    [self.placeholderBtn setBackgroundColor:[UIColor lightGrayColor]];
    self.placeholderBtn.alpha = 0.3;
    [self.placeholderBtn addTarget:self action:@selector(pickerComplete) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)selectDate{
    [UIView animateWithDuration:0.3 animations:^{
        self.datePicker.frame = CGRectMake(0, kScreenHeight-250*k_scale,kScreenWidth, 250*k_scale);
        self.datepickerBtn.frame = CGRectMake(0, kScreenHeight-250*k_scale-25*k_scale, kScreenWidth, 25*k_scale);

        [self.view addSubview:self.placeholderBtn];
    } completion:^(BOOL finished) {
        
    }];
}
-(void)pickerComplete{
    [UIView animateWithDuration:0.15 animations:^{
        self.datePicker.frame = CGRectMake(0, kScreenHeight+100,kScreenWidth, 250*k_scale);
        self.datepickerBtn.frame = CGRectMake(0, kScreenHeight+100,kScreenWidth, 250*k_scale);
        //        self.placeholderBtn.frame = CGRectMake(0, kScreenHeight+600,kScreenWidth, kScreenHeight-250*k_scale-25*k_scale);
        [self.placeholderBtn removeFromSuperview];
    } completion:^(BOOL finished) {
        if(self.getDate==nil){
            self.getDate = [NSDate date];
        }
        //得到UIdatepicker的时间
        self.getDate = self.datePicker.date;
        NSString *dateString = [self  dateToString:self.datePicker.date];
        self.ToMyHomeTimeLabel.text = [NSString stringWithFormat:@"%@",dateString];
    }];
}
- (NSString *)dateToString:(NSDate *)date {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}
#pragma mark createViews
-(void)createTopView{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth, 44*3)];
    [scrollView addSubview:view1];
    view1.backgroundColor = [UIColor clearColor];
    view1.layer.borderWidth = 1;
    view1.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"height130"]];
    image.frame = view1.bounds;
    [view1 addSubview:image];
    
    self.projectName = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    self.projectName.text = self.projectModal.projectName;
    [view1 addSubview:self.projectName];
    self.projectName.frame = CGRectMake(10, 12, kScreenWidth, 20);
    
    UIView *lineview1 = [UIView lineWithColor:[UIColor lightGrayColor]];
    [view1 addSubview:lineview1];
    lineview1.frame = CGRectMake(10, 44, kScreenWidth, 1);
    
    UILabel *num = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [view1 addSubview:num];
    num.frame = CGRectMake(10, 56, kScreenWidth, 20);
    num.text = @"数量:";
    
    goods = [[GoodsNumber alloc]init];
    [view1 addSubview:goods];
    goods.delegate = self;
    goods.sd_layout.centerYEqualToView(num).rightSpaceToView(view1,10).widthIs(100).heightIs(30);
    
    
    UIView *lineview2 = [UIView lineWithColor:[UIColor lightGrayColor]];
    [view1 addSubview:lineview2];
    lineview2.frame = CGRectMake(10, 44*2, kScreenWidth, 1);
    
    UILabel *XJ = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [view1 addSubview:XJ];
    XJ.frame = CGRectMake(10, 100, kScreenWidth, 20);
    XJ.text = @"小计";
    
    self.projectPrice = [UILabel sharedWithFont:13 andColor:[UIColor redColor] andAnligment:right andBackgroundColor:nil];
    [view1 addSubview:self.projectPrice];
    self.projectPrice.sd_layout.rightSpaceToView(view1,10).topSpaceToView(lineview2,12).heightIs(20).widthIs(100);
    [self countPrice];
    
}
-(void)countPrice{
    float totalPrice = [self.projectModal.price floatValue]*goods.counts;
    self.projectPrice.text = [NSString stringWithFormat:@"%.2f",totalPrice];
}
-(void)createSecondView{
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 44*3+20, kScreenWidth, 44*2)];
    view2.backgroundColor = [UIColor clearColor];
    view2.layer.borderWidth = 1;
    view2.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [scrollView addSubview:view2];
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"height90"]];
    image.frame = view2.bounds;
    [view2 addSubview:image];
    
    UILabel *yourPhoneNumber = [UILabel sharedWithFont:13 andColor:[UIColor lightGrayColor] andAnligment:left andBackgroundColor:nil];
    yourPhoneNumber.frame = CGRectMake(10, 12, kScreenWidth-20, 20);
    [view2 addSubview:yourPhoneNumber];
    
    yourPhoneNumber.text = @"在下面输入您的手机号码:";
    yourPhoneNumber.textColor = COLOR;
    
    UIView *lineView = [UIView lineWithColor:[UIColor lightGrayColor]];
    [view2 addSubview:lineView];
    lineView.frame = CGRectMake(10, 44, kScreenWidth-20, 1);
    
    self.phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(10, 56, kScreenWidth-20, 20)];
    [view2 addSubview:self.phoneNumber];
    if ([YCUserModel phoneNumber]) {
       self.phoneNumber.text = [YCUserModel phoneNumber];
    }
   
    self.phoneNumber.borderStyle = UITextBorderStyleNone;
    self.phoneNumber.keyboardType = UIKeyboardTypeNumberPad;
    
}

-(void)createThirdView{
    
    viewThird = [[UIView alloc]init];
    viewThird.frame = CGRectMake(0, 44*3+20+44*2+10, kScreenWidth, 44*2);
    [scrollView addSubview: viewThird];
    viewThird.backgroundColor = [UIColor clearColor];
    viewThird.layer.borderWidth = 1;
    viewThird.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"height90"]];
    image.frame = CGRectMake(0, 0, kScreenWidth, 88);
    [viewThird addSubview:image];
    
    
    UILabel *choose = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [viewThird addSubview:choose];
    choose.text = @"请选择服务方式";
    choose.frame = CGRectMake(10, 12, kScreenWidth-20, 20);
    
    self.toShopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.toShopBtn setImage:[UIImage imageNamed:@"check_1"] forState:UIControlStateNormal];
    [self.toShopBtn setImage:[UIImage imageNamed:@"check"] forState:UIControlStateSelected];
    self.toShopBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.toShopBtn setTitle:@"到店服务" forState:UIControlStateNormal];
    [self.toShopBtn setTitle:@"到店服务" forState:UIControlStateSelected];
    [self.toShopBtn setTitleColor:COLOR forState:UIControlStateNormal];
    [self.toShopBtn addTarget:self action:@selector(toShopBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewThird addSubview:self.toShopBtn];
    self.toShopBtn.selected = YES;
    self.toShopBtn.frame = CGRectMake(10, 46, (kScreenWidth-20)/2, 30);
    isToShop = YES;
    
    self.ToMyHomeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.ToMyHomeBtn setImage:[UIImage imageNamed:@"check_1"] forState:UIControlStateNormal];
    [self.ToMyHomeBtn setImage:[UIImage imageNamed:@"check"] forState:UIControlStateSelected];
    [self.ToMyHomeBtn setTitle:@"上门服务" forState:UIControlStateNormal];
    [self.ToMyHomeBtn setTitle:@"上门服务" forState:UIControlStateSelected];
    self.ToMyHomeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.ToMyHomeBtn setTitleColor:COLOR forState:UIControlStateNormal];
    [self.ToMyHomeBtn addTarget:self action:@selector(toMyHomeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [viewThird addSubview:self.ToMyHomeBtn];
    self.ToMyHomeBtn.sd_layout.heightIs(30).widthIs((kScreenWidth-20)/2).rightSpaceToView(viewThird,10).centerYEqualToView(self.toShopBtn);
    
    if ([self.projectModal.isToMyHome isEqualToString:@"0"]) {
        self.ToMyHomeBtn.hidden = YES;
    }
    
    
    
    
    
    
    self.commitOrderBtn = [[UIButton alloc]init];
    self.commitOrderBtn.backgroundColor = COLOR;
    [self.commitOrderBtn setTitle:@"确认预约" forState:UIControlStateNormal];
    self.commitOrderBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    self.commitOrderBtn.layer.cornerRadius = 5;
    [self.commitOrderBtn addTarget:self action:@selector(commitOrderBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:self.commitOrderBtn];
    self.commitOrderBtn.frame = CGRectMake(10, kScreenHeight-45-80, kScreenWidth-20, 44);
    
    
}

-(void)createAddress{
    self.view3 = [[UIView alloc]init];
    self.view3.frame = CGRectMake(0, 44*3+20+44*2+10+88+10, kScreenWidth, 44*5+10);
    [scrollView addSubview:self.view3];
    self. view3.backgroundColor = [UIColor clearColor];
    self. view3.layer.borderWidth = 1;
    self. view3.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"height242"]];
    image.frame = CGRectMake(0, 0, kScreenWidth, 44*5+10);
    [self.view3 addSubview:image];
    
    
    UILabel *choose = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [self.view3 addSubview:choose];
    choose.text = @"选择服务时间";
    choose.frame = CGRectMake(10, 12, kScreenWidth-20, 20);
    choose.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureEvent:)];
    [choose addGestureRecognizer:tapGesture];
    
    UIView *line = [UIView lineWithColor:[UIColor lightGrayColor]];
//    [self.view3 addSubview:line];
    line.sd_layout.heightIs(1).xIs(10).widthIs(kScreenWidth-20).topSpaceToView(choose,0);
    
    self.ToMyHomeTimeLabel = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [self.view3 addSubview:self.ToMyHomeTimeLabel];
    self.ToMyHomeTimeLabel.frame = CGRectMake(10, 44, kScreenWidth-20, 20);
    
    UIButton *chooseTimeButton = [[UIButton alloc]init];
    chooseTimeButton.backgroundColor = [UIColor clearColor];
//    chooseTimeButton.alpha = 0.5;
    [chooseTimeButton addTarget:self action:@selector(tapGestureEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view3 addSubview:chooseTimeButton];
    chooseTimeButton.frame = CGRectMake(10, 12, kScreenWidth-20, 52);
    
    
    
    UIView *line2 = [UIView lineWithColor:[UIColor lightGrayColor]];
    [self.view3 addSubview:line2];
    line2.sd_layout.heightIs(1).xIs(10).widthIs(kScreenWidth-20).topSpaceToView(self.ToMyHomeTimeLabel,12);
    
    UILabel *choose2 = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [self.view3 addSubview:choose2];
    choose2.text = @"选择服务地址";
    choose2.sd_layout.topSpaceToView(line2,12).heightIs(20).xIs(10).widthIs(kScreenWidth-20);
    choose2.userInteractionEnabled = YES;
    //选择地址手势
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapChooseAdd:)];
    [choose2 addGestureRecognizer:tapGesture2];
    
 
    UIView *line3 = [UIView lineWithColor:[UIColor lightGrayColor]];
//    [self.view3 addSubview:line3];
    line3.sd_layout.heightIs(1).xIs(10).widthIs(kScreenWidth-20).topSpaceToView(choose2,0);
    
    self.ToMyHomeAddLabel = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [self.view3 addSubview:self.ToMyHomeAddLabel];
    self.ToMyHomeAddLabel.sd_layout.topSpaceToView(choose2,12).xIs(10).widthIs(kScreenWidth-20).heightIs(20);
    
    //选择地址按钮
    UIButton *chooseAddButton = [[UIButton alloc]init];
    chooseAddButton.backgroundColor = [UIColor clearColor];
//    chooseAddButton.alpha = 0.5;
    [chooseAddButton addTarget:self action:@selector(tapChooseAdd:) forControlEvents:UIControlEventTouchUpInside];
    [self.view3 addSubview:chooseAddButton];
    chooseAddButton.sd_layout.topSpaceToView(line2,12).xIs(10).widthIs(kScreenWidth-20).heightIs(50);
    
    
    UIView *line4 = [UIView lineWithColor:[UIColor lightGrayColor]];
    [self.view3 addSubview:line4];
    line4.sd_layout.heightIs(1).xIs(10).widthIs(kScreenWidth-20).topSpaceToView(self.ToMyHomeAddLabel,12);
    
    
    UILabel *choose3 = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [self.view3 addSubview:choose3];
    choose3.text = @"请补充详细地址";
    choose3.sd_layout.topSpaceToView(line4,12).heightIs(20).xIs(10).widthIs(kScreenWidth-20);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignfirstReco)];
    [choose3 addGestureRecognizer:tap];
    
    complish = [[UIButton alloc]init];
    [complish setTitle:@"完成" forState:UIControlStateNormal];
    [complish setTitleColor:COLOR forState:UIControlStateNormal];
    complish.layer.cornerRadius = 3;
    complish.layer.borderWidth = 1;
    complish.layer.borderColor = [COLOR CGColor];
    complish.titleLabel.font = [UIFont systemFontOfSize:13];
    [complish addTarget:self action:@selector(resignfirstReco) forControlEvents:UIControlEventTouchUpInside];
    [self.view3 addSubview:complish];
    complish.hidden = YES;
    
    contenView = [[UIView alloc]init];
    contenView.backgroundColor = [UIColor clearColor];
    [self.view3 addSubview:contenView];
    
    contenText = [[UITextField alloc]init];
    contenText.delegate = self;
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    contenText.layer.borderWidth = 1;
    contenText.layer.borderColor = [UIColor lightGrayColor].CGColor;
    contenText.layer.backgroundColor = [[UIColor clearColor] CGColor];
    contenText.placeholder = @"在此输入详细地址,精确到门牌号";
    //    [contenText setScrollEnabled:YES];
    contenText.userInteractionEnabled = YES;
    //    contenText.showsVerticalScrollIndicator = NO;
    contenText.font = [UIFont systemFontOfSize:13];
    //    CGSize size = CGSizeMake(kScreenWidth, 100.0f);
    //    [contenText setContentSize:size];
    [contenView addSubview:contenText];
    
    contenView.sd_layout
    .topSpaceToView(choose3,0)
    .widthIs(viewWidth)
    .heightIs(44);
    
    contenText.sd_layout
    .topSpaceToView(contenView,5)
    .leftSpaceToView(contenView,5)
    .rightSpaceToView(contenView,5)
    .bottomSpaceToView(contenView,5);
    
    complish.sd_layout.centerYEqualToView(choose3).rightSpaceToView(self.view3,10).widthIs(50).heightIs(25);
}

-(void)createKeyInputView{
    KeyInputView *keyView = [KeyInputView keyInputView];
    KeyInputViewBlock keyBlock = ^(KeyInputView *kV) {
        
        [self.view endEditing:YES];
    };
    keyView.keyBlock = keyBlock;
    contenText.inputAccessoryView = keyView;
    self.phoneNumber.inputAccessoryView = keyView;
    
}
#pragma mark Recognizer

-(void)resignfirstReco{
    [contenText resignFirstResponder];
    
}
- (void)tapChooseAdd:(UITapGestureRecognizer *)tap{
    OrderAddressViewController *add = [[OrderAddressViewController alloc]init];
    MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:add];
    [self presentViewController:naVC animated:YES completion:nil];
}
- (void)tapGestureEvent:(UITapGestureRecognizer *)tap{
    [self resignfirstReco];
    [self selectDate];
}
-(void)toShopBtnClicked:(UIButton *)button{
    isToShop = YES;
    self.toShopBtn.selected = !self.toShopBtn.selected;
    if (self.toShopBtn.isSelected) {
        self.ToMyHomeBtn.selected = NO;
        //收起地址栏
        [self removeAddress];
        self.commitOrderBtn.frame = CGRectMake(10, kScreenHeight-45-80, kScreenWidth-20, 44);
    }
    
}


-(void)toMyHomeBtnClicked:(UIButton *)button{
    isToShop = NO;
    self.ToMyHomeBtn.selected = !self.ToMyHomeBtn.selected;
    if (self.ToMyHomeBtn.isSelected) {
        self.toShopBtn.selected = NO;
        //展开地址栏
        [self createAddress];
        self.commitOrderBtn.frame = CGRectMake(10, CGRectGetMaxY(self.view3.frame)+100, kScreenWidth-20, 44);
        [self contentsize];
    }
}
-(void)removeAddress{
    if (self.view3 != nil) {
        [self.view3 removeFromSuperview];
        [self contentsize2];
    }
}
//重设contentSize
-(void)contentsize{
    CGFloat scrollViewHeight = 0.0f;
    for (UIView* view in scrollView.subviews){
        scrollViewHeight += view.frame.size.height;
    }
    [scrollView setContentSize:(CGSizeMake(kScreenWidth, scrollViewHeight+320))];
}
-(void)contentsize2{
    [scrollView setContentSize:(CGSizeMake(kScreenWidth, kScreenHeight*1.1))];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

}


-(void)commitOrderBtnClicked{
    if( ![UserTool isValidateMobile:self.phoneNumber.text])
    {
        [MBProgressHUD showError:@"请输入正确的手机号"];
        return;
    }
    //商品数量
    NSNumber *number = [NSNumber numberWithInt:goods.counts];
    //当选择上门服务时
    if (isToShop == NO) {
        if (self.ToMyHomeTimeLabel.text.length == 0) {
            [MBProgressHUD showError:@"请选择上门服务时间"];
            return;
        }
        if (self.ToMyHomeAddLabel.text.length==0) {
            [MBProgressHUD showError:@"请选择服务地址"];
            return;
        }
        if (contenText.text.length==0) {
            [MBProgressHUD showError:@"请填写详细地址"];
            return;
        }
        
        //地址
        NSString *mainAdd = self.ToMyHomeAddLabel.text;
        NSString *detailAdd = contenText.text;
        NSString *totalAdd = [mainAdd stringByAppendingString:detailAdd];
        NSLog(@"最终地址是:%@",totalAdd);
        NSString *encodeStr = [totalAdd stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *timeStr = [NSString stringWithFormat:@"%@",self.ToMyHomeTimeLabel.text];
        NSLog(@"%@",self.projectModal.projectID);
        NSLog(@"%@",self.projectModal.technicianID);
        NSLog(@"%@",[YCUserModel userId]);
        NSLog(@"%@",number);
        NSLog(@"self.ToMyHomeTimeLabel.text:%@",self.ToMyHomeTimeLabel.text);
        NSLog(@"encodeStr:%@",encodeStr);
        
        NSDictionary *paraDic = @{@"pid":self.projectModal.projectID,
                                  @"tid":self.projectModal.technicianID,
                                  @"userid":[YCUserModel userId],
                                  @"num":number,
                                  @"tel":self.phoneNumber.text,
                                  @"time":timeStr,
                                  @"address":encodeStr
                                  };
        
        [self submitOrderWithPara:paraDic];
    }else{
        NSDictionary *paraDic = @{@"pid":self.projectModal.projectID,
                                  @"tid":self.projectModal.technicianID,
                                  @"userid":[YCUserModel userId],
                                  @"num":number,
                                  @"tel":self.phoneNumber.text,
                                  };
     
        [self submitOrderWithPara:paraDic];
    }
  
   
}
-(void)submitOrderWithPara:(id)para{
    SHOWHUD
    NSLog(@"提交项目订单的参数%@",para);
    WS(weakSelf)
    [SomeOtherRequest submitOrderWithPara:para success:^(id response) {
        NSLog(@"提交项目订单的返回结果是:%@",response);
        HIDEHUD
//        [weakSelf submitOrderSuccess];
        PayServiceViewController *pay = [[PayServiceViewController alloc]init];
        if ([response[@"status"] isEqualToString:@"success"]) {
            pay.orderNumber = response[@"orderID"];
            pay.totalPrice = response[@"totalPrice"];
            [weakSelf.navigationController pushViewController:pay animated:YES];
        }
    } error:^(id response) {
        HIDEHUD
    }];
//    PayViewController *pay = [[PayViewController alloc]init];
//    [self.navigationController pushViewController:pay animated:YES];
}
-(void)submitOrderSuccess{
     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"预约成功" message:@"请等待商家与您联系" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

/**
 *  商品数量＊单价 ＝ 小计
 */
-(void)BtnClicked{
    
    [self countPrice];
}

-(void)modifyAdd:(NSNotification *)note{
    if (note.userInfo[@"city"]==nil||note.userInfo[@"province"]==nil||note.userInfo[@"area"]==nil) {
        return;
    }else{
        self.ToMyHomeAddLabel.text = [NSString  stringWithFormat:@"%@ %@ %@",note.userInfo[@"province"],note.userInfo[@"city"],note.userInfo[@"area"]];
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(modifyAdd:) name:@"chooseAdd" object:nil];
    
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
