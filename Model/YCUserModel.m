//
//  YCUserModel.m
//  YCWM
//
//  Created by 李帅 on 15/2/2.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import "YCUserModel.h"
#import <CoreFoundation/CoreFoundation.h>

@implementation YCUserModel

- (void)save{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if (self.token) {
        [ud setObject:self.token forKey:USER_TOKEN];
    }
    
    if (self.userName) {
        [ud setObject:self.userName forKey:USER_NAME];
    }
    
    if (self.password) {
        [ud setObject:self.password forKey:USER_PASSWORD];
    }
    
    if (self.userStates) {
        [ud setObject:self.userStates forKey:USER_STATUS];
    }
    
    if (self.userId) {
        [ud setObject:self.userId forKey:USER_ID];
    }
    if (self.phoneNumber) {
        [ud setObject:self.phoneNumber forKey:USER_PHONE];
    }
    
    if (self.latitude) {
        [ud setObject:self.latitude forKey:USER_LA];
    }
    if (self.longitude) {
        [ud setObject:self.longitude forKey:USER_LO];
    }
    
    if (self.position) {
        [ud setObject:self.position forKey:USER_Position];
    }
    
    if (self.city) {
        [ud setObject:self.city forKey:USER_City];
    }
    
    [ud synchronize];
}

+ (NSString *)userToken{
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:USER_TOKEN];
    
    if ([self didLogin]) {
        token = [token stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }else{
        token = nil;
    }
    
    return token;
}

+ (NSString *)userStatus{
    NSString *userStatus = [[NSUserDefaults standardUserDefaults] objectForKey:USER_STATUS];
    
    return userStatus;
}

+ (NSString *)username{
    
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    
    return username;
}

+ (NSString *)password{
    
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PASSWORD];
    
    return password;
}

+ (NSString *)userId{
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:USER_ID];
    
    return userId;
}

+ (NSString *)latitude
{
    NSString *latitude = [[NSUserDefaults standardUserDefaults] objectForKey:USER_LA];
    
    return latitude;
}

+ (NSString *)longitude
{
    NSString *longitude = [[NSUserDefaults standardUserDefaults] objectForKey:USER_LO];
    
    return longitude;
}

+ (NSString *)position{
    
    NSString *position = [[NSUserDefaults standardUserDefaults] objectForKey:USER_Position];
    
    return position;
}

+ (NSString *)city
{
    NSString *city = [[NSUserDefaults standardUserDefaults] objectForKey:USER_City];
    return city;
}

+ (BOOL)didLogin{
    
    BOOL login = NO;
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if ([ud objectForKey:USER_PHONE] && [ud objectForKey:USER_PASSWORD]) {
        login = YES;
    }
    
    return login;
}

+ (void)logOut{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:nil forKey:USER_NAME];
    [ud setObject:nil forKey:USER_PASSWORD];
    [ud setObject:nil forKey:USER_TOKEN];
    [ud setObject:nil forKey:USER_STATUS];
    [ud setObject:nil forKey:USER_ID];
    [ud setObject:nil forKey:USER_PHONE];
    [ud setObject:nil forKey:USER_LA];
    [ud setObject:nil forKey:USER_LO];
    [ud setObject:nil forKey:USER_Position];
    [ud synchronize];
}

+ (void)alertWithTitle:(NSString *)title{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

@end
