//
//  ToMyHomeViewController.m
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "TabelCellModel.h"
#import "ToMyHomeCellModel.h"
#import "ToMyHomeViewController.h"
#import "ToMyHomeTableViewCell.h"
#import "DXPopover.h"
#import "TableViewCell.h"
#import "TechViewController.h"
#import "QueryByProjectViewController.h"
@interface ToMyHomeViewController ()<UITableViewDelegate,UITableViewDataSource,ToMyHomeTableViewCellDelegate>
{
    UITableView *popoverTableView;
    UIImageView *BGImage;
    UIView *headerView;
    UIButton *oneBtn;
    UIButton *twoBtn;
    //判断按钮重复事件
    BOOL isRecent;      //最近
    BOOL isMost;        //最多
    BOOL isLowest;      //最低
    //两变量为空则为最近
    NSString *most;             // 订单最多
    NSString *floor;            //价格最低
    NSString *selectType;
    UITableView *tableview;
    NSMutableArray *distanceArr;     //都用这个数组

    int Page;           //页码
    BOOL HasMore;       //是否有更多
    DXPopover *popover;
    UIImageView *imageBrown;
    UITextView *topText;
    
    /** 经纬度*/
    NSNumber *lat;
    NSNumber *lon;
    
    /**最上面的文字*/
    NSString* topTextstr;
    
    /**到店技师模型和数组*/
    ToMyHomeCellModel *toMyHomeCellModel;
//    NSMutableArray *toMyHomeCellModelArr;
    
    /**popTableView模型和数组*/
    TabelCellModel *tabelCellModel;
//    NSMutableArray *tabelCellModelArr;
    
}
@property(nonatomic,copy)NSMutableArray *toMyHomeCellModelArr;
@property(nonatomic,copy)NSMutableArray *tabelCellModelArr;
@property(nonatomic,copy)NSArray *guDingArr;
@end

@implementation ToMyHomeViewController
@synthesize toMyHomeCellModelArr = toMyHomeCellModelArr;
@synthesize tabelCellModelArr = tabelCellModelArr;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createHeaderView];
    [self uploadLatAndLonisHeaderRefresh:YES];
    [self createTableView];
}
#pragma mark 创建UI
-(void)createHeaderView{
    toMyHomeCellModelArr = [[NSMutableArray alloc]initWithCapacity:10];
    tabelCellModelArr = [[NSMutableArray alloc]initWithCapacity:10];
    distanceArr = [[NSMutableArray alloc]initWithCapacity:10];
//    projectArr = [[NSMutableArray alloc]initWithCapacity:0];
    
    BGImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeVCBackgroundImage"]];
    [self.view addSubview:BGImage];
    BGImage.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 130)];
    [self.view addSubview:headerView];
    headerView.backgroundColor = [UIColor clearColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"寻名师"]];
    [headerView addSubview:imageView];
    imageView.sd_layout.topSpaceToView(headerView,20).bottomSpaceToView(headerView,35).leftSpaceToView(headerView,10).widthIs(100);
    
    UITextView *midText = [[UITextView alloc]init];
    midText.text = @"";
    midText.textColor = [UIColor getColor:@"3b2935"];
    midText.editable = NO;
    midText.backgroundColor = [UIColor clearColor];
    [headerView addSubview:midText];
    midText.sd_layout.leftSpaceToView(imageView,15*k_scale).heightIs(100).bottomSpaceToView(headerView,30).rightSpaceToView(headerView,15*k_scale);
    topText=midText;
    
    imageBrown = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"brown"]];
    imageBrown.userInteractionEnabled  =   YES;
    [headerView addSubview:imageBrown];
    imageBrown.sd_layout.heightIs(25*k_scale).topSpaceToView(midText,1).leftSpaceToView(headerView,10).rightSpaceToView(headerView,10);
    //竖线
    UIImageView *lineView = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2, 205, 1, 40)];
    lineView.backgroundColor = [UIColor getColor:@"3b2935"];
    [headerView addSubview:lineView];
    lineView.sd_layout.leftSpaceToView(imageView,10*k_scale).heightIs(130).widthIs(1).bottomSpaceToView(headerView,0);
    UIImageView *lineView2 = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2, 205, 1, 40)];
    lineView2.backgroundColor = [UIColor getColor:@"3b2935"];
    [headerView addSubview:lineView2];
    lineView2.sd_layout.leftSpaceToView(midText,2*k_scale).heightIs(130).widthIs(1).bottomSpaceToView(headerView,0);
    
    //两个按钮
    for (int i = 0; i< 2; i ++) {
        UIButton * btn = [[UIButton alloc]initWithFrame: CGRectMake(viewWidth/3*i, 120, viewWidth/3, 30)];
        btn.tag = 300+i;
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitleColor:COLOR forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        btn.titleLabel.textAlignment = 1;
        //        [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        //        btn.imageEdgeInsets = UIEdgeInsetsMake(0,viewWidth/3,0,20);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
        [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [imageBrown addSubview:btn];
        if (i == 0) {
            [btn setTitle:@"查询附近" forState:UIControlStateNormal];
            btn.sd_layout.leftSpaceToView(imageBrown,10).widthIs(kScreenWidth/4).topSpaceToView(imageBrown,3).bottomSpaceToView(imageBrown,3);
            oneBtn = btn;
//            btn.enabled=NO;
        }
        else if(i == 1)
        {
            [btn setTitle:@"点击按项目查询" forState:UIControlStateNormal];
            btn.sd_layout.leftSpaceToView(lineView,10).widthIs(kScreenWidth/2).topSpaceToView(imageBrown,3).bottomSpaceToView(imageBrown,3);
            twoBtn = btn;
        }
        [btn addTarget:self action:@selector(selectPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    popoverTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 180*k_scale, 100*k_scaleHeight) style:UITableViewStylePlain];
    popoverTableView.delegate = self;
    popoverTableView.dataSource = self;
    popoverTableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellBG-1"]];
    popoverTableView.separatorColor = COLOR;
    popover = [DXPopover popover];
    
}
-(void)createTableView{
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 130, kScreenWidth, kScreenHeight-130-64-49) style:UITableViewStylePlain];
    [self.view addSubview:tableview];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.backgroundColor = [UIColor clearColor];
    tableview.estimatedRowHeight = 350*k_scaleHeight;
    tableview.rowHeight = UITableViewAutomaticDimension;
    [self setupRefresh];
}
#pragma mark tableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == popoverTableView) {
        return tabelCellModelArr.count;
    }else{
        return toMyHomeCellModelArr.count;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == popoverTableView) {
        return 30*k_scaleHeight;
    }else{
    UITableViewCell *cell = [self tableView:tableview cellForRowAtIndexPath:indexPath];
    return cell.height+10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == popoverTableView) {
        static NSString *ID=@"projectTableViewCell";
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if(cell==nil){
            cell=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (tabelCellModelArr.count>0) {
            cell.tabelCellModel = tabelCellModelArr[indexPath.row];
        }
        return cell;
    }else{
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
//            NSLog(@"当前indexPath的行数是%ld",(long)indexPath.row);
        }
//        NSLog(@"数组里面一共有%lu行数据，分别是%@",(unsigned long)toMyHomeCellModelArr.count,toMyHomeCellModelArr);
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == popoverTableView) {
        TabelCellModel * model = tabelCellModelArr[indexPath.row];
        QueryByProjectViewController *vc =[[QueryByProjectViewController alloc]init];
        vc.projectID  = model.pid;
        vc.projectName = model.name;
//        NSLog(@"projectID是：%@",vc.projectID);
        [popover dismiss];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}
#pragma mark 按钮点击
- (void)selectPress:(UIButton *)sender
{
    UIButton *btn = sender;
    if (btn.tag == 300) {
        [tableview headerBeginRefreshing];
        isRecent = !isRecent;
        if (isRecent) {
            isMost = 0;
            isLowest = 0;
//            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
            most = @"";
            floor = @"";
            
        }
        else
        {
//            isRecent = 0;
//            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        }
        [twoBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (btn.tag == 301)
    {
        [self smallTableRequest];
        CGPoint startPoint =
        CGPointMake(CGRectGetMidX(twoBtn.frame), CGRectGetMaxY(imageBrown.frame));
        [popover showAtPoint:startPoint popoverPostion:DXPopoverPositionDown withContentView:popoverTableView inView:self.view];
        
    }
}
#pragma  mark - popTable的请求
-(void)smallTableRequest{
    
}
#pragma mark - 请求数据(距离查询)
-(void)uploadLatAndLonisHeaderRefresh:(BOOL)isHeaderRefresh{
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied){
    WS(weakSelf);
    [[CCLocationManager shareLocation]  getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        lat = [NSNumber numberWithDouble:locationCorrrdinate.latitude];
        lon = [NSNumber numberWithDouble:locationCorrrdinate.longitude];
        [weakSelf startUploadLatAndLonisHeaderRefresh:isHeaderRefresh];
    }];}
    else{
        UIAlertView *alvertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"需要开启定位服务才能正常使用,请到设置->隐私,打开定位服务" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alvertView show];
        [tableview headerEndRefreshing];
        [tableview footerEndRefreshing];
    }
}
-(void)startUploadLatAndLonisHeaderRefresh:(BOOL)isHeaderRefresh{
    if (isHeaderRefresh) {
        Page = 1;
    }else{
        ++Page;
    }
    NSNumber *pageNum = [NSNumber numberWithInteger:Page];
    NSDictionary *prama = @{@"lng":lon,@"lat":lat,@"page":pageNum};
    NSLog(@"上门参数是:%@",prama);
    WS(weakSelf)
    [XTRequestManager GET:kToMyHome parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
    NSLog(@"====%@",responseObject);
        
            NSDictionary *dic = responseObject[@"instruction"];
            topTextstr = dic[@"inst"];
        if ([responseObject[@"overflow"] isEqualToString:@"0"]) {
            HasMore = YES;
        }else{
            HasMore = NO;
        }
            NSArray *projectArr = responseObject[@"project"];
            for (NSDictionary *d in projectArr) {
                tabelCellModel = [[TabelCellModel alloc]initFromDictionary:d];
//                NSLog(@"小tableview的模型师 %@",tabelCellModel.name);
                [tabelCellModelArr addObject:tabelCellModel];
            }
            
            NSArray *technician = responseObject[@"technician"];
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
    
    topText.text = topTextstr;
    [tableview reloadData];
    [popoverTableView reloadData];
    
    [self loadFinished];
}


-(void)loadFinished{
    [tableview headerEndRefreshing];
    [tableview footerEndRefreshing];
    [popoverTableView headerEndRefreshing];
    [popoverTableView footerEndRefreshing];
}

#pragma mark 下拉刷新
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [tableview addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 自动刷新(一进入程序就下拉刷新)
//    [tableview headerBeginRefreshing];
    
    //2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [tableview addFooterWithTarget:self action:@selector(footerRereshing)];
}
-(void)headerRereshing{
   
    //把数组全部清空，重新请求数据
    [toMyHomeCellModelArr removeAllObjects];
    [tabelCellModelArr removeAllObjects];
    [distanceArr removeAllObjects];
    Page = 1;
    HasMore = NO;
    [self uploadLatAndLonisHeaderRefresh:YES];
}

- (void)footerRereshing{
    if (HasMore == YES) {
        [self uploadLatAndLonisHeaderRefresh:NO];
    }
    else
    {
        [tableview footerEndRefreshing];
    }
    
}


#pragma mark ======ToMyHomeTableViewCellDelegate=======
-(void)cellOrderBtnClicked:(NSInteger)row{
    ToMyHomeCellModel *model = toMyHomeCellModelArr[row];
    NSLog(@"当前点击了第%lu个cell",row);
    TechViewController * tech = [[TechViewController alloc]init];
    tech.techID = model.techID;
    NSLog(@"技师id是:%@  名字是:%@",model.techID,model.name);
    [self.navigationController pushViewController:tech animated:YES];
}
-(void)focusBtnClick:(UITableViewCell *)cell{
    NSIndexPath *index = [tableview indexPathForCell:cell];
    if (ArrayNonNull(distanceArr) && distanceArr.count >= index.row+1) {
        ToMyHomeCellModel *model = distanceArr[index.row];
        
        
        /**
         *  写关注
         *
         *
         */
        
    }
    
}
-(void)cancelFocusBtnClick:(UITableViewCell *)cell {
    NSIndexPath *index = [tableview indexPathForCell:cell];
    if (ArrayNonNull(distanceArr) && distanceArr.count >= index.row+1) {
        ToMyHomeCellModel *model = distanceArr[index.row];
        /**
         *  写取消关注
         *
         *
         */
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
