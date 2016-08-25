//
//  GoodSViewController.m
//  foot
//
//  Created by Admin on 16/8/22.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "GoodSViewController.h"
#import "WYScrollView.h"
@interface GoodSViewController ()<UIScrollViewDelegate,WYScrollViewNetDelegate>
{
    WYScrollView *WYNetScrollView;
    NSMutableArray *NetImageArray;
    NSArray *arr;
    UIButton *orderBtn;
}
@property(nonatomic,strong) UIScrollView *scrollview;
@end

@implementation GoodSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
    
    // =====测试数据======
    arr = @[
            @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
            @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
            @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
            ];
    
    //===========
    self.scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-48*k_scaleHeight)];
    [self.view addSubview:self.scrollview];
    self.scrollview.scrollEnabled = YES;
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.backgroundColor = [UIColor clearColor];


    self.navigationItem.title = @"商品详情";

    [self setscrollview];
    [self setprojectview];
    [self createBottomOrder];
    [self settestdata];

}
-(void)createBottomOrder{
    orderBtn = [[UIButton alloc]init];
    [orderBtn addTarget:self action:@selector(orderBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [orderBtn setBackgroundImage:[UIImage imageNamed:@"BottomOrder"] forState:UIControlStateNormal];
    [orderBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    orderBtn.frame = CGRectMake(0, kScreenHeight-48*k_scaleHeight-64, kScreenWidth, 48*k_scaleHeight);
    [self.view addSubview:orderBtn];
}
-(void)orderBtnClicked{
    [MBProgressHUD showSuccess:@"已加入购物车"];
}
-(void)setprojectview{
    self.projectView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, 100)];
    [self.scrollview addSubview:self.projectView];
    //名字
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, kScreenWidth, 15)];
    [self.projectView addSubview:self.name];
    //商品规格
    self.goodsSize = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, kScreenWidth-20, 30)];
    self.goodsSize.text = @"规格：20g*20袋";
    self.goodsSize.font = [UIFont systemFontOfSize:12];
    self.goodsSize.textColor = COLOR;
    [self.projectView addSubview:self.goodsSize];
    //作用
    self.shiyi = [[UILabel alloc]initWithFrame:CGRectMake(10, 75, kScreenWidth-20, 30)];
    self.shiyi.textColor = COLOR;
    self.shiyi.font = [UIFont systemFontOfSize:12];
    [self.projectView addSubview:self.shiyi];
    self.shiyi.numberOfLines = 0;
    self.shiyi.lineBreakMode = NSLineBreakByCharWrapping;
    self.shiyi.text = @"● 商品说明:\n \n  本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你一店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你同创造！";
    CGSize size = [self.shiyi sizeThatFits:CGSizeMake(self.shiyi.frame.size.width, 2000)];
    self.shiyi.frame =CGRectMake(10, 75, kScreenWidth-20, size.height);
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
    self.price.sd_layout.rightSpaceToView(self.projectView,20).heightIs(30).centerYEqualToView(self.name);
    
    
}
-(void)settestdata{
    self.name.text = @"多乐士袋装茶";
    self.goodsSize.text = @"规格：20g*25袋";
    self.shiyi.text = @"\n● 商品说明:\n\n  我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶，我是茶叶。";
    CGSize size = [self.shiyi sizeThatFits:CGSizeMake(self.shiyi.frame.size.width, 2000)];
    self.shiyi.frame =CGRectMake(10, 75, kScreenWidth-20, size.height);
    self.projectView.frame = CGRectMake(0, 200, kScreenWidth,70+size.height);
//    self.time.text = @"199人选择";
    self.price.text= @"998.00元";
//    self.comments.text = @"TA的评价(360条)  99.6%好评";
    self.scrollview.contentSize = CGSizeMake(kScreenWidth,CGRectGetMaxY(self.projectView.frame));
}



-(void)setscrollview{
    /** 设置网络scrollView的Frame及所需图片*/
    WYNetScrollView = [[WYScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) WithNetImages:arr];
    /** 设置滚动延时*/
    WYNetScrollView.AutoScrollDelay = 3;
    /** 设置占位图*/
    WYNetScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];;
    /** 获取网络图片的index*/
    WYNetScrollView.netDelagate = self;
    /** 添加到当前View上*/
    [self.scrollview addSubview:WYNetScrollView];
    
}
/** 点中网络滚动视图后触发*/
-(void)didSelectedNetImageAtIndex:(NSInteger)index{
    NSLog(@"点击了第%ld图",(long)index);
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
