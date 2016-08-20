//
//  MallViewController.m
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "CarViewController.h"
#import "MallViewController.h"
#import "WYScrollView.h"
#import "CollectionViewCell.h"
#import "UIScrollView+MJRefresh.h"
#import "HeaderView.h"
#import "bottonBtn.h"
@interface MallViewController ()<WYScrollViewNetDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    WYScrollView *WYNetScrollView;
    NSMutableArray *NetImageArray;
    
    UIImageView *backgroundImageView;
    UIImage *backgroundImage;
    HeaderView *header;
    bottonBtn *Btn1;
    bottonBtn *Btn2;
    bottonBtn *Btn3;
}
@property(nonatomic,strong) UICollectionView *collectionView;
@end

@implementation MallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBackGroundImage];
    [self createHeaderView];
    [self createCollectionView];
    [self createBottomThreeBtn];
}
-(void)createBackGroundImage{
    backgroundImage = [UIImage imageNamed:@"homeVCBackgroundImage"];
    backgroundImageView = [[UIImageView alloc]initWithImage:backgroundImage];
    backgroundImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:backgroundImageView];
}
-(void)createCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.headerReferenceSize = CGSizeMake(kScreenWidth, 200);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49-30*k_scaleHeight)collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    [self.collectionView registerClass:[header class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadView"];
    [self.view addSubview:self.collectionView];
    
}
-(void)createHeaderView{
    // 头视图创建在 MallViewController.m 中
    header = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
}
-(void)createBottomThreeBtn{
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bottomView];
    bottomView.sd_layout.bottomEqualToView(self.view).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(30*k_scaleHeight);
    UIView *line = [UIView lineWithColor:COLOR];
    [bottomView addSubview:line];
    line.sd_layout.heightIs(1).widthIs(kScreenWidth-20).xIs(10).topSpaceToView(bottomView,2);
    
     Btn1 = [[bottonBtn alloc]init];
    Btn1.name.text = @"购物车:";
    Btn1.imageview.image =[UIImage imageNamed:@"购物车"];
    [bottomView addSubview:Btn1];
    [Btn1 addTarget:self action:@selector(OrderCarBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    Btn1.sd_layout.widthIs(kScreenWidth/3).topEqualToView(bottomView).bottomEqualToView(bottomView).leftSpaceToView(bottomView,0);
    
    Btn2 = [[bottonBtn alloc]init];
    Btn2.name.text = @"未完成:";
    [bottomView addSubview:Btn2];
    [Btn2 addTarget:self action:@selector(Uncomplish) forControlEvents:UIControlEventTouchUpInside];
    Btn2.imageview.image = [UIImage imageNamed:@"单子"];
    Btn2.sd_layout.widthIs(kScreenWidth/3).topEqualToView(bottomView).bottomEqualToView(bottomView).leftSpaceToView(bottomView,kScreenWidth/3);
    
    Btn3 = [[bottonBtn alloc]init];
    Btn3.name.text = @"已完成:";
    [bottomView addSubview:Btn3];
    [Btn3 addTarget:self action:@selector(complish) forControlEvents:UIControlEventTouchUpInside];
   Btn3.imageview.image = [UIImage imageNamed:@"单子"];
    Btn3.sd_layout.widthIs(kScreenWidth/3).topEqualToView(bottomView).bottomEqualToView(bottomView).leftSpaceToView(bottomView,kScreenWidth/3*2);    
}


//购物车
-(void)OrderCarBtnClicked{
    CarViewController *CarVC = [[CarViewController alloc]init];
    [self.navigationController pushViewController:CarVC animated:YES];

}

//未完成
-(void)Uncomplish{
    
}

//已完成
-(void)complish{
    
}


#pragma mark =============UICollection delegate dataSource========

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
    
    //    return  self.array.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    return cell;
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
    [MBProgressHUD showError:@"界面未制作"];
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth/2, kScreenWidth/2);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        
        header  = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadView" forIndexPath:indexPath];
        
        reusableview = header;
    }
    
    return reusableview;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 200);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
