//
//  SearchResualtViewController.m
//  FootMassage
//
//  Created by Admin on 16/4/25.
//  Copyright © 2016年 Admin. All rights reserved.
//

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
@end

@implementation SearchResualtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    backgroundImage = [UIImage imageNamed:@"homeVCBackgroundImage"];
    backgroundImageView = [[UIImageView alloc]initWithImage:backgroundImage];
    backgroundImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:backgroundImageView];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        self.edgesForExtendedLayout=UIRectEdgeNone;
        
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"搜索结果";
    selectType = @"店铺相关";
    //三个筛选按钮
    for (int i = 0; i< 3; i ++) {
        UIButton * btn = [[UIButton alloc]initWithFrame: CGRectMake(viewWidth/3*i, 0, viewWidth/3, 40)];
        btn.tag = 600+i;
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitleColor:COLOR forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = 1;
//        [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
//        btn.imageEdgeInsets = UIEdgeInsetsMake(0,viewWidth/3,0,20);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
//        [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        
        if (i == 0) {
            [btn setTitle:@"店铺相关" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            oneBtn = btn;
        }
        else if(i == 1)
        {
            [btn setTitle:@"技师相关" forState:UIControlStateNormal];
            twoBtn = btn;
        }
        else
        {
            [btn setTitle:@"项目相关" forState:UIControlStateNormal];
            threeBtn  = btn;
        }
        [btn addTarget:self action:@selector(selectPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    searchResualtTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 41, viewWidth, viewHeight-120-115) style:UITableViewStylePlain];
    searchResualtTable.dataSource = self;
    searchResualtTable.delegate = self;
    searchResualtTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:searchResualtTable];
    
    
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
//            [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        }
//        [twoBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
//        [threeBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
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
//            [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];

        }
        else
        {
            isMost = 0;
            [btn setTitleColor:COLOR forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        }
//        [oneBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
//        [threeBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
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
//            [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
        }
        else
        {
            isLowest = 0;
            [btn setTitleColor:COLOR forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        }
        
//        [oneBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
//        [twoBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [oneBtn setTitleColor:COLOR forState:UIControlStateNormal];
        [twoBtn setTitleColor:COLOR forState:UIControlStateNormal];
    }
    
   
}

#pragma mark - UItableView delegate
//设置表头
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, 120)];
//    headerView.backgroundColor = [UIColor clearColor];
//    [headerView addSubview:WYNetScrollView];
//    return headerView;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([selectType isEqualToString:@"技师相关"] || [selectType isEqualToString:@"项目相关"]) {
        return 1;
    }
    else
    {
        if (isOpen && selectIndex.section == section) {
            
            return 2;
        }
        return 1;
    }
    //    return [shopArr count];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([selectType isEqualToString:@"技师相关"] || [selectType isEqualToString:@"项目相关"]) {
        return 110;
    }
    else
    {
        if (isOpen && selectIndex.section == indexPath.section && indexPath.row != 0) {
            
            return 80;
        }
        return 110;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([selectType isEqualToString:@"项目相关"]) {
        //项目
        static NSString *tableCell = @"ProjectCell";
        ProjectTableViewCell *cell = (ProjectTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
        if (cell == nil)
        {
            cell = [[ProjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:tableCell];
            cell.proCel_delegate = self;
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //数据源
//        [cell getData:indexPath];
//        [cell getDataModel:[projectArr objectAtIndex:indexPath.row]];
        return cell;
    }
    else if ([selectType isEqualToString:@"技师相关"]) {
        //技师
        static NSString *tableCell = @"TechnicianCell";
        TechnicianTableViewCell *cell = (TechnicianTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
        if (cell == nil)
        {
            cell = [[TechnicianTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:tableCell];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //数据源
//        TechnicianMode *mode = [visitArr objectAtIndex:indexPath.row];
//        [cell getTechnicianMode:mode];
        return cell;
    }
    else
    {
        if (isOpen && selectIndex.section == indexPath.section && indexPath.row != 0) {
            MoreTableViewCell *cell = (MoreTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
            
            
            if (cell == nil)
            {
                cell = [[MoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:CellIdentifier2];
                cell.moreCell_deleagte = self;
                cell.backgroundColor = [UIColor clearColor];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //数据源
            //            if ([headImgArr count] > 0) {
//            [cell getDataArr:headImgArr];
            //            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }else{
            
            ShopTableViewCell *cell = (ShopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
            
            if (cell == nil)
            {
                cell = [[ShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:CellIdentifier1];
                cell.shopCel_delegate = self;
                cell.backgroundColor = [UIColor clearColor];
            }
            [cell getData:indexPath];
            //数据源
//            if ([shopArr count] > indexPath.row) {
//                [cell getDataModel:[shopArr objectAtIndex:indexPath.section]];
//            }
            //            [cell getDataModel:[shopArr objectAtIndex:indexPath.row]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([selectType isEqualToString:@"店铺相关"]) {
//        ShopDetailViewController *shopDetailCtr = [[ShopDetailViewController alloc]init];
        ShopDetailVC*shopDetailCtr = [[ShopDetailVC alloc]init];
        //        ShopMode *mode = [shopArr objectAtIndex:indexPath.row];
        //        shopDetailCtr.title = mode.shopName;
        [self.navigationController pushViewController:shopDetailCtr animated:YES];
        
        
    }
    else if ([selectType isEqualToString:@"技师相关"]) {
        
//        TechnicianMode *mode = [visitArr objectAtIndex:indexPath.row];
        TechViewController *tecDetailCtr = [[TechViewController alloc]init];
//        tecDetailCtr.technicianID =mode.technicianID;
//        tecDetailCtr.title = mode.name;
        [self.navigationController pushViewController:tecDetailCtr animated:YES];
    }

    else
    {
//        ProjectDetailViewController *proCtr = [[ProjectDetailViewController alloc]init];
        ServiceViewController*xiangmu = [[ServiceViewController alloc]init];
//        proCtr.title = @"清水足浴";
        [self.navigationController pushViewController:xiangmu animated:YES];
        
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
//        NSLog(@"11index === %ld",(long)selectIndex.section);
        [searchResualtTable insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    else
    {
        
        [searchResualtTable deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    //    [toShopTable reloadData];
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
//                ShopMode *mode = [shopArr objectAtIndex:pathIndex.section];
//                
//                [headImgArr removeAllObjects];
                
                //获取店铺商家技师头像接口
//                AFNetworkService *jsonService = [[AFNetworkService alloc] init];
//                jsonService.service_delegate = self;
//                [jsonService getShoptechRequest:mode.shopID andSuccess:^(NSDictionary *dataDic) {
//                    
//                    headImgArr = [dataDic valueForKey:@"result"];
                
                    [self didSelectCellRowFirstDo:YES nextDo:NO];
//                    [self loadiewFinished];
//                    [toShopTable reloadData];
//                } andFailed:^(ErrorModel *errorModel) {
//                    
//                    //                    isOpen = NO;
//                    //                    [self didSelectCellRowFirstDo:NO nextDo:NO];
//                    [self loadiewFinished];
//                }];
                
                
            }
            //            else{
            //
            //                [self didSelectCellRowFirstDo:NO nextDo:YES];
            //            }
        }
        
    }else{
        /**
         *  no reaction
         */
        
    }
    
    [searchResualtTable deselectRowAtIndexPath:pathIndex animated:YES];
}

#pragma mark============== ProjectTableViewCellDelegate ===============
// 点击预约按钮事件
- (void)sendReserveTag:(NSIndexPath *)pathIndex
{
////    ProjectModel *proMode = [projectArr objectAtIndex:pathIndex.row];
//    TechnicianListViewController *tecListCtr = [[TechnicianListViewController alloc]init];
////    tecListCtr.projectID = proMode.projectID;
////    tecListCtr.title = proMode.projectName;
//    [self.navigationController pushViewController:tecListCtr animated:YES];
//    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
