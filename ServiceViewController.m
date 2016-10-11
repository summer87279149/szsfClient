//
//  ServiceViewController.m
//  FootMassage
//
//  Created by Admin on 16/8/6.
//  Copyright © 2016年 Admin. All rights reserved.
//
#import "SDCycleScrollView.h"
#import "ServiceViewController.h"
#import "Masonry.h"
#import "TechViewController.h"
#import "OrderViewController.h"
#import "TechCommentVController.h"
#import "ProjectModal.h"
@interface ServiceViewController ()<UIScrollViewDelegate>
{
    SDCycleScrollView *topScrollView;
//    WYScrollView *WYNetScrollView;
    //轮播图
    NSMutableArray *arr;
    UIButton *orderBtn;
}
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property(nonatomic,strong) UIScrollView *scrollview;

@property(nonatomic,strong) ProjectModal *projectModel;
@end

@implementation ServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arr = [[NSMutableArray alloc]init];;
    self.scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-48*k_scaleHeight)];
    [self.view addSubview:self.scrollview];
    self.scrollview.scrollEnabled = YES;
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.backgroundColor = [UIColor clearColor];
    
    
    self.navigationItem.title = @"项目";
//    self.navigationController.navigationItem.title  =@"项目";
    [self getRequestData];
    
    [self setprojectview];
    [self setcommentsView];
    [self settechnameView];
    
    
    [self createBottomOrder];
}
#pragma mark - 网络请求
-(void)getRequestData{
    NSLog(@"项目页面请求的参数pid=:%@",self.projectID);
    [XTRequestManager GET:kXTCommonAPIConstantProject parameters:@{@"id":self.projectID} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
       NSLog(@"项目页面请求的response = %@",responseObject);
       arr = responseObject[@"projbanner"];
        
        _projectModel = [[ProjectModal alloc]initFromDictionary:responseObject[@"project"]];
        [self setscrollview];
        [self applyData];
        [self setserviceintroduceView];
   } failure:^(NSError *error) {
       
   }];
}


-(void)setprojectview{
    self.projectView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, 100)];
    [self.scrollview addSubview:self.projectView];
    //名字
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, kScreenWidth, 15)];
    [self.projectView addSubview:self.name];
    //作用
    self.shiyi = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, kScreenWidth*2/3, 30)];
    self.shiyi.lineBreakMode = NSLineBreakByCharWrapping;
    self.shiyi.numberOfLines = 0;
    self.shiyi.textColor = [UIColor darkGrayColor];
    self.shiyi.font = [UIFont systemFontOfSize:12];
    [self.projectView addSubview:self.shiyi];
    //时钟图标
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"时钟"]];
    image.frame = CGRectMake(10, 75, 15, 15);
    [self.projectView addSubview:image];
    //时长 选择人数
    self.time = [[UILabel alloc]initWithFrame:CGRectMake(30, 75, kScreenWidth*2/3, 15)];
    self.time.font = [UIFont systemFontOfSize:11];
    self.time.textColor = [UIColor darkGrayColor];
    [self.projectView addSubview:self.time];
    //价格
    self.price = [[UILabel alloc]init];
    self.price.textAlignment = NSTextAlignmentRight;
    [self.projectView addSubview:self.price];
    self.price.textColor = [UIColor getColor:@"A0974D"];
    self.price.sd_layout.rightSpaceToView(self.projectView,20).heightIs(30).bottomEqualToView(self.time);
    //分割线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(10, 98, kScreenWidth-20, 1)];
    line.backgroundColor = COLOR;
    [self.projectView addSubview:line];
    
    
}

-(void)setscrollview{
    
    
    topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imageNamesGroup:arr];
    /** 设置占位图*/
    topScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
    /** 添加到当前View上*/
    [self.scrollview addSubview:topScrollView];
    
    
    
}

-(void)setcommentsView{
    self.commentView = [[UIView alloc]initWithFrame:CGRectMake(0, 300, kScreenWidth, 50)];
    [self.scrollview addSubview:self.commentView];
    //评论和好评率
    self.comments = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth, 30)];
    self.comments.textColor = COLOR;
    [self.commentView addSubview:self.comments];
    //"更多"按钮
    UIButton *button = [[UIButton alloc]init];
    button.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [button setTitleColor:COLOR forState:UIControlStateNormal];
    [self.commentView addSubview:button];
    button.sd_layout.widthIs(50).heightIs(30).rightSpaceToView(self.commentView,20).yIs(10);
    [button addTarget:self action:@selector(moreBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"更多 >" forState:UIControlStateNormal];
    
}

-(void)moreBtnClicked:(UIButton *)button{
    
    
    TechCommentVController *techComment = [[TechCommentVController alloc]init];
    techComment.para = @{@"tid":_projectModel.technicianID};
    [self.navigationController pushViewController:techComment animated:YES];
    
}



-(void)techViewClicked{
    
    TechViewController *techVC = [[TechViewController alloc]init];
    NSLog(@"技师ID是%@",_projectModel.technicianID);
    techVC.techID = _projectModel.technicianID;
    [self.navigationController pushViewController:techVC animated:YES];
}
-(void)settechnameView{
    self.techView = [[UIView alloc]initWithFrame:CGRectMake(0, 350, kScreenWidth, 100)];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(techViewClicked)];
    [self.techView addGestureRecognizer:tapGesture];
    [self.scrollview addSubview:self.techView];
    
    self.portrait = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
    self.portrait.layer.cornerRadius = 40;
    self.portrait.layer.masksToBounds = YES;
    self.portrait.backgroundColor = COLOR;
    [self.techView addSubview:self.portrait];
    //姓名
    self.techName = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 200, 15)];
    self.techName.textColor = COLOR;
    [self.techView addSubview:self.techName];
    //章 图标
    self.AuthenticationImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"名师"]];
    self.AuthenticationImage.frame = CGRectMake(100, 45, 40, 40);
    [self.techView addSubview:self.AuthenticationImage];
    self.AuthenticationImage.hidden=YES;
    //技能、工作年限
    self.skill = [[UILabel alloc]init];
    self.skill.textColor =COLOR;
    self.skill.font = [UIFont systemFontOfSize:11];
    [self.techView addSubview:self.skill];
    self.skill.sd_layout.leftSpaceToView(self.AuthenticationImage,10).rightSpaceToView(self.techView,10).topEqualToView(self.AuthenticationImage).heightIs(15);
    //小人图标
    UIImageView *smallPersonIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"小人"]];
    [self.techView addSubview:smallPersonIcon];
    smallPersonIcon.sd_layout.topSpaceToView(self.skill,10).leftSpaceToView(self.AuthenticationImage,10).heightIs(15).widthIs(15);
    //服务次数
    self.serviceTimes = [[UILabel alloc]init];
    [self.techView addSubview:self.serviceTimes];
    self.serviceTimes.sd_layout.leftSpaceToView(smallPersonIcon,3).topEqualToView(smallPersonIcon).heightIs(15).rightSpaceToView(self.techView,10);
    self.serviceTimes.textColor = [UIColor darkGrayColor];
    self.serviceTimes.font = [UIFont systemFontOfSize:11];
    
    UIButton *button = [[UIButton alloc]init];
    [self.techView addSubview:button];
    [button addTarget:self action:@selector(techViewClicked) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"  >  " forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:COLOR forState:UIControlStateNormal];
    button.sd_layout.rightSpaceToView(self.techView,0).centerYEqualToView(self.techView).heightIs(20).widthIs(30);
}

-(void)setserviceintroduceView{
    UILabel *serviceIntroduce = [[UILabel alloc]init];
    serviceIntroduce.text = @"服务介绍";
    serviceIntroduce.textColor = [UIColor getColor:@"A0974D"];
    [self.scrollview addSubview:serviceIntroduce];
    serviceIntroduce.frame = CGRectMake(10, 450, kScreenWidth, 20)
    ;
    //服务说明
    self.serviceInfo = [[UILabel alloc]initWithFrame:CGRectMake(10, 470, kScreenWidth, 200)];
    self.serviceInfo.textColor =COLOR;
    self.serviceInfo.font = [UIFont systemFontOfSize:12];
    [self.scrollview addSubview:self.serviceInfo];
    self.serviceInfo.numberOfLines = 0;
    self.serviceInfo.lineBreakMode = NSLineBreakByCharWrapping;
//    self.serviceInfo.text = @"● 服务说明:\n \n  本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你一店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你同创造！";
    self.serviceInfo.text = _projectModel.serviceInfo;
    CGSize size = [self.serviceInfo sizeThatFits:CGSizeMake(self.serviceInfo.frame.size.width, 2000)];
    self.serviceInfo.frame =CGRectMake(10, 470, kScreenWidth-10, size.height);
//     NSLog(@"label自适应  %f",size.height);
    
    
    //预约须知
    self.orderNeedKnow = [[UILabel alloc]initWithFrame:CGRectMake(10, 670, kScreenWidth, 200)];
    self.orderNeedKnow.textColor =COLOR;
    self.orderNeedKnow.font = [UIFont systemFontOfSize:12];
    [self.scrollview addSubview:self.orderNeedKnow];
    self.orderNeedKnow.numberOfLines = 0;
    self.orderNeedKnow.lineBreakMode = NSLineBreakByCharWrapping;
//    self.orderNeedKnow.text = @"● 预约需知:\n \n  本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与一同创造！";
    self.orderNeedKnow.text = _projectModel.serviceKnow;
    CGSize size2 = [self.orderNeedKnow sizeThatFits:CGSizeMake(self.orderNeedKnow.frame.size.width, 2000)];
//    self.orderNeedKnow.backgroundColor = [UIColor blueColor];
    self.orderNeedKnow.frame =CGRectMake(10, 470+self.serviceInfo.size.height+10, kScreenWidth-10, size2.height);
//    NSLog(@"label自适应2  %f",size2.height);
    
    
    //针对部位
    self.aimAt = [[UILabel alloc]initWithFrame:CGRectMake(10, 870, kScreenWidth-10, 200)];
    self.aimAt.textColor =COLOR;
    self.aimAt.font = [UIFont systemFontOfSize:12];
    [self.scrollview addSubview:self.aimAt];
    self.aimAt.numberOfLines = 0;
    self.aimAt.lineBreakMode = NSLineBreakByCharWrapping;
//    self.aimAt.text = @"● 针对部位:\n \n  本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你一同店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你一同创造！";
    self.aimAt.text = _projectModel.aimAt;
    CGSize size3 = [self.aimAt sizeThatFits:CGSizeMake(self.aimAt.frame.size.width, 2000)];
//    self.aimAt.backgroundColor = [UIColor blueColor];
    self.aimAt.frame =CGRectMake(10, 470+self.serviceInfo.size.height+10+self.orderNeedKnow.size.height+10, kScreenWidth-10, size3.height);
//    NSLog(@"label自适应3  %f",size3.height);
    
    //设置scrollview的滚动范围
    self.scrollview.contentSize = CGSizeMake(kScreenWidth,470+self.serviceInfo.size.height+10+self.orderNeedKnow.size.height+10+size3.height+64);
}

//-(void)settestdata{
//    self.name.text = @"小儿三伏推";
//    self.shiyi.text = @"跌打损伤 大脑偏瘫、精神不振";
//    self.time.text = @"60分钟  199人选择";
//    self.price.text= @"998.00元";
//    self.comments.text = @"TA的评价(360条)  99.6%好评";
//    self.techName.text = @"郭德纲";
//    self.skill.text = @"中医技师 中医推拿师 10年经验";
//    self.serviceTimes.text = @"3002次";
//    
//}
-(void)applyData{
    self.name.text = _projectModel.projectName;
    self.shiyi.text = _projectModel.effect;
    self.time.text = [NSString stringWithFormat:@"%@分钟  %@人选择",_projectModel.time,_projectModel.chooseNumber];
    self.price.text = [NSString stringWithFormat:@"%@元",_projectModel.price];
    self.comments.text = [NSString stringWithFormat:@"评价(%@条)   %@好评",_projectModel.commentsNumber,_projectModel.goodComments];
    [self.portrait sd_setImageWithURL:[NSURL URLWithString:_projectModel.headimgurl]];
    self.techName.text = _projectModel.name;
    if ([_projectModel.AuthenticationImage isEqualToString:@"0"]) {
        self.AuthenticationImage.hidden=YES;
    }else{
        self.AuthenticationImage.hidden=NO;
    }
    self.skill.text = [NSString stringWithFormat:@"%@ %@年经验",_projectModel.skill,_projectModel.techWorkYears];
    self.serviceTimes.text = [NSString stringWithFormat:@"服务过%@次",_projectModel.serviceTimes];
    
}

-(void)createBottomOrder{
    orderBtn = [[UIButton alloc]init];
    [orderBtn addTarget:self action:@selector(orderBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [orderBtn setBackgroundImage:[UIImage imageNamed:@"BottomOrder"] forState:UIControlStateNormal];
    [orderBtn setTitle:@"预约" forState:UIControlStateNormal];
    orderBtn.frame = CGRectMake(0, kScreenHeight-48*k_scaleHeight-64, kScreenWidth, 48*k_scaleHeight);
    [self.view addSubview:orderBtn];
}
-(void)orderBtnClicked{
    OrderViewController *yuyue = [[OrderViewController alloc]init];
    yuyue.projectModal = [[ProjectModal alloc]init];
    yuyue.projectModal = _projectModel;
    [self.navigationController pushViewController:yuyue animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
