//
//  ToShopViewController.m
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ToShopViewController.h"
#import "ShopTableViewCell.h"
#import "ShopDetailVC.h"
#import "ToShopCellModel.h"

static NSString *CellIdentifier1 = @"cellidentifer1";
@interface ToShopViewController ()<UITableViewDelegate,UITableViewDataSource,ShopTableViewCellDelegate>
{
    
    UITableView *toShopTable;
    NSMutableArray *shopArr;                 //店铺数组
    UIButton *oneBtn;
    UIButton *twoBtn;
    UIButton *threeBtn;
    NSMutableArray *dataArr;
    //判断按钮重复事件
    BOOL isRecent;      //最近
    BOOL isMost;        //最多
    BOOL isLowest;      //最低
    
    NSString *selectType;  //选择类型
    NSMutableArray *headImgArr;         //技师头像数组
    
    NSIndexPath *selectIndex;
    BOOL isOpen;
    
    //两变量为空则为最近
    NSString *most;             // 订单最多
    NSString *floor;            //价格最低
    
    int projectPage;           //页码
    BOOL projectHasMore;       //是否有更多
    
    int shopPage;           //页码
    BOOL shopHasMore;       //是否有更多
    UIImageView *imageView0;
    UIImageView *imageView1;
    UIImageView *imageView2;
    UIImageView *imageView3;
    
    /** 经纬度*/
    NSNumber *lat;
    NSNumber *lon;
    
    /**中间的cell模型*/
    ToShopCellModel *cellModel;
    /**存放cellModel的数组*/
    NSMutableArray *ToShopCellModelArr;
    /**代表距离排序 、销量排序、价格排序*/
    NSInteger sortNumber;
    BOOL dataHasMore;
    NSInteger page ;
}
@end

@implementation ToShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ToShopCellModelArr = [[NSMutableArray alloc]initWithCapacity:0];
    sortNumber = 0;
    dataHasMore = YES;
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeVCBackgroundImage"]];
    self.view.backgroundColor = [UIColor clearColor];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }
    most = @"";
    floor = @"";
    projectPage = 1;
    shopPage = 1;
    //设置导航栏颜色
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    UIColor *color = [UIColor whiteColor];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    imageView0 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeVCBackgroundImage"]];
    imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"进店"]];
    imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"客忙"]];
    imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"价优"]];
    imageView0.contentMode = UIViewContentModeScaleToFill;
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    imageView0.sd_layout.heightIs(160).widthIs(kScreenWidth).xIs(0).yIs(0);
    imageView1.sd_layout.heightIs(80*k_scale).widthIs(80*k_scale).xIs(20*k_scale).yIs(20);
    imageView2.sd_layout.heightIs(80*k_scale).widthIs(80*k_scale).xIs(120*k_scale).yIs(20);
    imageView3.sd_layout.heightIs(80*k_scale).widthIs(80*k_scale).xIs(220*k_scale).yIs(20);
    [self.view addSubview:imageView0];
    [self.view addSubview:imageView1];
    [self.view addSubview:imageView2];
    [self.view addSubview:imageView3];
    UIImageView *imageBrown = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"brown"]];
    [self.view addSubview:imageBrown];
    imageBrown.sd_layout.heightIs(25*k_scale).yIs(120).leftSpaceToView(self.view,10).rightSpaceToView(self.view,10);
    //三个筛选按钮
    for (int i = 0; i< 3; i ++) {
        UIButton * btn = [[UIButton alloc]initWithFrame: CGRectMake(viewWidth/3*i, 120, viewWidth/3, 30)];
        btn.tag = 300+i;
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = 1;
        [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0,viewWidth/3,0,20);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
//        [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        
        if (i == 0) {
            [btn setTitle:@"距离排序" forState:UIControlStateNormal];
            oneBtn = btn;
            oneBtn.selected=YES;
            
        }
        else if(i == 1)
        {
            [btn setTitle:@"销量排序" forState:UIControlStateNormal];
            twoBtn = btn;
        }
        else
        {
            [btn setTitle:@"价格排序" forState:UIControlStateNormal];
            threeBtn  = btn;
        }
        [btn addTarget:self action:@selector(selectPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    UIView *lineView = [[UIImageView alloc]init];
    lineView.backgroundColor = [UIColor getColor:@"3b2935"];
    [self.view addSubview:lineView];
    lineView.sd_layout.leftSpaceToView(imageView1,10*k_scale).heightIs(120*k_scale).widthIs(1).bottomEqualToView(imageBrown);
    
    UIView *lineView2 = [[UIImageView alloc]init];
    lineView2.backgroundColor = [UIColor getColor:@"3b2935"];
    [self.view addSubview:lineView2];
    lineView2.sd_layout.leftSpaceToView(imageView2,10*k_scale).heightIs(120*k_scale).widthIs(1).bottomEqualToView(imageBrown);
    
    
    
    
    shopArr =  [[NSMutableArray alloc]initWithCapacity:0];
    headImgArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    toShopTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 120*k_scale, viewWidth, viewHeight-64-49-120*k_scale) style:UITableViewStylePlain];
    //    toShopTable.backgroundColor = [UIColor redColor];
    toShopTable.backgroundView = imageView;
    //    m_mineTtabView.style = UITableViewStylePlain;
    toShopTable.dataSource = self;
    toShopTable.delegate = self;
    [self.view addSubview:toShopTable];
    
    
    dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    toShopTable.frame = CGRectMake(0, 150, viewWidth, viewHeight-64-49-120*k_scale-5);
    selectType = @"店铺";
    [toShopTable reloadData];
    
    [self setupRefresh];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(modifyCity:) name:@"chooseCity" object:nil];

}


- (void)selectPress:(id)sender
{
    UIButton *btn = sender;
    if (btn.tag == 300) {
        sortNumber = 0;
        NSLog(@"距离排序sortNumber = 0;");
        isRecent = !isRecent;
        if (isRecent) {
            isMost = 0;
            isLowest = 0;
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
            most = @"";
            floor = @"";
            
            
            [self setupRefresh];
        }
        else
        {
            isRecent = 0;
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        }
//        [twoBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
//        [threeBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [threeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (btn.tag == 301)
    {   sortNumber = 1;
        NSLog(@"销量排序sortNumber = 1");
        isMost = !isMost;
        if (isMost) {
            isRecent = 0;
            isLowest = 0;
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
            most = @"1";
            floor = @"";
            
            [self setupRefresh];
        }
        else
        {
            isMost = 0;
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        }
        //        [btn setTitleColor:[UIColor getColor:@"50B847"] forState:UIControlStateNormal];
        //        [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
//        [oneBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
//        [threeBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [oneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [threeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else
    {   sortNumber = 2;
        NSLog(@"价格排序 sortNumber = 2");
        isLowest = !isLowest;
        if (isLowest) {
            isRecent = 0;
            isMost = 0;
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
            most = @"";
            floor = @"1";
            [self setupRefresh];
        }
        else
        {
            isLowest = 0;
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        }
        NSLog(@"价格最贵");
        //        [btn setTitleColor:[UIColor getColor:@"50B847"] forState:UIControlStateNormal];
        //        [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
//        [oneBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
//        [twoBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [oneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}
#pragma mark - 请求数据(上传经纬度)
-(void)uploadLatAndLonWith:(NSInteger)Type isHeaderRefresh:(BOOL)isHeaderRefresh{
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied){
    WS(weakSelf);
    [[CCLocationManager shareLocation]  getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        lat = [NSNumber numberWithDouble:locationCorrrdinate.latitude];
        lon = [NSNumber numberWithDouble:locationCorrrdinate.longitude];
        [weakSelf startUploadLatAndLonWith:Type isHeaderRefresh:isHeaderRefresh];
    }];
    }else{
        UIAlertView *alvertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"需要开启定位服务才能正常使用,请到设置->隐私,打开定位服务" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alvertView show];
         [self loadiewFinished];
    }
}
-(void)startUploadLatAndLonWith:(NSInteger)Type isHeaderRefresh:(BOOL)isHeaderRefresh{
   
    
    if (isHeaderRefresh) {
        page = 1;
    }else{
        ++page;
    }
    //创建参数 pageNum：页码，typeNum：距离排序销量排序价格排序，cityCode：城市编码
    NSNumber *pageNum = [NSNumber numberWithInteger:page];
    NSNumber *typeNum = [NSNumber numberWithInteger:Type];
    NSString *cityCode = [[NSUserDefaults standardUserDefaults]objectForKey:CITYCODE];
    NSDictionary *prama = @{@"lng":lon,@"lat":lat,@"type":typeNum,@"page":pageNum,@"city":cityCode};
    NSLog(@"到店页上传的参数是:%@",prama);
    WS(weakSelf)
    [XTRequestManager GET:kXTGoToShop parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        NSLog(@"到店页返回的数据是%@",responseObject);
       
        if ([responseObject[@"overflow"] isEqualToString:@"0"]) {
            dataHasMore = YES;
        }else{
            dataHasMore = NO;
        }
        for(NSDictionary *dic in responseObject[@"shop"]){
            cellModel = [[ToShopCellModel alloc]initFromDictionary:dic];
            [ToShopCellModelArr addObject:cellModel];
//            NSLog(@"shopID=%@",cellModel.shopID);
        }
        
        [weakSelf applyDataFromResponseObject];
    } failure:^(NSError *error) {
        
        [self loadiewFinished];
    }];
}
#pragma mark- 设置数据
-(void)applyDataFromResponseObject{
    
    [toShopTable reloadData];
    
    [self loadiewFinished];
}

#pragma mark - UItableView delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return ToShopCellModelArr.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopTableViewCell *cell = (ShopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    if (cell == nil)
    {
        cell = [[ShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:CellIdentifier1];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (ToShopCellModelArr.count>0) {
        cell.toShopCellModel = ToShopCellModelArr[indexPath.row];
        cell.shopCel_delegate = self;
    }
    
    
        return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ToShopCellModel*model = ToShopCellModelArr[indexPath.row];
    ShopDetailVC *push = [[ShopDetailVC alloc]init];
    push.shopID =model.shopID;
    push.title = @"商家";
    [self.navigationController pushViewController:push animated:YES];
    
}
- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    isOpen = firstDoInsert;
    
    NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
    NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:1 inSection:selectIndex.section];
    [rowToInsert addObject:indexPathToInsert];
    [toShopTable beginUpdates];
    if (firstDoInsert)
    {
        NSLog(@"11index === %ld",(long)selectIndex.section);
        [toShopTable insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    else
    {
        
        [toShopTable deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    //    [toShopTable reloadData];
    [toShopTable endUpdates];
    
    if (nextDoInsert) {
        isOpen = YES;
        selectIndex = [toShopTable indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    
    if (isOpen){
        
        [toShopTable scrollToRowAtIndexPath:selectIndex atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
}
- (void)getgoShopRequest
{
    
    
}
#pragma mark - AFNetworkServiceDelegate
- (void)finishedLoadingView
{
    [self loadiewFinished];
    //    isOpen = NO;
    //
}
#pragma mark 下拉刷新
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [toShopTable addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 自动刷新(一进入程序就下拉刷新)
    [toShopTable headerBeginRefreshing];
    
    //2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [toShopTable addFooterWithTarget:self action:@selector(footerRereshing)];
}
- (void)loadiewFinished
{
    [toShopTable headerEndRefreshing];
    [toShopTable footerEndRefreshing];
}

- (void)footerRereshing
{
    if (dataHasMore == YES) {
        [self uploadLatAndLonWith:sortNumber isHeaderRefresh:NO];
    }
    else
    {
        [toShopTable footerEndRefreshing];
    }
    
}


- (void)headerRereshing
{
    [ToShopCellModelArr removeAllObjects];
    [self uploadLatAndLonWith:sortNumber isHeaderRefresh:YES];
//    Lat = [jingWeiDu getLattitude];
//    Lon = [jingWeiDu getLongitude];
//    [shopArr removeAllObjects];
//    [dataArr removeAllObjects];
//    projectPage = 1;
//    projectHasMore = NO;
//    shopPage = 1;
//    shopHasMore = NO;
}
#pragma mark - 接收到通知消息页面自动刷新
-(void)viewWillAppear:(BOOL)animated{
    
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)modifyCity:(NSNotification *)note{
        [toShopTable headerBeginRefreshing];
}
#pragma mark============== ShopTableViewCellDelegate ===============
//向下箭头按钮
- (void)sendIndexPath:(NSIndexPath *)pathIndex
{
    
               
}

#pragma mark============== 预约按钮 ProjectTableViewCellDelegate ===============
// 预约按钮
- (void)sendReserveTag:(NSIndexPath *)pathIndex
{
    
//    NSLog(@"btnTag == %ld",(long)pathIndex);
}

#pragma mark============== MoreTableViewCellDelegate ===============
//展开的技师头像按钮
- (void)sendBtnTag:(NSInteger)btnTag
{

}

#pragma mark============== WYScrollViewNetDelegate ===============
/** 获取网络图片的index*/
-(void)didSelectedNetImageAtIndex:(NSInteger)index
{
    [toShopTable reloadData];
    
    NSLog(@"点中网络图片的下标是:%ld",(long)index);
}



















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
