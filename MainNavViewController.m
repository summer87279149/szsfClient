//
//  MainNavViewController.m
//  都市摇摇看
//
//  Created by HackCc on 15/12/1.
//  Copyright © 2015年 hackcc. All rights reserved.
//

#import "MainNavViewController.h"


@interface MainNavViewController ()<UISearchBarDelegate>

@end

@implementation MainNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationBar.barTintColor=[UIColor clearColor];
    UIColor *color = [UIColor whiteColor];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;

    self.navigationBar.tintColor=[UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"navigationBackgroundImage"];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//     self.edgesForExtendedLayout = UIRectEdgeNone;
 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIBarButtonItem *)addBarItemWithImage:(NSString *)imageName WithHighImage:(NSString *)hightImage WithTagetAction:(SEL)action WithTarger:(id)target{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    
    CGRect btnRect = CGRectZero;
    
    btnRect.size = button.currentImage.size;
    
    button.frame = btnRect;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 将控制器中的返回按钮进行统一设置
//        viewController.navigationItem.leftBarButtonItem = [self addBarItemWithImage:@"backW" WithHighImage:@"backW" WithTagetAction:@selector(backClick) WithTarger:self];
        
//        viewController.navigationItem.rightBarButtonItem = [self addBarItemWithImage:@"tabbar_home" WithHighImage:@"tabbar_home_selected" WithTagetAction:@selector(homeBtnClick) WithTarger:self];
    }
    [super pushViewController:viewController animated:YES];
}

#pragma mark navigationItem按钮点击事件
- (void)backClick {
    [self popViewControllerAnimated:YES];
}

- (void)homeBtnClick {
    [self popToRootViewControllerAnimated:YES];
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
