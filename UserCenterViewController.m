//
//  UserCenterViewController.m
//  foot
//
//  Created by Admin on 16/8/17.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "UserCenterViewController.h"
#import "UIImage+Mo.h"
@interface UserCenterViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate,UIScrollViewDelegate,UIActionSheetDelegate>


@property(nonatomic,strong)UIButton *userHeader;
@property(nonatomic,strong)UIImageView *headerImage;

@property(nonatomic,strong)UITextField *usernameField1;

@property(nonatomic,strong)UITextField *name;

@property(nonatomic,strong)UITextField *phoneNumber;

@property(nonatomic,strong)UITextField *email;

@property(nonatomic,strong)NSMutableDictionary *dict;

@property(nonatomic,weak)UIScrollView *scrollView1;

@end

@implementation UserCenterViewController
{
    NSString *_head_pic;
}

-(NSMutableDictionary *)dict
{
    if (!_dict) {
        _dict=[NSMutableDictionary dictionary];
    }
    return _dict;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人资料";
    HaHaHaAddBackGroundImage
    
    UIScrollView *scrollView1=[[UIScrollView alloc]init];
    scrollView1.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:scrollView1];
    scrollView1.backgroundColor = [UIColor clearColor];
    scrollView1.delegate=self;
    scrollView1.contentSize=CGSizeMake(0, [UIScreen mainScreen].bounds.size.height+80);
    self.scrollView1=scrollView1;
    
    
    [self settingUI];
    
    [self setUpData];
}

-(void)settingUI
{
   
    
    // 头像
    _headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2 - 45 ,10, 90, 90)];
    _headerImage.backgroundColor = [UIColor clearColor];
    _headerImage.layer.cornerRadius = 45;
    _headerImage.layer.masksToBounds = YES;
    _headerImage.layer.borderWidth=2;
    _headerImage.layer.borderColor = [UIColor whiteColor].CGColor;
    _headerImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollView1 addSubview:_headerImage];
    
    UIButton *userHeader=[[UIButton alloc]init];
    userHeader.frame=CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 60);
    [self.scrollView1 addSubview:userHeader];
    [userHeader setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [userHeader setTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    [userHeader setBackgroundColor: [UIColor clearColor]];
    [userHeader setTitle:@"" forState:UIControlStateNormal];
    
    [userHeader addTarget:self action:@selector(clickHeader) forControlEvents:UIControlEventTouchUpInside];
    self.userHeader=userHeader;
    
    // 用户昵称
    UITextField *usernameField1=[[UITextField alloc]init];
    usernameField1.frame=CGRectMake(10, CGRectGetMaxY(self.userHeader.frame)+40,[UIScreen mainScreen].bounds.size.width-20, 40);
    
    usernameField1.textColor=[UIColor blackColor];
    usernameField1.returnKeyType = UIReturnKeyDone;
    usernameField1.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    usernameField1.clearButtonMode=UITextFieldViewModeAlways;
    [self.scrollView1 addSubview:usernameField1];
    usernameField1.font=[UIFont systemFontOfSize:15];
    usernameField1.keyboardType=UIKeyboardTypeDefault;
    usernameField1.delegate=self;
    UILabel *left=[[UILabel alloc]init];
    left.frame=CGRectMake(5, 0, 70, 50);
    left.font = [UIFont systemFontOfSize:15.0];
    left.text=@"用户名:";
    left.textAlignment=NSTextAlignmentLeft;
    usernameField1.leftView=left;
    
    usernameField1.leftViewMode=UITextFieldViewModeAlways;
    self.usernameField1=usernameField1;
    
    
    // 手机号
    UITextField *phoneNumber=[[UITextField alloc]init];
    phoneNumber.frame=CGRectMake(10, CGRectGetMaxY(self.usernameField1.frame)+10,[UIScreen mainScreen].bounds.size.width-20, 40);
    phoneNumber.text=@"";
    phoneNumber.enabled=NO;
    phoneNumber.textColor=[UIColor darkGrayColor];
    phoneNumber.returnKeyType = UIReturnKeyDone;
    phoneNumber.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.scrollView1 addSubview:phoneNumber];
    phoneNumber.font=[UIFont systemFontOfSize:15];
    phoneNumber.keyboardType=UIKeyboardTypeDefault;
    
    UILabel *left12=[[UILabel alloc]init];
    left12.frame=CGRectMake(5, 0, 70, 50);
    left12.text=@"手机 : ";
    left12.font = [UIFont systemFontOfSize:15.0];
    left12.textAlignment=NSTextAlignmentLeft;
    phoneNumber.leftView=left12;
    phoneNumber.leftViewMode=UITextFieldViewModeAlways;
    self.phoneNumber=phoneNumber;
    

    
    UIButton *modify=[[UIButton alloc]init];
    modify.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, CGRectGetMaxY(self.phoneNumber.frame)+10,100, 35);
    [self.scrollView1 addSubview:modify];
    
    [modify setTitle:@"确认修改" forState:UIControlStateNormal];
    [modify addTarget:self action:@selector(modifyBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    modify.backgroundColor = COLOR;
    modify.layer.cornerRadius=15;
    modify.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [modify setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [modify setTitleColor:[UIColor colorWithRed:220.0/255.0 green:225.0/255.0 blue:38.0/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [modify setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:Nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [_headerImage sd_setImageWithURL:URLWITHSTRING(self.imageUrl)];
    self.usernameField1.text= self.nickName;
    phoneNumber.text = self.telNum;
}
- (void)setUpData
{
}
// 修改按钮点击事件
- (void)modifyBtnClicked
{
    SHOWHUD
    if (_usernameField1.text.length>8) {
        [MBProgressHUD showError:@"姓名长度应小于10个字符"];
        return;
    }
    WS(weakSelf)
    [SomeOtherRequest modifyNickNameWithUserID:[YCUserModel userId] andName:_usernameField1.text success:^(id response) {
        NSLog(@"修改昵称:%@",response);
         HIDEHUDWeakSelf
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserInfoChanged" object:nil];
       [MBProgressHUD showSuccess:@"修改成功"];
        [weakSelf.view endEditing:YES];
    } error:^(id response) {
        HIDEHUDWeakSelf
    }];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

-(void)clickHeader
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"现在拍一张照片",@"从相册中选一张照片", nil];
    UIViewController *rootVC = [self imc_viewController];
    [sheet showInView:rootVC.view];
   }
#pragma mark - UIActionsheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self openCamera];
        }
        
    } else if (buttonIndex == 1) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            [self openPhotoLibrary];
        }
    }
}
/**
 *  打开相机
 */
- (void)openCamera
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    ipc.delegate = self;
    ipc.allowsEditing = YES;
    UIViewController *rootVC = [self imc_viewController];
    [rootVC presentViewController:ipc animated:YES completion:nil];
}

/**
 *  打开相册
 */
- (void)openPhotoLibrary
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    ipc.delegate = self;
    ipc.allowsEditing = YES;
    UIViewController *rootVC = [self imc_viewController];
    [rootVC presentViewController:ipc animated:YES completion:nil];
    _headerImage.layer.cornerRadius = 45;
}
/**
 *根据给定的size的宽高比自动缩放原图片、自动判断截取位置,进行图片截取
 * UIImage image 原始的图片
 * CGSize size 截取图片的size
 */
-(UIImage *)clipImage:(UIImage *)image toRect:(CGSize)size{
    
    //被切图片宽比例比高比例小 或者相等，以图片宽进行放大
    if (image.size.width*size.height <= image.size.height*size.width) {
        
        //以被剪裁图片的宽度为基准，得到剪切范围的大小
        CGFloat width  = image.size.width;
        CGFloat height = image.size.width * size.height / size.width;
        
        // 调用剪切方法
        // 这里是以中心位置剪切，也可以通过改变rect的x、y值调整剪切位置
        return [UIImage imageFromImage:image inRect:CGRectMake(0, (image.size.height -height)/2, width, height)];
        
    }else{ //被切图片宽比例比高比例大，以图片高进行剪裁
        
        // 以被剪切图片的高度为基准，得到剪切范围的大小
        CGFloat width  = image.size.height * size.width / size.height;
        CGFloat height = image.size.height;
        
        // 调用剪切方法
        // 这里是以中心位置剪切，也可以通过改变rect的x、y值调整剪切位置
        return [UIImage imageFromImage:image inRect:CGRectMake((image.size.width -width)/2, 0, width, height)];
    }
    return nil;
}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
//    NSValue *value = [info objectForKey:UIImagePickerControllerCropRect] ;
//    CGRect  rect = value.CGRectValue;
//    NSLog(@"选择完图片的info：%@,cgrect 是:%@",info,rect);
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 1.取出选中的图片
    UIImage *originalImage = info[UIImagePickerControllerEditedImage];
//    UIImage * originalImage =  [UIImage imageFromImage:originalImageeee inRect:rect];
    NSData *mData =UIImageJPEGRepresentation(originalImage, 1);
    UIImage *needImage = nil;
    
    needImage = [UIImage imageWithData:mData];
    
    CGSize size = needImage.size;
    float height = 200.0f * size.height/size.width;
    needImage = [self imageWithImageSimple:needImage scaledToSize:CGSizeMake(200.0f, height)];
    //上传图片
    [self saveImage:needImage];
   
    
}

//上传图片
- (void)saveImage:(UIImage *)tempImage
{
    SHOWHUD
    WS(weakSelf)
    [SomeOtherRequest saveImage:tempImage userid:[YCUserModel userId] success:^(id response) {
        [weakSelf.headerImage sd_setImageWithURL:URLWITHSTRING(response[@"headimgurl"])];
        NSLog(@"上传图片成功返回：%@",response);
        HIDEHUDWeakSelf
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserInfoChanged" object:nil];
    } error:^(id response) {
        [MBProgressHUD showError:@"上传失败，请检查网络"];
        HIDEHUDWeakSelf
    }];
}



//从document取得图片
- (UIImage *)getImage:(NSString *)totalPath
{
    return [UIImage imageWithContentsOfFile:totalPath];
}
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
    
}

- (UIViewController *)imc_viewController {
    UIResponder *responder = self;
    while ([responder isKindOfClass:[UIView class]]) {
        responder = responder.nextResponder;
    }
    return (UIViewController *)responder;
}


#pragma mark - 键盘

- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [value CGRectValue];
    
    self.scrollView1.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - keyboardRect.size.height);
}

-(void)keyBoardWillHide:(NSNotification *)notification{
    
    self.scrollView1.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField endEditing:YES];
    
}






/**
 *  当键盘改变了frame(位置和尺寸)的时候调用
 */
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    //NSLog(@"%@",note.userInfo);
    // 设置窗口的颜色
    self.view.window.backgroundColor = self.view.backgroundColor;
    // 0.取出键盘动画的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 1.取得键盘最后的frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 2.计算控制器的view需要平移的距离
    CGFloat transformY = keyboardFrame.origin.y - self.view.frame.size.height+170;
    // 3.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, transformY);
    }];
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
