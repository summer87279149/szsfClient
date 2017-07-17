//
//  MallViewController.m
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "ImageModel.h"
#import "CollectionViewCellModel.h"
#import "CompleteViewController.h"
#import "GoodSViewController.h"
#import "UnCompleteViewController.h"
#import "CarViewController.h"
#import "MallViewController.h"
#import "WYScrollView.h"
#import "CollectionViewCell.h"
#import "UIScrollView+MJRefresh.h"
#import "HeaderView.h"
#import "bottonBtn.h"

@interface MallViewController ()<WYScrollViewNetDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
{
    WYScrollView *WYNetScrollView;
    NSMutableArray *NetImageArray;
    UIImageView *backgroundImageView;
    UIImage *backgroundImage;
    HeaderView *header;
    bottonBtn *Btn1;
    bottonBtn *Btn2;
    bottonBtn *Btn3;
    
    
    /** 经纬度*/
    NSNumber *lat;
    NSNumber *lon;
    
    /**中间的cell模型*/
    CollectionViewCellModel *cellModel;
    /**存放cellModel的数组*/
    NSMutableArray *collectionViewCellModelArr;
    
    BOOL dataHasMore;
    NSInteger page ;
    
    /**图片模型*/
    ImageModel *imageModel;
    NSMutableArray  *imageModelArr;
    NSMutableArray *imageModelimageArr;
    
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
    collectionViewCellModelArr = [[NSMutableArray alloc]initWithCapacity:0];
    imageModelArr = [[NSMutableArray alloc]initWithCapacity:0];
    imageModelimageArr = [[NSMutableArray alloc]initWithCapacity:0];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.headerReferenceSize = CGSizeMake(kScreenWidth, 200);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49-30*k_scaleHeight)collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    [self.collectionView registerClass:[header class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadView"];
    [self.view addSubview:self.collectionView];
    self.collectionView.alwaysBounceVertical = YES;
//    self.collectionView.showsVerticalScrollIndicator = NO;
    [self setupRefresh];
    
}
-(void)createHeaderView{
    // 头视图创建在 MallViewController.m 中
    header = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getnotification:) name:@"scrollImageClicked" object:nil];
    
}
-(void)getnotification:(NSNotification *)text{
//    NSLog(@"点击了第几张图片:%@",text.userInfo[@"index"]);
    NSString *indexStr = [NSString stringWithFormat:@"%@",text.userInfo[@"index"]];
    NSInteger index = [indexStr integerValue];
    if (imageModelArr.count>0) {
        ImageModel *model = imageModelArr[index];
        if (StringNonNull(model.imageID)) {
            GoodSViewController *vc =[[GoodSViewController alloc]init];
            vc.productID = model.imageID;
            NSLog(@"商品id是：%@",vc.productID);
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
   
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
    WS(weakSelf)
    [self doThisIfUserInfoExist:^{
        CarViewController *CarVC = [[CarViewController alloc]init];
        [weakSelf.navigationController pushViewController:CarVC animated:YES];
    }];
//    if ([YCUserModel userId]) {
//        
//    }else{
//        UserLoginController *a = [[UserLoginController alloc]init];
//        MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:a];
//        [self.navigationController presentViewController:naVC animated:YES completion:nil];
//    }
    
}

//未完成
-(void)Uncomplish{
    WS(weakSelf)
    [self doThisIfUserInfoExist:^{
        UnCompleteViewController *UnComplete = [[UnCompleteViewController alloc]init];
        [weakSelf.navigationController pushViewController:UnComplete animated:YES];
    }];
//    if ([YCUserModel userId]) {
//        UnCompleteViewController *UnComplete = [[UnCompleteViewController alloc]init];
//        [self.navigationController pushViewController:UnComplete animated:YES];
//    }else{
//        UserLoginController *a = [[UserLoginController alloc]init];
//        MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:a];
//        [self.navigationController presentViewController:naVC animated:YES completion:nil];
//    }
    
}

//已完成
-(void)complish{
    WS(weakSelf)
    [self doThisIfUserInfoExist:^{
        CompleteViewController *complete = [[CompleteViewController alloc]init];
        [self.navigationController pushViewController:complete animated:YES];
    }];
//    if ([YCUserModel userId]) {
//        CompleteViewController *complete = [[CompleteViewController alloc]init];
//        [self.navigationController pushViewController:complete animated:YES];
//    }else{
//        UserLoginController *a = [[UserLoginController alloc]init];
//        MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:a];
//        [self.navigationController presentViewController:naVC animated:YES completion:nil];
//    }
}


#pragma mark =============UICollection delegate dataSource========

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return collectionViewCellModelArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    if (collectionViewCellModelArr.count>0) {
        cell.collectionViewCellModel = collectionViewCellModelArr[indexPath.row];
    }
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
    if (collectionViewCellModelArr.count>0) {
        CollectionViewCellModel *model = collectionViewCellModelArr[indexPath.row];
        if (StringNonNull(model.cellID)) {
            GoodSViewController *vc =[[GoodSViewController alloc]init];
            vc.productID = model.cellID;
            NSLog(@"商品id是：%@",vc.productID);
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
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
        header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadView" forIndexPath:indexPath];
        reusableview = header;
    }
    return reusableview;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 200);
}

#pragma mark - 请求数据(上传经纬度)
-(void)uploadLatAndLonisHeaderRefresh:(BOOL)isHeaderRefresh{
    [self startUploadLatAndLonisHeaderRefresh:isHeaderRefresh];

}
-(void)startUploadLatAndLonisHeaderRefresh:(BOOL)isHeaderRefresh{
    
    if (isHeaderRefresh) {
        page = 1;
    }else{
        ++page;
    }
    NSNumber *pageNum = [NSNumber numberWithInteger:page];
    NSDictionary *prama = @{@"page":pageNum};
    //   NSLog(@"参数是:%@",prama);
    WS(weakSelf)
    [XTRequestManager GET:kShop parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        if (isHeaderRefresh) {
            [imageModelArr removeAllObjects];
            [collectionViewCellModelArr removeAllObjects];
        }

        if ([responseObject[@"overflow"] isEqualToString:@"0"]) {
            dataHasMore = YES;
        }else{
            dataHasMore = NO;
        }
        NSLog(@"商城页面返回数据是:%@",responseObject);
        for(NSDictionary *dic in responseObject[@"product"]){
            cellModel = [[CollectionViewCellModel alloc]initFromDictionary:dic];
            [collectionViewCellModelArr addObject:cellModel];
//            NSLog(@"cellModel.cellID=%@",cellModel.cellID);
        }
        
        for (NSDictionary *dicc in responseObject[@"prodbanner"]) {
            imageModel = [[ImageModel alloc]initFromDictionary:dicc];
//            NSLog(@"imageModel.id=%@",imageModel.imageID);
            [imageModelArr addObject:imageModel];
            [imageModelimageArr addObject:imageModel.imageUrl];
//            NSLog(@"imageModelimageArr = %@",imageModelimageArr);
        }
        
        
        [weakSelf applyDataFromResponseObject];
    } failure:^(NSError *error) {
        
        [self loadiewFinished];
    }];
}
-(void)applyDataFromResponseObject{
    if (collectionViewCellModelArr) {
        [self.collectionView reloadData];
    }
    [self loadiewFinished];
}

#pragma mark - refresh
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [_collectionView addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 自动刷新(一进入程序就下拉刷新)
    [_collectionView headerBeginRefreshing];
    //2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [_collectionView addFooterWithTarget:self action:@selector(footerRereshing)];
}
- (void)loadiewFinished
{
    [_collectionView headerEndRefreshing];
    [_collectionView footerEndRefreshing];
}

- (void)footerRereshing
{
    if (dataHasMore == YES) {
        [self uploadLatAndLonisHeaderRefresh:NO];
    }
    else
    {
        [_collectionView footerEndRefreshing];
    }
}


- (void)headerRereshing
{
    [self uploadLatAndLonisHeaderRefresh:YES];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
