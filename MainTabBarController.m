//
//  MainTabBarController.m
//  都市摇摇看
//
//  Created by HackCc on 15/12/1.
//  Copyright © 2015年 hackcc. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavViewController.h"

#import "HomeViewController.h"
#import "MallViewController.h"
#import "ToShopViewController.h"
#import "MineViewController.h"
#import "ToMyHomeViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *mainViewController=[[HomeViewController alloc]init];
    [self addViewController:mainViewController withImage:@"home_off" WithSelectImage:@"home" WithTitle:@"首页"];
    
    ToShopViewController *toShopViewController=[[ToShopViewController alloc]init];
    [self addViewController:toShopViewController withImage:@"toShop_off" WithSelectImage:@"toShop" WithTitle:@"到店"];
    
    
    ToMyHomeViewController *visitViewController=[[ToMyHomeViewController alloc]init];
    [self addViewController:visitViewController withImage:@"visit_off" WithSelectImage:@"visit" WithTitle:@"上门"];
    
    MallViewController *mallViewController=[[MallViewController alloc]init];
    [self addViewController:mallViewController withImage:@"mall_off" WithSelectImage:@"mall" WithTitle:@"商城"];
   
    MineViewController *mineViewController=[[MineViewController alloc]init];
    [self addViewController:mineViewController withImage:@"mine_off" WithSelectImage:@"mine" WithTitle:@"我的"];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabBarBackImage"];
    self.tabBar.tintColor =COLOR;
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
- (void)addViewController :(UIViewController *)viewContro withImage:(NSString *)imageName WithSelectImage:(NSString *)selectImage WithTitle:(NSString *)title {
    viewContro.title = title;

    UIImage *TempImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewContro.tabBarItem.image = TempImage;
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[NSForegroundColorAttributeName]=COLOR;
    
    [viewContro.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];

    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    
    dic2[NSForegroundColorAttributeName]=[UIColor whiteColor];
    
    [viewContro.tabBarItem setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    
//     取消系统控制器的渲染效果
    UIImage *selectTempImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewContro.tabBarItem.selectedImage = selectTempImage;

//    viewContro.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(200)/255.0 green:arc4random_uniform(200)/255.0 blue:arc4random_uniform(200)/255.0 alpha:1.0];
//    
//    viewContro.view.backgroundColor=[UIColor whiteColor];
    
    MainNavViewController *nav=[[MainNavViewController alloc]initWithRootViewController:viewContro];

    [self addChildViewController:nav];
    
    
}


@end
