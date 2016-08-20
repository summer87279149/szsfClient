//
//  AppDelegate.m
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
@interface AppDelegate ()
{
    BMKMapManager *_mapManager;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UMSocialData setAppKey:UmengAppkey];
    
    [UMSocialWechatHandler setWXAppId:@"wx981099fb2508da9a" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatSession, UMShareToWechatTimeline]];
    
    _mapManager = [[BMKMapManager alloc]init];
    
    BOOL ret = [_mapManager start:@"zpBFNy0kFlGOZ1UrUTcI1oyNRcFqrGCV" generalDelegate:self];
    if (!ret) {
        NSLog(@"百度地图失败");
    }else{
        NSLog(@"百度地图成功");
    }
    
    //    LoginViewController *loginController=[[LoginViewController alloc]init];
    MainTabBarController *loginController=[[MainTabBarController alloc]init];
    self.window.rootViewController=loginController;
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
        
    }
    return result;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   }

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
