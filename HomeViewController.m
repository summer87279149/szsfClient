//
//  HomeViewController.m
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "SDCycleScrollView.h"
#import "HomeCellModel.h"
#import "SearchResualtViewController.h"
#import "HomeViewController.h"
#import "MJRefresh.h"
#import "MJRefreshHeaderView.h"
#import "HomeTableViewCell.h"
#import "MJRefreshFooterView.h"
#import "ShopDetailVC.h"
#import "AddressViewController.h"
#import "MainNavViewController.h"
#import "NSTimer+XTCategory.h"
#import "UMSocial.h"
#import "HomeCellModel.h"
#import "CCLocationManager.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UITextViewDelegate,UMSocialUIDelegate,SDCycleScrollViewDelegate>
{
    UISearchBar *m_searchBa;
    WYScrollView *WYNetScrollView;              //滚动图片控件
    SDCycleScrollView *topScrollView;
    MBProgressHUD *m_loadingView;
    NSMutableArray *dataArr;
    
    UITableView *homeTable;
    UIView *headerView;
    NSString *selectType;                       //选择类型字段
    UIImageView *backgroundImageView;
    UIImage *backgroundImage;
    UIView *pedicureInfo;
    UIButton *cityBtn;
    NSTimer *timer;
    UITextView *midText;
    NSString *currentCity;//当前城市;
    
    
    
    /** 经纬度*/
    NSNumber *lat;
    NSNumber *lon;
    /** 网络图片数组*/
    NSMutableArray *NetImageArray;
    /** 网络图片对应的商家id*/
    NSMutableArray *NetImageShopID;
    /**中间的介绍文字*/
    NSMutableString *instruction;
    /**中间的cell模型*/
    HomeCellModel *cellModel;
    /**存放cellModel的数组*/
    NSMutableArray *cellModelArray;
}
@property(nonatomic,strong)UISearchBar *m_searchBa;
@property(nonatomic,strong)UITableView *homeTable;
@end

@implementation HomeViewController
@synthesize m_searchBa,homeTable;

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets =YES;
//    [jingWeiDu getCity:^(NSString *addressString) {
        #pragma warining 模拟器上这里报错 ，先注释掉
////        currentCity = addressString;
//
//        NSDictionary *dict = [NSDictionary dictionaryWithObject:currentCity forKey:@"city"];
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"chooseCity" object:nil userInfo:dict];
//    }];

    
    backgroundImage = [UIImage imageNamed:@"homeVCBackgroundImage"];
    backgroundImageView = [[UIImageView alloc]initWithImage:backgroundImage];
    backgroundImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:backgroundImageView];
    
    
    selectType = @"名店推荐";
    
    self.m_searchBa=[[UISearchBar alloc]init];
    m_searchBa.placeholder = @"请输入门店名称";
    //设置bar的frame
    m_searchBa.searchBarStyle =UISearchBarStyleDefault;
    m_searchBa.delegate = self;
    m_searchBa.backgroundColor = [UIColor clearColor];
    m_searchBa.frame=CGRectMake(10, 160, viewWidth-20, 20);
    //添加导航栏三个按钮
    NSArray * arrBtn = @[[self shareButton],[self phoneButton]];
    self.navigationItem.titleView = m_searchBa;
    self.navigationItem.leftBarButtonItem = [self cityButton];
    self.navigationItem.rightBarButtonItems = arrBtn;
    
    
    NetImageArray = [[NSMutableArray alloc]initWithCapacity:0];
    NetImageShopID = [[NSMutableArray alloc]initWithCapacity:0];
    instruction = [[NSMutableString alloc]initWithString:@"在中医文化中，足疗法源远流长，它源于我国古代，是人们在长期的社会实践中的知识积累和经验总结，至今已有3000多年的历史传统。古人曾经有过许多对足浴的经典记载和描述：“春天洗脚，升阳固脱；夏天洗脚，暑湿可祛；秋天洗脚,肺润肺濡；冬天洗脚，丹田温灼。"];
    cellModelArray =[[NSMutableArray alloc]initWithCapacity:0];
    // ========测试数据 记得删掉=======
    NetImageArray = [NSMutableArray arrayWithObjects:
                     @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                     @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                     @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                     nil];
    
    
    // =================
    dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    
    self.homeTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    homeTable.dataSource = self;
    homeTable.delegate = self;
    [self.view addSubview:homeTable];
//    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    homeTable.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    homeTable.backgroundView=backgroundImageView;
    homeTable.separatorColor = [UIColor getColor:@"3b2935"];
    homeTable.sd_layout
    .widthIs(viewWidth)
    .bottomSpaceToView(self.view,0);
    
    headerView = [[UIView alloc]init];
    //    headerView.backgroundColor = [UIColor getColor:@"68C164"];
    headerView.backgroundColor = [UIColor clearColor];
    headerView.sd_layout
    .widthIs(homeTable.frame.size.width)
    .heightIs(300);
    
    //中间足疗介绍View:pedicureInfo
    pedicureInfo = [[UIView alloc]initWithFrame:CGRectMake(0, 200, viewWidth, 150)];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"寻名师"]];
    [pedicureInfo addSubview:imageView];
    imageView.sd_layout
    .topSpaceToView(pedicureInfo,35)
    .bottomSpaceToView(pedicureInfo,35)
    .leftSpaceToView(pedicureInfo,10)
    .widthIs(100);
    
    pedicureInfo.backgroundColor = [UIColor clearColor];
    [headerView addSubview:pedicureInfo];
    
    
    //竖线
    UIView *lineView = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2, 205, 1, 40)];
    lineView.backgroundColor = [UIColor getColor:@"3b2935"];
    
    [headerView addSubview:lineView];
    lineView.sd_layout.leftSpaceToView(imageView,10*k_scale).heightIs(100).widthIs(1).bottomSpaceToView(headerView,30);
    
    midText = [[UITextView alloc]init];
    midText.text = instruction;
    midText.textColor = [UIColor getColor:@"3b2935"];
    midText.editable = NO;
    midText.delegate=self;
    midText.backgroundColor = [UIColor clearColor];
    [headerView addSubview:midText];
    
    UIView *lineView2 = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2, 205, 1, 40)];
    lineView2.backgroundColor = [UIColor getColor:@"3b2935"];
     [headerView addSubview:lineView2];
    lineView2.sd_layout.leftSpaceToView(imageView,180*k_scale).heightIs(100).widthIs(1).bottomSpaceToView(headerView,30);
   
    midText.sd_layout.leftSpaceToView(imageView,15*k_scale).heightIs(100).bottomSpaceToView(headerView,30).widthIs(165*k_scale);
    //请求数据
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [homeTable addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 自动刷新(一进入程序就下拉刷新)
    [homeTable headerBeginRefreshing];
    [homeTable headerEndRefreshing];
    [self performSelector:@selector(resetText) withObject:nil afterDelay:2.0f];
//    self.automaticallyAdjustsScrollViewInsets =YES;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

- (UIBarButtonItem *)shareButton
{
    UIImage *image = [UIImage imageNamed:@"微信.png"];
    CGRect buttonFrame = CGRectMake(0, 0,35, 35);
    
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(shareBtnClicekd) forControlEvents:UIControlEventTouchUpInside];
    //    [button setTitle:@"地图" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}
#pragma mark - 请求数据(上传经纬度)
-(void)uploadLatAndLon{
    WS(weakSelf);
    [[CCLocationManager shareLocation]  getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        lat = [NSNumber numberWithDouble:locationCorrrdinate.latitude];
        lon = [NSNumber numberWithDouble:locationCorrrdinate.longitude];
        [weakSelf startUploadLatAndLon];
    }];
}
-(void)startUploadLatAndLon{
    NSDictionary *prama = @{@"lng":lon,@"lat":lat};
    WS(weakSelf)
    [XTRequestManager GET:XTUploadLinAndLon parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
//        NSLog(@"====%@",responseObject);
        NSArray *arr = responseObject[@"homebanner"];
        for (int i=0; i<arr.count; ++i) {
            NSDictionary * dictionary = arr[i];
            [NetImageArray addObject:dictionary[@"banner"]];
            [NetImageShopID addObject:dictionary[@"id"]];
        }
//        NSLog(@"====%@",NetImageArray);
        NSDictionary *textDic = responseObject[@"instruction"];
        instruction = textDic[@"inst"];
        for(NSDictionary *d in responseObject[@"recommendshop"]){
            cellModel = [[HomeCellModel alloc]initFromDictionary:d];
//        NSLog(@"cellModel.image=%@",cellModel.image);
            [cellModelArray addObject:cellModel];
        }
        
        [weakSelf applyDataFromResponseObject];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark- 设置数据
-(void)applyDataFromResponseObject{
    if (NetImageArray&&instruction&&NetImageShopID&&cellModelArray) {
        [self createNetScrollView];
        midText.text = instruction;
        [homeTable reloadData];
    }
    [homeTable headerEndRefreshing];
}
#pragma mark =====================================
//分享
-(void)shareBtnClicekd{
    [self  uploadLatAndLon];
    [UMSocialData defaultData].extConfig.title = @"神州师傅";
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://www.baidu.com";
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://www.baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:UmengAppkey
                                      shareText:@"欢迎使用神州师傅"
                                     shareImage:[UIImage imageNamed:@"AppIcon"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline]
                                       delegate:self];
}
//实现回调方法：
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
#pragma  mark ========滚动文字显示========
- (void)resetText {
    [timer invalidate];
    timer = nil;
    __weak typeof(self)weakSelf = self;
    timer = [NSTimer eocScheduledTimerWithTimeInterval:0.06 block:^{
        [weakSelf performSelector:@selector(onTick:) withObject:nil afterDelay:0];
    } repeats:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == midText) {
        [timer invalidate];
        timer = nil;
        [self performSelector:@selector(resetText) withObject:nil afterDelay:2.0f];
    }
    
}
- (void) onTick:(NSTimer*)theTimer {
    CGPoint pt = [midText contentOffset];
    CGFloat n = pt.y + 1;
    [midText setContentOffset:CGPointMake(pt.x, n)];
    if (n> (midText.contentSize.height-midText.bounds.size.height)) {
//        [midText setContentOffset:CGPointMake(pt.x, 0)];
        [theTimer invalidate];
        theTimer = nil;
        [timer invalidate];
        timer = nil;
    }
}
#pragma mark ==========================
-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(modifyCity:) name:@"chooseCity" object:nil];
}
-(void)modifyCity:(NSNotification *)note{
    if (note.userInfo[@"city"]==nil) {
        return;
    }else{
    [cityBtn setTitle:note.userInfo[@"city"] forState:UIControlStateNormal];
    }
}
//轮播图
-(void)createNetScrollView{
//    WYNetScrollView = [[WYScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) WithNetImages:NetImageArray];
//    WYNetScrollView.AutoScrollDelay = 3;
//    WYNetScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
//    WYNetScrollView.netDelagate = self;
//    [headerView addSubview:WYNetScrollView];
    topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imageNamesGroup:NetImageArray];
    /** 设置占位图*/
    topScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
    /** 获取网络图片的index*/
   topScrollView.delegate = self;
    /** 添加到当前View上*/
    [headerView addSubview:topScrollView];
}

////右按钮1
- (UIBarButtonItem *)mapButton
{
    UIImage *image = [UIImage imageNamed:@"mapW.png"];
    CGRect buttonFrame = CGRectMake(0, 0,35, 35);
    
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(mapView) forControlEvents:UIControlEventTouchUpInside];
    //    [button setTitle:@"地图" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}
- (void)mapView
{
    
    
}

//右按钮2
- (UIBarButtonItem *)phoneButton
{
    UIImage *image = [UIImage imageNamed:@"phoneW.png"];
    CGRect buttonFrame = CGRectMake(0, 0,35, 35);
    
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(phoneView) forControlEvents:UIControlEventTouchUpInside];
    //    [button setTitle:@"电话" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    button.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,0);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}



- (void)phoneView
{
    NSString *phoneNum = @"4006767235";// 电话号码
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];   [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}

//轮播图请求
- (void)carouselRequest{
    
}
#pragma mark - AFNetworkServiceDelegate
- (void)finishedLoadingView
{
    [self loadiewFinished];
}
#pragma mark MJRefresh


-(void)footerRereshing{
    
}
- (void)loadiewFinished
{
    [homeTable headerEndRefreshing];
}


#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    [dataArr removeAllObjects];
    [NetImageArray removeAllObjects];
    [NetImageShopID removeAllObjects];
    [cellModelArray removeAllObjects];
    [self carouselRequest];
    [self uploadLatAndLon];
}


//左按钮
- (UIBarButtonItem *)cityButton
{
     CGRect buttonFrame = CGRectMake(20, 0,60, 35);
    cityBtn = [[UIButton alloc] initWithFrame:buttonFrame];
    [cityBtn addTarget:self action:@selector(cityView) forControlEvents:UIControlEventTouchUpInside];
    [cityBtn setBackgroundColor:[UIColor clearColor]];
    [cityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cityBtn setTitle:@"扬州市" forState:UIControlStateNormal];
    cityBtn.showsTouchWhenHighlighted = YES;
    cityBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13];//title字体大小
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:cityBtn];
    return item;
}


- (void)cityView{
    AddressViewController *addressVC = [[AddressViewController alloc]init];
    MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:addressVC];
    [self presentViewController:naVC animated:YES completion:nil];
}

#pragma mark - UItableView delegate
//设置表头
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 330;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([selectType isEqualToString:@"名店推荐"]) {
        return cellModelArray.count;
    }
    else{
        return cellModelArray.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 280;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableCell = @"SettingCell";
    HomeTableViewCell *cell = (HomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil)
    {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:tableCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.homeCellModel = cellModelArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [MBProgressHUD showError:@"未开发" toView:self.view];
    ShopDetailVC *push = [[ShopDetailVC alloc]init];
    push.title = @"商家";
    [self.navigationController pushViewController:push animated:YES];
}

#pragma mark============== SDScrollViewNetDelegate ===============

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [m_searchBa resignFirstResponder];
    ShopDetailVC *push = [[ShopDetailVC alloc]init];
    push.title = @"商家";
    [self.navigationController pushViewController:push animated:YES];
}
#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    
    SearchResualtViewController *resualtCtr = [[SearchResualtViewController alloc]init];
    [self.navigationController pushViewController:resualtCtr animated:YES];
    //    [searchBar endEditing:YES];
    //搜索结果接口（逻辑变了，之后接口传参要改变）
    //    AFNetworkService *jsonService = [[AFNetworkService alloc] init];
    //    jsonService.service_delegate = self;
    //    [jsonService getSearchvalRequest:searchBar.text andSuccess:^(NSDictionary *dataDic) {
    //
    //    } andFailed:^(ErrorModel *errorModel) {
    //        
    //    }];
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
