//
//  TechViewController.m
//  FootMassage
//
//  Created by Admin on 16/8/8.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "TechCommentVController.h"
#import "ServiceViewController.h"
#import "TechViewController.h"
#import "UILabel+XTinit.h"
#import "UIView+lineView.h"
#import "myTableViewCell.h"
#import "ThreeTableViewCell.h"
@interface TechViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *BGImage;
    UIScrollView *scrollView;
    UIView *topView;
    UITableView *tableview;
    UITableView *threeCommentsTableview;
}
@end

@implementation TechViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"技师";
    BGImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeVCBackgroundImage"]];
    BGImage.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:BGImage];
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:scrollView];
    scrollView.scrollEnabled = YES;
    scrollView.backgroundColor = [UIColor clearColor];
    [self creatTopView];
    [self creatTableView];
    
    //添加测试数据
    [self createTestData];
}
-(void)creatTableView{
    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.tableHeaderView = topView;
    tableview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tableview];
}
-(void)creatTopView{
    topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 201*k_scaleHeight)];
    topView.backgroundColor =[UIColor clearColor];
//    [scrollView addSubview:topView];
    //头像
    self.portrait = [[UIImageView alloc]initWithFrame:CGRectMake(26*k_scale, 10, 64*k_scale, 64*k_scale)];
    self.portrait.layer.cornerRadius = 32*k_scale;
    self.portrait.layer.masksToBounds = YES;
    self.portrait.backgroundColor = COLOR;
    [topView addSubview:self.portrait];
    //关注按钮
    self.focusButton = [[UIButton alloc]init];
    [topView addSubview:self.focusButton];
    [self.focusButton setTitle:@"+关注" forState:UIControlStateNormal];
    self.focusButton.alpha = 0.8;
    [self.focusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.focusButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [self.focusButton setBackgroundColor:COLOR];
    self.focusButton.layer.cornerRadius = 7*k_scale;
    self.focusButton.layer.masksToBounds = YES;
    self.focusButton.sd_layout.rightSpaceToView(topView,14*k_scale).heightIs(20).topEqualToView(self.portrait).widthIs(45*k_scale);
    [self.focusButton addTarget:self action:@selector(focusButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    //技师名字
    self.name = [UILabel sharedWithFont:15 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [topView addSubview:self.name];
    self.name.sd_layout.topEqualToView(self.focusButton).leftSpaceToView(self.portrait,15*k_scale).heightIs(20);
    //名师认证章
    self.AuthenticationImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"名师"]];
    [topView addSubview:self.AuthenticationImage];
    self.AuthenticationImage.sd_layout.topSpaceToView(self.name,10).leftSpaceToView(self.portrait,15*k_scale).widthIs(26*k_scale).heightIs(26*k_scale);
    
    //技能
    self.skill = [UILabel sharedWithFont:11.0 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [topView addSubview:self.skill];
    self.skill.sd_layout.leftSpaceToView(self.AuthenticationImage,5*k_scale).topSpaceToView(self.name,2).rightSpaceToView(topView,10).heightIs(10*k_scaleHeight);
    //小人图标
    UIImageView *smallPerson = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"小人"]];
    [topView addSubview:smallPerson];
    smallPerson.sd_layout.widthIs(15).heightIs(15).leftEqualToView(self.skill).topSpaceToView(self.skill,5);
    //服务次数
    self.serviceTimes =[UILabel sharedWithFont:11.0 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [topView addSubview:self.serviceTimes];
    self.serviceTimes.sd_layout.centerYEqualToView(smallPerson).leftSpaceToView(smallPerson,8);
    //第一条下划线
    UIView*line1 = [UIView lineWithColor:COLOR];
    [topView addSubview:line1];
    line1.sd_layout.heightIs(1).widthIs(kScreenWidth-20).xIs(10).topSpaceToView(self.portrait,-10*k_scaleHeight);
    //工作经验
    self.workExperience = [[UITextView alloc]init];
    self.workExperience.backgroundColor = [UIColor clearColor];
    self.workExperience.font = [UIFont systemFontOfSize:12];
    self.workExperience.textColor = COLOR;
    [topView addSubview:self.workExperience];
    self.workExperience.sd_layout.topSpaceToView(self.portrait,5).widthIs(kScreenWidth-20).xIs(10).heightIs(45*k_scaleHeight);
    self.workExperience.editable = NO;
    
    //下划线2
    UIView *line2 = [UIView lineWithColor:COLOR];
    [topView addSubview:line2];
    line2.sd_layout.topSpaceToView(self.workExperience,10).heightIs(1).widthIs(kScreenWidth-20).xIs(10);
    //他的动态
    self.hisActionButton = [[UIButton alloc]init];
    [self.hisActionButton showsTouchWhenHighlighted];
    [topView addSubview:self.hisActionButton];
    [self.hisActionButton setTitle:@"TA的动态" forState:UIControlStateNormal];
    [self.hisActionButton setTitleColor:[UIColor getColor:@"A0974D"] forState:UIControlStateNormal];
    self.hisActionButton.titleLabel.font = [UIFont systemFontOfSize:15];
    self.hisActionButton.sd_layout.xIs(45*k_scale).topSpaceToView(line2,12*k_scaleHeight).widthIs(65*k_scale).heightIs(15*k_scaleHeight);
    
    //钻石图标
    UIImageView *diamondIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"钻石"]];
    [topView addSubview:diamondIcon];
    diamondIcon.sd_layout.widthIs(26*k_scale).heightIs(20*k_scaleHeight).centerYEqualToView(self.hisActionButton).leftSpaceToView(self.hisActionButton,10);
    //下划线3
    UIView *line3 = [UIView lineWithColor:COLOR];
    [topView addSubview:line3];
    line3.sd_layout.widthIs(1).topEqualToView(diamondIcon).heightIs(25*k_scaleHeight).centerXEqualToView(topView);
    //认证证书
    self.AuthenticationButton = [[UIButton alloc]init];
    [self.AuthenticationButton showsTouchWhenHighlighted];
    [topView addSubview:self.AuthenticationButton];
    self.AuthenticationButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.AuthenticationButton setTitle:@"认证证书" forState:UIControlStateNormal];
    [self.AuthenticationButton setTitleColor:[UIColor getColor:@"A0974D"] forState:UIControlStateNormal];
    self.AuthenticationButton.sd_layout.topSpaceToView(line2,12*k_scaleHeight).widthIs(60*k_scale).heightIs(15*k_scaleHeight).leftSpaceToView(line3,33*k_scale);
    //皇冠图标
    UIImageView *Icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"皇冠"]];
    [topView addSubview:Icon];
    Icon.sd_layout.widthIs(26*k_scale).heightIs(20*k_scaleHeight).centerYEqualToView(self.hisActionButton).leftSpaceToView(self.AuthenticationButton,10);
    //评论和好评率
    self.comments = [UILabel sharedWithFont:16.0 andColor:COLOR andAnligment:left andBackgroundColor:nil];
    [topView addSubview:self.comments];
    self.comments.sd_layout.xIs(10).widthIs(kScreenWidth-20).topSpaceToView(diamondIcon,16*k_scaleHeight).heightIs(25*k_scaleHeight);
    self.comments.textColor = COLOR;
    
    //"更多"按钮
    UIButton *button = [[UIButton alloc]init];
    button.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [button setTitleColor:COLOR forState:UIControlStateNormal];
    [topView addSubview:button];
    button.sd_layout.widthIs(50).heightIs(30).rightSpaceToView(topView,20).topEqualToView(self.comments);
    [button addTarget:self action:@selector(moreBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor clearColor];
    [button showsTouchWhenHighlighted];
    [button setTitle:@"更多 >" forState:UIControlStateNormal];
    
  
    
//    
//    threeCommentsTableview = [[UITableView alloc]init];
//    [topView addSubview:threeCommentsTableview];
//    threeCommentsTableview.delegate =self;
//    threeCommentsTableview.backgroundColor = [UIColor clearColor];
//    threeCommentsTableview.dataSource = self;
//    threeCommentsTableview.separatorColor = [UIColor clearColor];
//    threeCommentsTableview.sd_layout.topSpaceToView(self.comments,2).widthIs(kScreenWidth-20).xIs(10).heightIs(108*k_scaleHeight);
//    threeCommentsTableview.scrollEnabled = NO;
    
    UILabel *hisService = [UILabel sharedWithFont:17 andColor:[UIColor getColor:@"A0974D"] andAnligment:left andBackgroundColor:nil];
    hisService.text = @"TA的服务项目";
    hisService.textColor = [UIColor getColor:@"A0974D"];
    [topView addSubview:hisService];
    hisService.sd_layout.widthIs(kScreenWidth-20).topSpaceToView(button,1*k_scaleHeight).xIs(10).heightIs(20*k_scaleHeight);
    
}

-(void)createTestData{
    self.name.text = @"郭德纲";
    self.workExperience.text = @"纷纷开始大脑开发建设电脑及飞机上都能克服恐惧的是能否看见的是你粉丝都能减肥烦恼的就是那副驾驶都能健康妇女丹江口市你反抗精神的咖啡店是否能接受发生地就可能发生的纪念封能看见的是粉嫩就开始电脑课见风使舵款奶粉发生地看见非农即将开始的房间看电视呢见风使舵净空法师妇女丹江口市菲尼克斯多家开发商决定开发年级开始就看你烦恼苏丹诺夫看见谁都能减肥";
    self.skill.text = @"中医技师  中医推拿师 10年经验";
    self.serviceTimes.text = @"服务3002次";
    self.comments.text = @"TA的评价(360条)  99.6%好评";
}

-(void)focusButtonClicked{
    if ([self.focusButton.titleLabel.text isEqualToString:@"+关注"]) {
        [self.focusButton setTitle:@"已关注" forState:UIControlStateNormal];
    }else{
        [self.focusButton setTitle:@"+关注" forState:UIControlStateNormal];
    }
}
-(void)moreBtnClicked:(UIButton *)button{
    TechCommentVController *VC = [[TechCommentVController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
#pragma mark ＝＝＝＝＝＝＝tableView DataSource＝＝＝＝＝＝＝＝
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (tableView == threeCommentsTableview) {
//        return 36*k_scaleHeight;
//    }
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (tableView == threeCommentsTableview) {
//        return 3;
//    }
    return 5;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (tableView == threeCommentsTableview) {
//        static NSString *ID=@"threeCell";
//        ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//        if(cell==nil){
//            cell=[[ThreeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//            cell.userInteractionEnabled = NO;
//        }
//        return cell;
//    }else{
    static NSString *ID=@"cell";
    myTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[myTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    return cell;
//        }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ServiceViewController *service = [[ServiceViewController alloc]init];
    [self.navigationController pushViewController:service animated:YES];
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
