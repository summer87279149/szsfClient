//
//  BuyVC.m
//  foot
//
//  Created by Admin on 16/10/8.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "UserTool.h"
#import "PayViewController.h"
#import "KeyInputView.h"
#import "OrderAddressViewController.h"
#import "MainNavViewController.h"
#import "OrderViewController.h"
#import "BuyVC.h"
#import "BuyVCCell.h"
@interface BuyVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITableView *tableview;
    UITextField *contenText;
    UIView *contenView;
    UIView *viewThird;
    UIButton *complish;
}
@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,strong)UIButton *datepickerBtn;
@property(nonatomic,strong)UIButton *placeholderBtn;
@property(nonatomic,strong) NSDate *getDate;
@property(nonatomic,strong)UIView *view3;
@end

@implementation BuyVC
@synthesize infoArr = infoArr;
- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
    self.navigationItem.title = @"提交订单";
    [self getRequestData];
    [self createTableView];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
-(void)createTableView{
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.tableFooterView = [self creatFootView];
    tableview.tableHeaderView = [self creatHeaderView];
    [self.view addSubview:tableview];
    [self createKeyInputView];
}
-(void)getRequestData{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return infoArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify =  @"indentify";
    BuyVCCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell)
    {
        cell = [[BuyVCCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    //调用方法，给单元格赋值
    [cell addTheValue:infoArr[indexPath.row]];
    
    return cell;
}






-(UIView *)creatFootView{
    UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44*2+44*5+10+300)];
        UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth, 44*2)];
        view2.backgroundColor = [UIColor clearColor];
        view2.layer.borderWidth = 1;
        view2.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        [mainView addSubview:view2];
        
        UIImageView *image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"height90"]];
        image2.frame = view2.bounds;
        [view2 addSubview:image2];
        
        UILabel *yourPhoneNumber = [UILabel sharedWithFont:13 andColor:[UIColor lightGrayColor] andAnligment:left andBackgroundColor:nil];
        yourPhoneNumber.frame = CGRectMake(10, 12, kScreenWidth-20, 20);
        [view2 addSubview:yourPhoneNumber];
        yourPhoneNumber.text = @"您的手机号码";
        yourPhoneNumber.textColor = COLOR;
        
        UIView *lineView = [UIView lineWithColor:[UIColor lightGrayColor]];
        [view2 addSubview:lineView];
        lineView.frame = CGRectMake(10, 44, kScreenWidth-20, 1);
        
        self.phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(10, 56, kScreenWidth-20, 20)];
        [view2 addSubview:self.phoneNumber];
        if ([YCUserModel phoneNumber])
        {
            self.phoneNumber.text = [YCUserModel phoneNumber];
        }
        self.phoneNumber.borderStyle = UITextBorderStyleNone;
        self.phoneNumber.keyboardType = UIKeyboardTypeNumberPad;
        
    
    
   
        self.view3 = [[UIView alloc]init];
        self.view3.frame = CGRectMake(0, 44*2+10+10, kScreenWidth, 44*5+10);
        [mainView addSubview:self.view3];
        self. view3.backgroundColor = [UIColor clearColor];
        self. view3.layer.borderWidth = 1;
        self. view3.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"height242"]];
        image.frame = CGRectMake(0, 0, kScreenWidth, 44*5+10);
        [self.view3 addSubview:image];
        
        
        UILabel *choose2 = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        [self.view3 addSubview:choose2];
        choose2.text = @"点我选择寄送地址";
        choose2.sd_layout.topSpaceToView(self.view3,12).heightIs(20).xIs(10).widthIs(kScreenWidth-20);
        choose2.userInteractionEnabled = YES;
        UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapChooseAdd:)];
        [choose2 addGestureRecognizer:tapGesture2];
        
        UIView *line3 = [UIView lineWithColor:[UIColor lightGrayColor]];
        //    [self.view3 addSubview:line3];
        line3.sd_layout.heightIs(1).xIs(10).widthIs(kScreenWidth-20).topSpaceToView(choose2,0);
        
        self.ToMyHomeAddLabel = [UILabel sharedWithFont:13 andColor:COLOR andAnligment:left andBackgroundColor:nil];
        [self.view3 addSubview:self.ToMyHomeAddLabel];
        self.ToMyHomeAddLabel.sd_layout.topSpaceToView(choose2,12).xIs(10).widthIs(kScreenWidth-20).heightIs(20);
        
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
        contenText.layer.borderWidth = 1;
        contenText.layer.borderColor = [UIColor lightGrayColor].CGColor;
        contenText.layer.backgroundColor = [[UIColor clearColor] CGColor];
        contenText.placeholder = @"在此输入详细地址,精确到门牌号";
        contenText.userInteractionEnabled = YES;
        contenText.font = [UIFont systemFontOfSize:13];
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
        
        complish.sd_layout.centerYEqualToView(choose3).rightSpaceToView(self.view3,10).widthIs(50).heightIs(30);
        
        
        self.commitOrderBtn = [[UIButton alloc]init];
        self.commitOrderBtn.backgroundColor = COLOR;
        [self.commitOrderBtn setTitle:@"提交订单" forState:UIControlStateNormal];
        self.commitOrderBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        self.commitOrderBtn.layer.cornerRadius = 5;
        [self.commitOrderBtn addTarget:self action:@selector(commitOrderBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:self.commitOrderBtn];
        self.commitOrderBtn.sd_layout.topSpaceToView(self.view3,10).xIs(10).widthIs(kScreenWidth-20).heightIs(44);
    
    
    
    return mainView;
    
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
-(UIView *)creatHeaderView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth, 30)];
    label.text = [NSString stringWithFormat:@"总计:  %.2f",self.allPrice];
    label.textAlignment = NSTextAlignmentLeft;
    [view addSubview:label];
    return view;
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

-(void)commitOrderBtnClicked{
    if( ![UserTool isValidateMobile:self.phoneNumber.text])
    {
        [MBProgressHUD showError:@"请输入正确的手机号"];
        return;
    }
    if (self.ToMyHomeAddLabel.text.length==0) {
        [MBProgressHUD showError:@"请选择寄送地址"];
        return;
    }
    if (contenText.text.length==0) {
        [MBProgressHUD showError:@"请填写详细地址"];
        return;
    }
    //json
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.requestArr options:NSJSONWritingPrettyPrinted error:&error];//此处data参数是我上面提到的key为"data"的数组
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //地址
    NSString *mainAdd = self.ToMyHomeAddLabel.text;
    NSString *detailAdd = contenText.text;
    NSString *totalAdd = [mainAdd stringByAppendingString:detailAdd];
    NSLog(@"最终地址是:%@",totalAdd);
    NSString *encodeStr = [totalAdd stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *paraDic = @{@"postdata":jsonString,@"userid":[YCUserModel userId],@"tel":self.phoneNumber.text,@"address":encodeStr};
    NSLog(@"提交订单的参数是:%@",paraDic);
    [SomeOtherRequest checkoutWithPara:paraDic success:^(id response) {
    } error:^(id response) {
    }];
    
    
    
    PayViewController *pay = [[PayViewController alloc]init];
    [self.navigationController pushViewController:pay animated:YES];
}

#pragma mark - 选择地址通知
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
