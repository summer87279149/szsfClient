//
//  ShopDetailVC.m
//  FootMassage
//
//  Created by Admin on 16/8/5.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "ShopMode.h"
#import "ShopCellModel.h"
#import "UserLoginController.h"
#import "ShopDetailVC.h"
#import "MyCollectionViewCell.h"
#import "ServiceViewController.h"
#import "XWScanImage.h"
#import "HZPhotoGroup.h"
#import "HZPhotoItem.h"
#import "TechCommentVController.h"
@interface ShopDetailVC ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    /** 经纬度*/
    NSNumber *lat;
    NSNumber *lon;
    
    
//    ShopCellModel *cellModel;
    /**存放cellModel的数组*/
    NSMutableArray *shopCellModelArr;
    
//    ShopMode *shopModel;
}
/**商店模型*/
@property (strong,nonatomic) ShopMode *shopModel;
/**下面的cell模型*/
@property (strong,nonatomic) ShopCellModel *shopCellModel;
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

    shopCellModelArr = [[NSMutableArray alloc]initWithCapacity:0];
    self.navigationItem.title = @"商家";
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
   self.collectionView.backgroundColor = [UIColor clearColor];
   [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    //mainPhotp add
    [self mainPhotoAddGesture];
    
    [self uploadLatAndLon];
}

-(void)mainPhotoAddGesture{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scanBigImageClick1:)];
    [self.mainPhoto addGestureRecognizer:gesture];
    //让UIImageView和它的父类开启用户交互属性
    [self.mainPhoto setUserInteractionEnabled:YES];
}

#pragma mark - 加载数据
-(void)uploadLatAndLon{
    WS(weakSelf)
    [[CCLocationManager shareLocation]  getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        lat = [NSNumber numberWithDouble:locationCorrrdinate.latitude];
        lon = [NSNumber numberWithDouble:locationCorrrdinate.longitude];
        [weakSelf requestData];
    }];
   
}
-(void)requestData{
    if (self.shopID ==nil || self.shopID == NULL ||[self.shopID isEqualToString:@""]) {
        return;
    }
    NSDictionary *prama = @{@"lng":lon,@"lat":lat,@"sid":self.shopID};
//    NSLog(@"参数是:%@",prama);
    WS(weakSelf)
    [XTRequestManager GET:kXTCommonAPIConstantShopDetail parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
//        NSLog(@"返回结果是:%@",responseObject);
        NSDictionary *dic =[NSDictionary dictionaryWithDictionary:responseObject[@"shop"]];
        weakSelf.shopModel = [[ShopMode alloc]initFromDictionary:dic];
//        NSLog(@"商店模型是:%@",weakSelf.shopModel);
        
        
        NSArray *arr = responseObject[@"project"];
        for(NSDictionary *dicc in arr){
            self.shopCellModel = [[ShopCellModel alloc]initFromDictionary:dicc];
            [shopCellModelArr addObject:self.shopCellModel];
        }
        
        
        
        [weakSelf applyDataFromResponseObject];
    } failure:^(NSError *error) {
        
        
    }];
}
#pragma mark- 设置数据
-(void)applyDataFromResponseObject{
    if (shopCellModelArr.count>0) {
        [self.collectionView reloadData];
    }
    //设置顶部图片
    [self.mainPhoto sd_setImageWithURL:[NSURL URLWithString:self.shopModel.shopImagesURL]];
    //商店名
    self.name.text =self.shopModel.shopName;
    //地址
    self.address.text = self.shopModel.shopAddress;
    //已售
    self.saled.text =[NSString stringWithFormat:@"已售%@",self.shopModel.shopOrderqty];
    
    //距离
    self.distance.text = [NSString stringWithFormat:@"%@km", self.shopModel.distance];
    //用户评价
    self.comment.text = [NSString stringWithFormat:@"用户评价(%@条)",self.shopModel.commentsNumber];
    
    //好评率
    self.goodCommentNumber.text = [NSString stringWithFormat:@"%@好评",self.shopModel.goodCommentRare];
    //
}
//-(void)getNetData{
//    NSDictionary *prama = @{@"keyword":self.shopID};
//    [XTRequestManager GET:kXTCommonAPIConstantShopDetail parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
//        NSLog(@"商铺页面返回数据是:%@",responseObject);
//    } failure:^(NSError *error) {
//        
//    }];
//}



#pragma mark - 点击事件

// - 浏览大图点击事件
-(void)scanBigImageClick1:(UITapGestureRecognizer *)tap{
    NSLog(@"点击图片");
    UIImageView *clickedImageView = (UIImageView *)tap.view;
    [XWScanImage scanBigImageWithImageView:clickedImageView];
}
//更多评论按钮点击事件
- (IBAction)moreCommentButtonClicked:(UIButton *)sender {
    
    TechCommentVController *comments = [[TechCommentVController alloc]init];
    comments.para = @{@"sid":self.shopModel.shopID};
    NSLog(@"%@",self.shopModel.shopID);
    [self.navigationController pushViewController:comments animated:YES];
    
}
//电话按钮点击事件
- (IBAction)phoneBtnClicked:(UIButton *)sender {
    NSString *phoneNum = self.shopModel.shopPhone;// 电话号码
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];   [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}




#pragma mark - collectionviewDelagate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return shopCellModelArr.count;
//    return  self.array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    if (shopCellModelArr.count>0) {
        cell.shopCellModel = shopCellModelArr[indexPath.row];
    }
    
//    cell.name.text = @"小儿三伏推";
//    cell.image.image = [UIImage imageNamed:@"exe1"];
//    cell.time.text = @"60分钟";
//    cell.chooseNumber.text = @"9999人选择";
//    cell.price.text = @"9999元";
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0){
    return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShopCellModel*model = shopCellModelArr[indexPath.row];
//    NSLog(@"我点击了%ld图片！！！",indexPath.item + 1);
    ServiceViewController *service = [[ServiceViewController alloc]init];
    service.projectID = model.projectId;
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
