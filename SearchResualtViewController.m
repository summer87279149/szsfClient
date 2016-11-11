//
//  SearchResualtViewController.m
//  FootMassage
//
//  Created by Admin on 16/4/25.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "ToShopCellModel.h"
#import "SearchCellModel.h"
#import "SearchResualtViewController.h"
#import "ShopTableViewCell.h"
#import "MoreTableViewCell.h"
#import "ProjectTableViewCell.h"
#import "TechnicianTableViewCell.h"
//#import "ProjectDetailViewController.h"
//#import "ShopDetailViewController.h"
//#import "TechnicianListViewController.h"
//#import "TechnicianDetailViewController.h"
#import "ShopDetailVC.h"

#import "ServiceViewController.h"
#import "TechViewController.h"
static NSString *CellIdentifier2 = @"cellidentifer2";
static NSString *CellIdentifier1 = @"cellidentifer1";

@interface SearchResualtViewController ()<UITableViewDelegate,UITableViewDataSource,MoreTableViewCellDelegate,ShopTableViewCellDelegate,ProjectTableViewCellDelegate>
{
    /** 经纬度*/
    NSNumber *lat;
    NSNumber *lon;
    UIButton *oneBtn;
    UIButton *twoBtn;
    UIButton *threeBtn;
    //判断按钮重复事件
    BOOL isRecent;      //最近
    BOOL isMost;        //最多
    BOOL isLowest;      //最低
    NSString *selectType;  //选择类型
    
    NSIndexPath *selectIndex;
    BOOL isOpen;
    
    UITableView *searchResualtTable;
    UIImageView *backgroundImageView;
    UIImage *backgroundImage;
}
@property(nonatomic,strong)NSMutableArray *shopsArr;
@end

@implementation SearchResualtViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.shopsArr = [[NSMutableArray alloc]initWithCapacity:0];
    backgroundImage = [UIImage imageNamed:@"homeVCBackgroundImage"];
    backgroundImageView = [[UIImageView alloc]initWithImage:backgroundImage];
    backgroundImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:backgroundImageView];
  
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"搜索结果";
    selectType = @"店铺相关";
 
    [self uploadLatAndLon];
    
    searchResualtTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    searchResualtTable.dataSource = self;
    searchResualtTable.delegate = self;
    searchResualtTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:searchResualtTable];
    
}
#pragma mark - 加载数据
-(void)uploadLatAndLon{
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied){
        WS(weakSelf);
        [[CCLocationManager shareLocation]  getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
            lat = [NSNumber numberWithDouble:locationCorrrdinate.latitude];
            lon = [NSNumber numberWithDouble:locationCorrrdinate.longitude];
            [weakSelf getNetData];
        }];}
    else{
        UIAlertView *alvertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"需要开启定位服务才能正常使用,请到设置->隐私,打开定位服务" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alvertView show];
        [searchResualtTable headerEndRefreshing];
    }
}
-(void)getNetData{
    
    SHOWHUD
    NSDictionary *prama = @{@"lng":lon,@"lat":lat,@"keyword":self.keyword};
    WS(weakSelf)
    [XTRequestManager GET:kXTCommonAPIConstantSearchShop parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        NSLog(@"  搜索结果  页面返回数据是:%@",responseObject);
        NSArray *arr = responseObject[@"shop"];
        for(NSDictionary *dic in arr){
//            NSLog(@"字典是%@",dic);
            ToShopCellModel *model =[[ToShopCellModel alloc]initFromDictionary:dic];
            [_shopsArr addObject:model];
//            NSLog(@"shuzu是:%@",self.shopsArr);
            [searchResualtTable reloadData];
        }
        HIDEHUDWeakSelf
    } failure:^(NSError *error) {
        HIDEHUDWeakSelf
    }];
}
- (void)selectPress:(id)sender
{
    UIButton *btn = sender;
    if (btn.tag == 600) {

        isRecent = !isRecent;
        if (isRecent) {
            isMost = 0;
            isLowest = 0;
            selectType = @"店铺相关";
             [searchResualtTable reloadData];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
        }
        else
        {
            isRecent = 0;
            [btn setTitleColor:COLOR forState:UIControlStateNormal];
        }
;
        [twoBtn setTitleColor:COLOR forState:UIControlStateNormal];
        [threeBtn setTitleColor:COLOR forState:UIControlStateNormal];
    }
    else if (btn.tag == 601)
    {
        isMost = !isMost;
        if (isMost) {
            isRecent = 0;
            isLowest = 0;
            selectType = @"技师相关";
             [searchResualtTable reloadData];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        }
        else
        {
            isMost = 0;
            [btn setTitleColor:COLOR forState:UIControlStateNormal];
        }

        [oneBtn setTitleColor:COLOR forState:UIControlStateNormal];
        [threeBtn setTitleColor:COLOR forState:UIControlStateNormal];
    }
    else
    {
        isLowest = !isLowest;
        if (isLowest) {
            isRecent = 0;
            isMost = 0;
            selectType = @"项目相关";
             [searchResualtTable reloadData];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        else
        {
            isLowest = 0;
            [btn setTitleColor:COLOR forState:UIControlStateNormal];
        }
        

        [oneBtn setTitleColor:COLOR forState:UIControlStateNormal];
        [twoBtn setTitleColor:COLOR forState:UIControlStateNormal];
    }
    
   
}

#pragma mark - UItableView delegate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSLog(@"shuzu de shuliang shi %lu",self.shopsArr.count);
        return self.shopsArr.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableCell = @"SettingCell1";
    ShopTableViewCell *cell = (ShopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil)
    {
        cell = [[ShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:tableCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (_shopsArr.count>0) {
        cell.shopCel_delegate = self;
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.toShopCellModel = self.shopsArr[indexPath.row];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_shopsArr.count>0) {
        ToShopCellModel*model = _shopsArr[indexPath.row];
        if (StringNonNull(model.shopID)) {
            ShopDetailVC *push = [[ShopDetailVC alloc]init];
            push.shopID =model.shopID;
            push.title = @"商家";
            [self.navigationController pushViewController:push animated:YES];
        }
    }else{
        [MBProgressHUD showError:@"请等待加载完成"];
    }
}

- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    isOpen = firstDoInsert;
    
    NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
    NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:1 inSection:selectIndex.section];
    [rowToInsert addObject:indexPathToInsert];
    [searchResualtTable beginUpdates];
    if (firstDoInsert)
    {
        [searchResualtTable insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    else
    {
        [searchResualtTable deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    [searchResualtTable endUpdates];
    
    if (nextDoInsert) {
        isOpen = YES;
        selectIndex = [searchResualtTable indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    
    if (isOpen){
        
        [searchResualtTable scrollToRowAtIndexPath:selectIndex atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
}

#pragma mark============== ShopTableViewCellDelegate ===============
//向下箭头按钮
- (void)sendIndexPath:(NSIndexPath *)pathIndex
{
    
    if (pathIndex.row == 0) {
        /**
         *  expand cell select method
         */
        if ([pathIndex isEqual:selectIndex]) {
            isOpen = NO;
            [self didSelectCellRowFirstDo:NO nextDo:NO];
            selectIndex = nil;
        }else{
            if (!selectIndex) {
                selectIndex = pathIndex;
                    [self didSelectCellRowFirstDo:YES nextDo:NO];
            }
        }
    }else{

    }
    
    [searchResualtTable deselectRowAtIndexPath:pathIndex animated:YES];
}

#pragma mark============== ProjectTableViewCellDelegate ===============
// 点击预约按钮事件
- (void)sendReserveTag:(NSIndexPath *)pathIndex
{
  
    NSLog(@"tag:%ld",(long)pathIndex.row);
}

#pragma mark============== MoreTableViewCellDelegate ===============
//展开的技师头像按钮
- (void)sendBtnTag:(NSInteger)btnTag
{
//    //    TechnicianMode mode = [headImgArr];
//    TechnicianDetailViewController *tecDetailCtr = [[TechnicianDetailViewController alloc]init];
////    tecDetailCtr.technicianID = [[headImgArr objectAtIndex:btnTag] valueForKey:@"id"];
////    tecDetailCtr.title = [[headImgArr objectAtIndex:btnTag] valueForKey:@"name"];
//    [self.navigationController pushViewController:tecDetailCtr animated:YES];
//    NSLog(@"btnTag == %ld",(long)btnTag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
