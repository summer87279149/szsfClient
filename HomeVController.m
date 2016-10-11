//
//  HomeVController.m
//  foot
//
//  Created by Admin on 16/9/28.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "AddViewController.h"
#import "KeyInputView.h"
#import "SearchViewController.h"
#import "SearchResualtViewController.h"
#import "HomeVController.h"
#import "SDCycleScrollView.h"
#import "HomeCellModel.h"
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
@interface HomeVController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchControllerDelegate,UITextViewDelegate,UMSocialUIDelegate,SDCycleScrollViewDelegate>
{
    SDCycleScrollView *topScrollView;
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
@property (nonatomic, retain) UISearchController *searchController;
@end

@implementation HomeVController
@synthesize m_searchBa,homeTable;
- (void)viewDidLoad {
    [super viewDidLoad];

//       [jingWeiDu getCity:^(NSString *addressString) {
//           currentCity = addressString;
//            NSDictionary *dict = [NSDictionary dictionaryWithObject:currentCity forKey:@"city"];
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"chooseCity" object:nil userInfo:dict];
//        }];
    [self createBackgroundAndNavigation];
    [self createArray];
    [self createHeaderView];
    [self createTableView];
    [self createKeyInputView];
}
-(void)createKeyInputView{
    KeyInputView *keyView = [KeyInputView keyInputView];
    [keyView.Btn setTitle:@"取消" forState:UIControlStateNormal];
    KeyInputViewBlock keyBlock = ^(KeyInputView *kV) {
        m_searchBa.text = @"";
        [m_searchBa resignFirstResponder];
    };
    keyView.keyBlock = keyBlock;
    m_searchBa.inputAccessoryView = keyView;
}
-(void)createBackgroundAndNavigation{
    
    backgroundImage = [UIImage imageNamed:@"homeVCBackgroundImage"];
    backgroundImageView = [[UIImageView alloc]initWithImage:backgroundImage];
    backgroundImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    backgroundImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignfirstre)];
    [backgroundImageView addGestureRecognizer:tap];
    [self.view addSubview:backgroundImageView];
    
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
//    self.navigationController.automaticallyAdjustsScrollViewInsets=NO;
}
-(void)createArray{
    NetImageArray = [[NSMutableArray alloc]initWithCapacity:0];
    NetImageShopID = [[NSMutableArray alloc]initWithCapacity:0];
    instruction = [[NSMutableString alloc]initWithString:@""];
    cellModelArray =[[NSMutableArray alloc]initWithCapacity:0];
    
}
-(void)createHeaderView{
   
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 350)];
    //    headerView.backgroundColor = [UIColor getColor:@"68C164"];
    headerView.backgroundColor = [UIColor clearColor];
 
    
    //中间足疗介绍View:pedicureInfo
    pedicureInfo = [[UIView alloc]initWithFrame:CGRectMake(0, 200, viewWidth, 150)];
    pedicureInfo.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"寻名师"]];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignfirstre)];
    [pedicureInfo addSubview:imageView];
    [pedicureInfo addGestureRecognizer:tap];
    [imageView addGestureRecognizer:tap];
    imageView.sd_layout
    .topSpaceToView(pedicureInfo,30)
    .bottomSpaceToView(pedicureInfo,35)
    .leftSpaceToView(pedicureInfo,10)
    .widthIs(100);
    
    pedicureInfo.backgroundColor = [UIColor clearColor];
    [headerView addSubview:pedicureInfo];
    
    
    //竖线
    UIView *lineView = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2, 215, 1, 40)];
    lineView.backgroundColor = [UIColor getColor:@"3b2935"];
    
    [headerView addSubview:lineView];
    lineView.sd_layout.leftSpaceToView(imageView,10*k_scale).heightIs(100).widthIs(1).bottomSpaceToView(headerView,20);
    
    midText = [[UITextView alloc]init];
    midText.text = instruction;
    midText.textColor = [UIColor getColor:@"3b2935"];
    midText.editable = NO;
    midText.delegate=self;
    midText.backgroundColor = [UIColor clearColor];
    [headerView addSubview:midText];
    
    UIView *lineView2 = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2, 215, 1, 40)];
    lineView2.backgroundColor = [UIColor getColor:@"3b2935"];
    [headerView addSubview:lineView2];
    lineView2.sd_layout.leftSpaceToView(imageView,180*k_scale).heightIs(100).widthIs(1).bottomSpaceToView(headerView,20);
    
    midText.sd_layout.leftSpaceToView(imageView,15*k_scale).heightIs(100).bottomSpaceToView(headerView,30).widthIs(165*k_scale);
    
    [self.view addSubview:headerView];
}
-(void)resignfirstre{
   
    [m_searchBa resignFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [m_searchBa resignFirstResponder];
}
-(void)createTableView{
    
    homeTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-44) style:UITableViewStylePlain];
    [self.view addSubview:homeTable];
//    homeTable.contentOffset=CGPointMake(0, 64);
    homeTable.dataSource = self;
    homeTable.delegate = self;
    
//    homeTable.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    homeTable.backgroundColor = [UIColor clearColor];
    homeTable.separatorColor = [UIColor getColor:@"3b2935"];
    homeTable.tableHeaderView = headerView;
    //请求数据
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [homeTable addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 自动刷新(一进入程序就下拉刷新)
    [homeTable headerBeginRefreshing];
   [homeTable headerEndRefreshing];
    [self performSelector:@selector(resetText) withObject:nil afterDelay:2.0f];

  
}




#pragma mark - 请求数据(上传经纬度)
-(void)uploadLatAndLon{
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied){
    WS(weakSelf);
    [[CCLocationManager shareLocation]  getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        lat = [NSNumber numberWithDouble:locationCorrrdinate.latitude];
        lon = [NSNumber numberWithDouble:locationCorrrdinate.longitude];
        [weakSelf startUploadLatAndLon];
    }];}
    else{
        UIAlertView *alvertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"需要开启定位服务才能正常使用,请到设置->隐私,打开定位服务" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alvertView show];
       [homeTable headerEndRefreshing]; 
    }
    
}
-(void)startUploadLatAndLon{
    NSString *cityCode = [[NSUserDefaults standardUserDefaults]objectForKey:CITYCODE];
    NSDictionary *prama = @{@"lng":lon,@"lat":lat,@"city":cityCode};
    NSLog(@"首页上传的参数是:%@",prama);
    WS(weakSelf)
    [XTRequestManager GET:XTUploadLinAndLon parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
//                NSLog(@"====%@",responseObject);
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
        [homeTable headerEndRefreshing];
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
    [m_searchBa resignFirstResponder];
    
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
        [homeTable headerBeginRefreshing];
    }
}
//轮播图
-(void)createNetScrollView{
   
    topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imageNamesGroup:NetImageArray];
    /** 设置占位图*/
    topScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
    /** 获取网络图片的index*/
    topScrollView.delegate = self;
    /** 添加到当前View上*/
    [headerView addSubview:topScrollView];
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
   [m_searchBa resignFirstResponder];
    NSString *phoneNum = @"4006767235";// 电话号码
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];   [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [m_searchBa resignFirstResponder];
    [NetImageArray removeAllObjects];
    [NetImageShopID removeAllObjects];
    [cellModelArray removeAllObjects];
    
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
    NSString *city = [[NSUserDefaults standardUserDefaults]objectForKey:CITYNAME];
    [cityBtn setTitle:city forState:UIControlStateNormal];
    cityBtn.showsTouchWhenHighlighted = YES;
    cityBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13];//title字体大小
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:cityBtn];
    return item;
}
- (void)cityView{
   [m_searchBa resignFirstResponder];
    AddViewController *addressVC = [[AddViewController alloc]init];
    MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:addressVC];
    [self presentViewController:naVC animated:YES completion:nil];
}


#pragma mark - UItableView delegate
//设置表头
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 300;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    return headerView;
//}

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
    if (cellModelArray.count>0) {
        cell.homeCellModel = cellModelArray[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCellModel*model = cellModelArray[indexPath.row];
    ShopDetailVC *push = [[ShopDetailVC alloc]init];
    push.shopID =model.shopID;
    push.title = @"商家";
    [self.navigationController pushViewController:push animated:YES];
}

#pragma mark============== SDScrollViewNetDelegate ===============

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    [m_searchBa resignFirstResponder];
    if (NetImageShopID.count>0) {
//        HomeCellModel*model = ;
        ShopDetailVC *push = [[ShopDetailVC alloc]init];
        push.shopID =NetImageShopID[index];
        push.title = @"商家";
        [self.navigationController pushViewController:push animated:YES];
    }
   
}
#pragma mark - searchControllerDelegate
//-(void)didDismissSearchController:(UISearchController *)searchController{
//    m_searchBa.hidden = NO;
//    self.view.hidden = NO;
//}
//-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
//{
//    m_searchBa.hidden = NO;
//    self.view.hidden = NO;
//}
//- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
//{
//    NSLog(@"监听搜索的值：%@",searchController.searchBar.text);
//}
#pragma mark - UISearchBarDelegate
//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
//    
//    SearchResualtViewController *resualtCtr = [[SearchResualtViewController alloc]init];
//    
//    SearchViewController*aaa = [[SearchViewController alloc]init];
//    self.searchController = [[UISearchController alloc] initWithSearchResultsController:aaa];
//    
//    // 搜索框检测代理
//    //（这个需要遵守的协议是 <UISearchResultsUpdating> ，这个协议中只有一个方法，当搜索框中的值发生变化的时候，代理方法就会被调用）
//    _searchController.searchResultsUpdater = self;
//    _searchController.view.backgroundColor = [UIColor whiteColor];
//    _searchController.delegate = self;
//    _searchController.searchBar.placeholder = @"漫画名/作者/类型";
//    //  _searchController.searchBar.delegate = self;
//     MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:_searchController];
//    [self presentViewController:naVC animated:YES completion:^{
//        // 当模态推出这个searchController的时候,需要把之前的searchBar隐藏,如果希望搜索的时候看不到热门搜索什么的,可以把这个页面给隐藏
////                m_searchBa.hidden = YES;
//        self.homeTable.hidden = YES;
//    }];
//}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    
    SearchResualtViewController *resualtCtr = [[SearchResualtViewController alloc]init];
    if (m_searchBa.text.length>0) {
        resualtCtr.keyword = m_searchBa.text;
        [self.navigationController pushViewController:resualtCtr animated:YES];
    }
  
}

-(void)viewWillDisappear:(BOOL)animated{
    [m_searchBa resignFirstResponder];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
