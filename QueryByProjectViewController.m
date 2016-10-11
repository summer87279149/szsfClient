//
//  QueryByProjectViewController.m
//  foot
//
//  Created by Admin on 16/9/30.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "ToMyHomeTableViewCell.h"
#import "ToMyHomeCellModel.h"
#import "QueryByProjectViewController.h"
#import "TechViewController.h"
@interface QueryByProjectViewController ()<UITableViewDelegate,UITableViewDataSource,ToMyHomeTableViewCellDelegate>
{
    UITableView *tableview;
    /** 经纬度*/
    NSNumber *lat;
    NSNumber *lon;
    
    /**最上面的文字*/
    NSString* topTextstr;
    
    /**到店技师模型和数组*/
    ToMyHomeCellModel *toMyHomeCellModel;
    int Page;           //页码
    BOOL HasMore;       //是否有更多
}
@property(nonatomic,copy)NSMutableArray *toMyHomeCellModelArr;
@property(nonatomic,copy)NSMutableArray *tabelCellModelArr;
@end

@implementation QueryByProjectViewController
@synthesize toMyHomeCellModelArr = toMyHomeCellModelArr;
@synthesize tabelCellModelArr = tabelCellModelArr;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.projectName;
    HaHaHaAddBackGroundImage
    toMyHomeCellModelArr = [[NSMutableArray alloc]initWithCapacity:0];
    tabelCellModelArr = [[NSMutableArray alloc]init];
    [self createTableview];
}
-(void)createTableview{
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-44) style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.estimatedRowHeight = 350*k_scaleHeight;
    tableview.rowHeight = UITableViewAutomaticDimension;
    [self setupRefresh];
}
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [tableview addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 自动刷新(一进入程序就下拉刷新)
    [tableview headerBeginRefreshing];
    //2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [tableview addFooterWithTarget:self action:@selector(footerRereshing)];
}
-(void)headerRereshing{
    //把数组全部清空，重新请求数据
    [toMyHomeCellModelArr removeAllObjects];
    [tabelCellModelArr removeAllObjects];
    Page = 1;
    HasMore = NO;
    [self uploadLatAndLonWithProjectID:self.projectID isHeaderRefresh:YES ];
}

- (void)footerRereshing{
    if (HasMore == YES) {
      [self uploadLatAndLonWithProjectID:self.projectID isHeaderRefresh:NO ];
    }
    else
    {
        [tableview footerEndRefreshing];
    }
    
}

#pragma mark - 请求数据(项目查询,传入项目id)

-(void)uploadLatAndLonWithProjectID:(NSString *)projectID isHeaderRefresh:(BOOL)isHeaderRefresh{
    //    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    WS(weakSelf);
    [[CCLocationManager shareLocation]  getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        lat = [NSNumber numberWithDouble:locationCorrrdinate.latitude];
        lon = [NSNumber numberWithDouble:locationCorrrdinate.longitude];
        [weakSelf startUploadLatAndLon:projectID isHeaderRefresh:isHeaderRefresh ];
    }];
}

-(void)startUploadLatAndLon:(NSString *)projectID isHeaderRefresh:(BOOL)isHeaderRefresh{
    if (isHeaderRefresh) {
        Page = 1;
    }else{
        ++Page;
    }
    NSNumber *pageNum = [NSNumber numberWithInteger:Page];
    NSDictionary *prama = @{@"lng":lon,@"lat":lat,@"techbyproj":projectID,@"page":pageNum};
    WS(weakSelf)
    [XTRequestManager GET:kToMyHome parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
//        NSLog(@"====%@",responseObject);
        NSArray *technician = responseObject[@"technician"];
        if ([responseObject[@"overflow"] isEqualToString:@"0"]) {
            HasMore = YES;
        }else{
            HasMore = NO;
        }
        for (NSDictionary *dd in technician) {
            toMyHomeCellModel = [[ToMyHomeCellModel alloc]initFromDictionary:dd];
            [toMyHomeCellModelArr addObject:toMyHomeCellModel];
        }
        [weakSelf applyDataFromResponseObject];
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark- 设置数据
-(void)applyDataFromResponseObject{
    [tableview reloadData];
    [tableview headerEndRefreshing];
}
#pragma mark - TableviewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableview cellForRowAtIndexPath:indexPath];
    return cell.height+10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return toMyHomeCellModelArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *IDD=@"cell";
    ToMyHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDD];
    if(cell==nil){
        cell=[[ToMyHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDD];
    }
    if ( toMyHomeCellModelArr.count>0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate =self;
        cell.toMyHomeCellModel = toMyHomeCellModelArr[indexPath.row];
        cell.myCurrentRow = indexPath.row;
    }
    return cell;
}
#pragma mark ======ToMyHomeTableViewCellDelegate=======
-(void)cellOrderBtnClicked:(NSInteger)row{
    ToMyHomeCellModel *model = toMyHomeCellModelArr[row];
    NSLog(@"当前点击了第%lu个cell",row);
    TechViewController * tech = [[TechViewController alloc]init];
    tech.techID = model.techID;
    [self.navigationController pushViewController:tech animated:YES];
}


-(void)focusBtnClick:(UITableViewCell *)cell {
    
}
-(void)cancelFocusBtnClick:(UITableViewCell *)cell {
    
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
