//
//  SlideViewController.m
//  foot
//
//  Created by Admin on 16/10/12.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "SlideViewController.h"
#import "UnCompletePayViewController.h"
#import "CompletePayViewController.h"
@interface SlideViewController ()<WMPageControllerDelegate,WMPageControllerDataSource>

@end

@implementation SlideViewController

- (void)viewDidLoad {
    
        self.title = @"我的订单";
    
        self.menuHeight = 30; //导航栏高度
        self.menuItemWidth = 100; //每个 MenuItem 的宽度
        self.menuBGColor = RGBA(129, 113, 90, 0.62);
        self.menuViewStyle = WMMenuViewStyleLine;//这里设置菜单view的样式
        self.progressHeight = 2;//下划线的高度，需要WMMenuViewStyleLine样式
        self.progressColor = COLOR;//设置下划线(或者边框)颜色
        self.titleSizeSelected = 17;//设置选中文字大小
        self.titleColorSelected = COLOR;//设置选中文字颜色
        self.titleColorNormal = [UIColor whiteColor];
        self.titleSizeNormal = 16;
        self.selectIndex = 0;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//设置viewcontroller的个数
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 2;
}
//设置对应的viewcontroller
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index == 0) {
        return [[CompletePayViewController alloc]init];
    }else {
        return [[UnCompletePayViewController alloc]init];
    }
    
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    if (index == 0) {
        return @"已完成";
    }
    return @"未完成";
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
