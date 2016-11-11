//
//  AppDelegate.m
//  foot
//
//  Created by Admin on 16/8/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import "AFNetworkActivityIndicatorManager.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApiManager.h"
#import "WXApi.h"
#import "MainNavViewController.h"
#import "UserLoginController.h"
#import "JPUSHService.h"
#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#define JPUSHAPPKEY             @"96d2871305222d19f2e25886"
@interface AppDelegate ()<JPUSHRegisterDelegate,UITabBarControllerDelegate>
{
//    BMKMapManager *_mapManager;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //友盟
    [UMSocialData setAppKey:UmengAppkey];
    
    [UMSocialWechatHandler setWXAppId:@"wx981099fb2508da9a" appSecret:@"d599611fc41bd1bfd27bfd070a1cc8fd" url:@"http://www.yzldwl.com/"];
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatSession, UMShareToWechatTimeline]];
    //百度地图
//    _mapManager = [[BMKMapManager alloc]init];
//    
//    [_mapManager start:@"zpBFNy0kFlGOZ1UrUTcI1oyNRcFqrGCV" generalDelegate:self];
 
    if (![[NSUserDefaults standardUserDefaults]objectForKey:CITYCODE]||![[NSUserDefaults standardUserDefaults]objectForKey:CITYNAME]) {
        [[NSUserDefaults standardUserDefaults]setObject:@"700100000" forKey:CITYCODE];
        [[NSUserDefaults standardUserDefaults]setObject:@"上海市" forKey:CITYNAME];
    }
    //

    MainTabBarController *tabBarVC=[[MainTabBarController alloc]init];
    tabBarVC.delegate=self;

    self.window.rootViewController=tabBarVC;
    [self.window makeKeyAndVisible];
    
    //极光推送
    //注册推送
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        //可以添加自定义categories
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
#endif
    } else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    } else {
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    
    // Required
    [JPUSHService setupWithOption:launchOptions appKey:JPUSHAPPKEY
                          channel:nil
                 apsForProduction:YES
            advertisingIdentifier:nil];
    
    
    //NSLog(@"APService registrationID = %@", [JPUSHService registrationID]);
    [JPUSHService setBadge:0];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    //2.1.9版本新增获取registration id block接口。
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
            NSLog(@"registrationID获取成功：%@",registrationID);
        }
        else{
            NSLog(@"registrationID获取失败，code：%d",resCode);
        }
    }];

   //　先调用友盟，然后才能调用微信注册信息
    [WXApi registerApp:@"wx981099fb2508da9a" withDescription:@"神州师傅"];

    return YES;
}
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    if ([viewController.title isEqualToString:@"我的"]) {
        if ([YCUserModel userId]) {
            return YES;
        }else{
            UserLoginController *a = [[UserLoginController alloc]init];
            MainNavViewController *naVC = [[MainNavViewController alloc]initWithRootViewController:a];
            [self.window.rootViewController presentViewController:naVC animated:YES completion:nil];
            return NO;
        }
    }
    
    return YES;
}
    
    
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == NO) {
        
        if ([url.host isEqualToString:@"pay"]) {
            return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
        }
        
        if ([url.host isEqualToString:@"safepay"]) {
            [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
                NSLog(@"result = %@",resultDic);
                NSLog(@"---%@",[resultDic objectForKey:@"memo"]);
                if ([[resultDic objectForKey:@"resultStatus"]isEqualToString:@"9000"]) {
                    //支付成功操作
                }
                else
                {
                    //支付失败操作
                }
                
            }];
        }

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
    //    [UMSocialSnsService  applicationDidBecomeActive];
    //进入前台将消息角标变为0
    [JPUSHService setBadge:0];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}
- (void)applicationWillTerminate:(UIApplication *)application {
}




#pragma mark 极光推送相关

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#pragma mark- JPUSHRegisterDelegate
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        //你的逻辑
        if ([UIApplication sharedApplication].applicationIconBadgeNumber != 0) {
            //最后把Iconbadge归0
            [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
        }
        NSLog(@"iOS10 will收到远程通知:%@",userInfo);
    }
    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert);
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        //你的逻辑
        if ([UIApplication sharedApplication].applicationIconBadgeNumber != 0) {
            //最后把Iconbadge归0
            [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
        }
        NSLog(@"iOS10 did收到远程通知:%@",userInfo);
    }
    completionHandler(); // 系统要求执行这个方法
}
#endif


#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:
(UIUserNotificationSettings *)notificationSettings {
}


- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification
  completionHandler:(void (^)())completionHandler {
}


- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forRemoteNotification:(NSDictionary *)userInfo
  completionHandler:(void (^)())completionHandler {
}
#endif

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"收到通知11111:%@", [self logDic:userInfo]);
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"收到通知2222:%@", [self logDic:userInfo]);
    [JPUSHService setBadge:0];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
    [JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
}

// log NSSet with UTF8
// if not ,log will be \Uxxx
- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}









@end
