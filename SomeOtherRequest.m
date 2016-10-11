//
//  SomeOtherRequest.m
//  foot
//
//  Created by Admin on 16/9/29.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "SomeOtherRequest.h"

@implementation SomeOtherRequest{
    UIViewController *currentVC;
}
+(void)UserFocusTecWithTecID:(NSString *)TecID UserID:(NSString *)user success:(void (^)(id response))xt_success error:(Error)xt_error{
    
    NSDictionary *prama = @{@"userid":user,@"tid":TecID};
    [XTRequestManager GET:kUserAddFocusTec parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {

        xt_success(responseObject);
    } failure:^(NSError *error) {
        

        xt_error(error);
    }];
}
+(void)UserCancelFocusWithTecID:(NSString *)TecID UserID:(NSString *)user success:(void (^)(id response))xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"userid":user,@"tid":TecID};
    [XTRequestManager GET:kUserCancelFocusTec parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        
        xt_success(responseObject);
    } failure:^(NSError *error) {
        
        
        xt_error(error);
    }];

}

+(void)GetMyFocusTecWithUserID:(NSString *)user success:(void (^)(id response))xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"userid":user};
    [XTRequestManager GET:kUserFocusTec parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        
        xt_success(responseObject);
    } failure:^(NSError *error) {
        
        
        xt_error(error);
    }];
}

+(void)UserSuggestion:(NSString*)suggestion UserID:(NSString *)user success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"content":suggestion,@"userid":user};
    [XTRequestManager GET:kUserSuggestion parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
         xt_error(error);
    }];
}

+(void)QueryOrderFormWithUserID:(NSString *)userID FormType:(NSInteger)typeNumber success:(Success)xt_success error:(Error)xt_error{
    NSNumber *number = [NSNumber numberWithInteger:typeNumber];
    NSDictionary *dic = @{@"userid":userID,@"type":number};
    [XTRequestManager GET:kXTCommonAPIConstantQueryOrderForm parameters:dic responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)GetMineInfoWithUserID:(NSString *)userID success:(Success)xt_success error:(Error)xt_error{
      NSDictionary *prama = @{@"userid":userID};
    [XTRequestManager GET:kMinePage parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)GetShopProductDetailWithProductID:(NSString *)productID success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"gid":productID};
    [XTRequestManager GET:kXTCommonAPIConstantShopProductDetail parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}

+(void)GetProductCarWithUserID:(NSString *)userID success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"userid":userID};
    [XTRequestManager GET:kXTCommonAPIConstantPruductCar parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
         xt_error(error);
    }];
}

+(void)AddProductToCarWithUserId:(NSString *)userID andProductID:(NSString *)productID success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"userid":userID,@"gid":productID};
     [XTRequestManager GET:kXTCommonAPIConstantAddPruductToCar parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
         xt_success(responseObject);
     } failure:^(NSError *error) {
          xt_error(error);
     }];
}
+(void)CompleteAndUnCompleteOrderWith:(NSString *)userID andOrderType:(NSInteger)type andOrderState:(NSInteger)state success:(Success)xt_success error:(Error)xt_error{
    NSNumber *typeNumber = [NSNumber numberWithInteger:type];
    NSNumber *stateNumber = [NSNumber numberWithInteger:state];
    NSDictionary *prama = @{@"userid":userID,@"type":typeNumber,@"state":stateNumber};
    [XTRequestManager GET:kXTCommonAPIConstantCompleteOrUnCompleteOrderForm parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
    
}
+(void)ShowTechWithTecID:(NSString *)TechID AndUserID:(NSString*)userID success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"tid":TechID,@"userid":userID};
    NSLog(@"%@",prama);
    [XTRequestManager GET:kXTCommonAPIConstantTech parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
//        NSLog(@"dayin kankan  %@",responseObject);
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
    
}
+(void)GetShopDetailWithShopID:(NSString *)ShopID success:(Success)xt_success error:(Error)xt_error{
   __block NSNumber *lat;
  __block  NSNumber *lon;
    [[CCLocationManager shareLocation]  getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        lat = [NSNumber numberWithDouble:locationCorrrdinate.latitude];
        lon = [NSNumber numberWithDouble:locationCorrrdinate.longitude];
        
    }];
    
    if (ShopID ==nil ||ShopID == NULL ||[ShopID isEqualToString:@""]) {
        return;
    }
    NSDictionary *prama = @{@"lng":lon,@"lat":lat,@"sid":ShopID};
    [XTRequestManager GET:kXTCommonAPIConstantShopDetail parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)deleteItemWithItemID:(NSString *)ShopID AndUserID:(NSString*)userID success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"gid":ShopID,@"userid":userID,@"opt":@"del"};
    
    [XTRequestManager GET:kXTCommonAPIConstantUpdata parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
         xt_error(error);
    }];
}
+(void)addItemWithItemID:(NSString *)ShopID AndUserID:(NSString*)userID success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"gid":ShopID,@"userid":userID,@"opt":@"inc"};
    [XTRequestManager GET:kXTCommonAPIConstantUpdata parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)decreaseItemWithItemID:(NSString *)ShopID AndUserID:(NSString*)userID success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *prama = @{@"gid":ShopID,@"userid":userID,@"opt":@"dec"};
    [XTRequestManager GET:kXTCommonAPIConstantUpdata parameters:prama responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}

+(void)checkoutWithPara:(id)para success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager POST:kXTCommonAPIConstantPayPruductCar parameters:para responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)submitOrderWithPara:(id)para success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager POST:kXTCommonAPIConstantSubmitOrder parameters:para responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)saveImage:(UIImage*)image userid:(NSString*)userid success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *paraDic = @{@"userid":userid};
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg",str];
    [XTRequestManager POST:kUseruploadPicture parameters:paraDic responseSeializerType:NHResponseSeializerTypeDefault constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *data = UIImageJPEGRepresentation(image, 0.1);
        [formData appendPartWithFileData:data name:@"headimg" fileName:fileName mimeType:@"image/jpeg"];
    } success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)modifyNickNameWithUserID:(NSString*)userid andName:(NSString *)nameStr success:(Success)xt_success error:(Error)xt_error{
     NSString *encodeStr = [nameStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *para = @{@"userid":userid,@"nickname":encodeStr};
    NSLog(@"canshu shi %@",para);
    [XTRequestManager GET:kUserModifyNickName parameters:para responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)feedBackWithUserID:(NSString*)userid andSuggestion:(NSString *)suggestion success:(Success)xt_success error:(Error)xt_error{
     NSString *encodeStr = [suggestion stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *para = @{@"userid":userid,@"content":encodeStr};
    NSLog(@"yi jian fan kui canshu shi %@",para);
    [XTRequestManager POST:kUserSuggestion parameters:para responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)GetCommentWith:(id)para success:(Success)xt_success error:(Error)xt_error{
     [XTRequestManager GET:XTCommonAPIConstantComment parameters:para responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
         xt_success(responseObject);
     } failure:^(NSError *error) {
         xt_error(error);
     }];
}
#pragma mark 获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC{
    // 定义一个变量存放当前屏幕显示的viewcontroller
    UIViewController *result = nil;
    // 得到当前应用程序的主要窗口
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    // windowLevel是在 Z轴 方向上的窗口位置，默认值为UIWindowLevelNormal
    if (window.windowLevel != UIWindowLevelNormal)    {
        // 获取应用程序所有的窗口
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {            // 找到程序的默认窗口（正在显示的窗口）
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {                // 将关键窗口赋值为默认窗口
                window = tmpWin;
                break;
            }
        }
    }
    // 获取窗口的当前显示视图
    UIView *frontView = [[window subviews] objectAtIndex:0];
    // 获取视图的下一个响应者，UIView视图调用这个方法的返回值为UIViewController或它的父视图
    id nextResponder = [frontView nextResponder];
    // 判断显示视图的下一个响应者是否为一个UIViewController的类对象
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
}

-(void)showHUD{
    currentVC = [self getCurrentVC];
    [MBProgressHUD showHUDAddedTo:currentVC.view  animated:YES];
}

-(void)hideHUD{
   
    [MBProgressHUD showHUDAddedTo:currentVC.view  animated:YES];
}




@end
