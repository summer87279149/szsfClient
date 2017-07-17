//
//  XTCommonAPIConstant.h
//  foot
//
//  Created by Admin on 16/9/27.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTCommonAPIConstant : NSObject
#pragma mark - HOME / 首页
/** 上传经纬度*/
UIKIT_EXTERN NSString *const XTUploadLinAndLon;

#pragma mark - DISCOVER / 到店
UIKIT_EXTERN NSString *const kXTGoToShop;
//提交项目订单
UIKIT_EXTERN NSString *const kXTCommonAPIConstantSubmitOrder;
#pragma mark - PUBLISH / 上门
UIKIT_EXTERN NSString *const kToMyHome;
#pragma mark - USER / 商城
//评价
UIKIT_EXTERN NSString *const XTCommonAPIConstantComment;
//主商城页面
UIKIT_EXTERN NSString *const kShop;
//搜索结果的商铺店铺
UIKIT_EXTERN NSString *const kXTCommonAPIConstantSearchShop;
//shop详情
UIKIT_EXTERN NSString *const kXTCommonAPIConstantShopDetail;
//商品详情
UIKIT_EXTERN NSString *const kXTCommonAPIConstantShopProductDetail;
//项目
UIKIT_EXTERN NSString *const kXTCommonAPIConstantProject;
//查询商品订单
UIKIT_EXTERN NSString *const kXTCommonAPIConstantQueryOrderForm;
//购物车
UIKIT_EXTERN NSString *const kXTCommonAPIConstantPruductCar;
//添加到购物车
UIKIT_EXTERN NSString *const kXTCommonAPIConstantAddPruductToCar;
//更新购物车商品
UIKIT_EXTERN NSString *const kXTCommonAPIConstantUpdata;
//商品评价
UIKIT_EXTERN NSString *const kXTCommonAPIConstantMallsComment;
//从购物车结算
UIKIT_EXTERN NSString *const kXTCommonAPIConstantPayPruductCar;
//微信支付商品
UIKIT_EXTERN NSString *const kXTCommonAPIConstantPayWX;

//余额支付
UIKIT_EXTERN NSString *const kXTCommonAPIConstantPayYuE;
//支付宝支付
UIKIT_EXTERN NSString *const kXTCommonAPIConstantPayAlipay;
//已完成／未完成订单
UIKIT_EXTERN NSString *const kXTCommonAPIConstantCompleteOrUnCompleteOrderForm;
//技师页面
UIKIT_EXTERN NSString *const kXTCommonAPIConstantTech;
#pragma mark - CHECK / 审核


#pragma mark - USER / 用户
//"我的"页面
UIKIT_EXTERN NSString *const kMinePage;
//登入 
UIKIT_EXTERN NSString *const kUserLogin;
//注册
UIKIT_EXTERN NSString *const kUserRegister;
//重置密码
UIKIT_EXTERN NSString *const kUserReset;
//短信验证码
UIKIT_EXTERN NSString *const kUserSms;

//我的关注
UIKIT_EXTERN NSString *const kUserFocusTec;
//添加关注
UIKIT_EXTERN NSString *const kUserAddFocusTec;
//取消关注
UIKIT_EXTERN NSString *const kUserCancelFocusTec;
//确认订单已完成
UIKIT_EXTERN NSString *const kMakeSureOrderComplete;

//nickName
UIKIT_EXTERN NSString *const kUserModifyNickName;
//上传图片
UIKIT_EXTERN NSString *const kUseruploadPicture;
//意见反馈
UIKIT_EXTERN NSString *const kUserSuggestion;
//个人信息
UIKIT_EXTERN NSString *const kUserInfo;
//注册页面
UIKIT_EXTERN NSString *const kUserregist;
//我的订单
UIKIT_EXTERN NSString *const kUserrMyOrderNumber;
//根据充值金额获取充值订单号
UIKIT_EXTERN NSString *const kGetOrderIDByChargeNum;
//充值
UIKIT_EXTERN NSString *const kUserCharge;
//收藏商铺
UIKIT_EXTERN NSString *const kUserrCollectShop;
//取消收藏店铺
UIKIT_EXTERN NSString *const kUserCancelCollectShop;
//查询我的收藏商铺
UIKIT_EXTERN NSString *const kUserGetMyCollectShop;
@end
