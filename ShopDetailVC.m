//
//  ShopDetailVC.m
//  FootMassage
//
//  Created by Admin on 16/8/5.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "UserLoginController.h"
#import "ShopDetailVC.h"
#import "MyCollectionViewCell.h"
#import "ServiceViewController.h"
#import "XWScanImage.h"
#import "HZPhotoGroup.h"
#import "HZPhotoItem.h"

@interface ShopDetailVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *mainPhoto;
@property (weak, nonatomic) IBOutlet UIView *midView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,retain)NSMutableArray *array;
//电话按钮
@property (weak, nonatomic) IBOutlet UIButton *phontBtn;

@end

@implementation ShopDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"商家";
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
   self.collectionView.backgroundColor = [UIColor clearColor];
   [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];

    //mainPhotp add
    [self mainPhotoAddGesture];
}
-(void)mainPhotoAddGesture{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scanBigImageClick1:)];
    [self.mainPhoto addGestureRecognizer:gesture];
    //让UIImageView和它的父类开启用户交互属性
    [self.mainPhoto setUserInteractionEnabled:YES];
}
// - 浏览大图点击事件
-(void)scanBigImageClick1:(UITapGestureRecognizer *)tap{
    NSLog(@"点击图片");
    UIImageView *clickedImageView = (UIImageView *)tap.view;
    [XWScanImage scanBigImageWithImageView:clickedImageView];
}
//更多评论按钮点击事件
- (IBAction)moreCommentButtonClicked:(UIButton *)sender {
    
    
}
//电话按钮点击事件
- (IBAction)phoneBtnClicked:(UIButton *)sender {
    NSString *phoneNum = @"4006767235";// 电话号码
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];   [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;

//    return  self.array.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    // 取出每个item所需要的数据
//    NSDictionary *dic = [self.array objectAtIndex:indexPath.item];
//    // 取出图片名称
//    NSString *imageString = [dic objectForKey:@"imageName"];
//    cell.imageView.image = [UIImage imageNamed:imageString];
//    // 取出文字
//    NSString *textString = [dic objectForKey:@"textLable"];
//    cell.nameLB.text = textString;
//    cell.backgroundColor = [UIColor redColor];
    cell.name.text = @"小儿三伏推";
    cell.image.image = [UIImage imageNamed:@"exe1"];
    cell.time.text = @"60分钟";
    cell.chooseNumber.text = @"9999人选择";
    cell.price.text = @"9999元";
    return cell;
}
- (IBAction)dasfdsfsf:(UIButton *)sender {
    UserLoginController *a = [[UserLoginController alloc]init];
    [self.navigationController pushViewController:a animated:YES];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0){
    return NO;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"我点击了%d图片！！！",indexPath.item + 1);
    ServiceViewController *service = [[ServiceViewController alloc]init];
    [self.navigationController pushViewController:service animated:YES];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.bounds.size.height*1.3, collectionView.bounds.size.height-5*k_scaleHeight);
}




@end
