//
//  WXHander.m
//  微信支付
//
//  Created by Admin on 16/10/11.
//  Copyright © 2016年 Admin. All rights reserved.
//
/*
 
 
 PayReq* req             = [[PayReq alloc] init];
 req.partnerId           = [response objectForKey:@"mch_id"];
 req.prepayId            = [response objectForKey:@"prepayid"];
 req.nonceStr            = [response objectForKey:@"noncestr"];
 req.timeStamp           = [[response objectForKey:@"timestamp"] intValue];
 req.package             = [response objectForKey:@"package"];
 req.sign                = [response objectForKey:@"sign"];
 [WXApi sendReq:req];
 
 
 
 */
#import "MainTabBarController.h"
#import "WXHander.h"
#import "WXApiObject.h"
#import "WXApi.h"
@implementation WXHander

+ (NSString *)jumpToBizPay:(id )dict{
    //============================================================
//    NSString *urlString   = @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php?plat=ios";
//    //解析服务端返回json数据
//    NSError *error;
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//    //将请求的url数据放到NSData对象中
//    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    if ( response != nil) {
//        NSMutableDictionary *dict = NULL;
//        //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
//        dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
//        
//        NSLog(@"返回的数据是%@",dict);
//        
//    }else{
//        return @"服务器返回错误";
//    }
    if(dict != nil){
//        NSMutableString *retcode = [dict objectForKey:@"retcode"];
        if (1){
//            NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
            
            //调起微信支付
//            PayReq* req             = [[PayReq alloc] init];
//            req.partnerId           = @"1379853002";
//            req.prepayId            = [dict objectForKey:@"prepayid"];
//            req.nonceStr            = [dict objectForKey:@"noncestr"];
//            req.timeStamp           = stamp.intValue;
//            req.package             = [dict objectForKey:@"package"];
//            req.sign                = [dict objectForKey:@"sign"];
//            [WXApi sendReq:req];
            
            PayReq* req             = [[PayReq alloc] init];
            req.partnerId           = [dict objectForKey:@"partnerid"];
            req.prepayId            = [dict objectForKey:@"prepayid"];
            req.nonceStr            = [dict objectForKey:@"noncestr"];
            req.timeStamp           = [[dict objectForKey:@"timestamp"] intValue];
            req.package             = [dict objectForKey:@"package"];
            req.sign                = [dict objectForKey:@"sign"];
            [WXApi sendReq:req];
            
           
            //日志输出
            NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",[dict objectForKey:@"appid"],req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign );
            return @"";
        }else{
            return [dict objectForKey:@"retmsg"];
        }
    }else{
        return @"服务器返回错误，未获取到json对象";
    }

}
@end
