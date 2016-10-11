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
    NSMutableArray *imageArr;
    UIButton *orderBtn;
}
@property(nonatomic,strong) UIScrollView *scrollview;
@end

@implementation GoodSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HaHaHaAddBackGroundImage
    imageArr =  [[NSMutableArray alloc]initWithCapacity:0];
    self.scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-48*k_scaleHeight)];
    [self.view addSubview:self.scrollview];
    self.scrollview.scrollEnabled = YES;
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.backgroundColor = [UIColor clearColor];
    self.navigationItem.title = @"商品详情";
    
    [self setprojectview];
    [self createBottomOrder];
    [self GetRequestData];
}
-(void)GetRequestData{
    WS(weakSelf)
    [SomeOtherRequest GetShopProductDetailWithProductID:self.productID success:^(id response) {
//        NSLog(@"商品详情的返回结果是:%@",response[@"images"]);
        imageArr = response[@"images"];
        [weakSelf setscrollview];
        weakSelf.name.text = response[@"prodname"];
        weakSelf.shiyi.text = [NSString stringWithFormat:@"\n● 商品说明:\n\n %@",response[@"instruction"]];
        weakSelf.goodsSize.text = [NSString stringWithFormat:@"规格:%@",response[@"prodsize"]];
        CGSize size = [weakSelf.shiyi sizeThatFits:CGSizeMake(weakSelf.shiyi.frame.size.width, 2000)];
        weakSelf.shiyi.frame =CGRectMake(10, 75, kScreenWidth-20, size.height);
        weakSelf.projectView.frame = CGRectMake(0, 200, kScreenWidth,70+size.height);
        weakSelf.price.text = [NSString stringWithFormat:@"%@元",response[@"price"]];
        weakSelf.scrollview.contentSize = CGSizeMake(kScreenWidth,CGRectGetMaxY(self.projectView.frame));
        [weakSelf applyHttpData];
    } error:^(id response) {
        
    }];
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
    [SomeOtherRequest AddProductToCarWithUserId:[YCUserModel userId] andProductID:self.productID success:^(id response) {
        NSLog(@"加入购物车 %@",response);
        [MBProgressHUD showSuccess:@"已加入购物车"];
    } error:^(id response) {
        
    }];
    
}
-(void)setprojectview{
    self.projectView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, 100)];
    [self.scrollview addSubview:self.projectView];
    //名字
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, kScreenWidth, 15)];
    [self.projectView addSubview:self.name];
    //商品规格
    self.goodsSize = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, kScreenWidth-20, 30)];
    self.goodsSize.text = @"";
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
    self.shiyi.text = @"";
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


-(void)applyHttpData{
    
}

-(void)setscrollview{
    /** 设置网络scrollView的Frame及所需图片*/
    WYNetScrollView = [[WYScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) WithNetImages:imageArr];
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
