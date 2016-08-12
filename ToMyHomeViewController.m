//
//  ToMyHomeViewController.m
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "ToMyHomeViewController.h"
#import "ToMyHomeTableViewCell.h"
#import "DXPopover.h"
#import "TableViewCell.h"
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
    NSMutableArray *distanceArr;     //技师数组距离排序
    NSMutableArray *projectArr;     //数组项目排序
    int Page;           //页码
    BOOL HasMore;       //是否有更多
    DXPopover *popover;
    UIImageView *imageBrown;
}
@end

@implementation ToMyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createHeaderView];
    [self createTableView];
}
//
-(void)createHeaderView{
    distanceArr = [[NSMutableArray alloc]initWithCapacity:0];
    projectArr = [[NSMutableArray alloc]initWithCapacity:0];
    
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
    midText.text = @"在中医文化中，足疗法源远流长，它源于我国古代，是人们在长期的社会实践中的知识积累和经验总结，至今已有3000多年的历史传统。古人曾经有过许多对足浴的经典记载和描述：“春天洗脚，升阳固脱；夏天洗脚，暑湿可祛；秋天洗脚,肺润肺濡；冬天洗脚，丹田温灼";
    midText.textColor = [UIColor getColor:@"3b2935"];
    midText.editable = NO;
    midText.backgroundColor = [UIColor clearColor];
    [headerView addSubview:midText];
    midText.sd_layout.leftSpaceToView(imageView,15*k_scale).heightIs(100).bottomSpaceToView(headerView,30).rightSpaceToView(headerView,15*k_scale);
    
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
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = 1;
        //        [btn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        //        btn.imageEdgeInsets = UIEdgeInsetsMake(0,viewWidth/3,0,20);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
        [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [imageBrown addSubview:btn];
        if (i == 0) {
            [btn setTitle:@"距离排序" forState:UIControlStateNormal];
            btn.sd_layout.leftSpaceToView(imageBrown,10).widthIs(kScreenWidth/4).topSpaceToView(imageBrown,3).bottomSpaceToView(imageBrown,3);
            oneBtn = btn;
        }
        else if(i == 1)
        {
            [btn setTitle:@"项目排序" forState:UIControlStateNormal];
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
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == popoverTableView) {
        return 10;
    }
    return 5;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == popoverTableView) {
        return 30*k_scaleHeight;
    }else{
    UITableViewCell *cell = [self tableView:tableview cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == popoverTableView) {
        static NSString *ID=@"projectTableViewCell";
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if(cell==nil){
            cell=[[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        return cell;
    }else{
    static NSString *ID=@"cell";
    ToMyHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[ToMyHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == popoverTableView) {
        [popover dismiss];
    }
}

- (void)selectPress:(UIButton *)sender
{
    UIButton *btn = sender;
    if (btn.tag == 300) {
        [MBProgressHUD showError:@"未开发"];
        isRecent = !isRecent;
        if (isRecent) {
            isMost = 0;
            isLowest = 0;
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
            most = @"";
            floor = @"";
            [self setupRefresh];
        }
        else
        {
            isRecent = 0;
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        }
        [twoBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else if (btn.tag == 301)
    {
        
        CGPoint startPoint =
        CGPointMake(CGRectGetMidX(twoBtn.frame), CGRectGetMaxY(imageBrown.frame));
        [popover showAtPoint:startPoint popoverPostion:DXPopoverPositionDown withContentView:popoverTableView inView:self.view];
        
//        NSLog(@"项目排序");
//        isMost = !isMost;
//        if (isMost) {
//            isRecent = 0;
//            isLowest = 0;
//            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
//            most = @"1";
//            floor = @"";
//            [self setupRefresh];
//        }
//        else
//        {
//            isMost = 0;
//            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
//        }
//        [oneBtn setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
//        [oneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
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
    [distanceArr removeAllObjects];
    [projectArr removeAllObjects];
    Page = 1;
    HasMore = NO;

    /**
     *  这里写数据请求
     *
     *  @return
     */
}

- (void)footerRereshing
{
    if (HasMore == YES) {
        /**
         *  请求数据
         */
    }
    else
    {
        [tableview footerEndRefreshing];
    }
    
}



#pragma mark ======ToMyHomeTableViewCellDelegate=======
-(void)cellOrderBtnClicked{
    /**
     *  预约按钮点击事件
     */
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
