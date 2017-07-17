//
//  XTCommonAPIConstant.m
//  foot
//
//  Created by Admin on 16/9/27.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "XTCommonAPIConstant.h"

@implementation XTCommonAPIConstant

NSString *const XTCommonAPIConstantURL = @"http://xxj.yzszsf.com";
#pragma mark - HOME / 首页
/** 上传经纬度*/
NSString *const XTUploadLinAndLon = @"http://xxj.yzszsf.com/index.php/Index/index";


#pragma mark - DISCOVER / 到店
NSString *const kXTGoToShop = @"http://xxj.yzszsf.com/index.php/Toshop/index";
//确认预约
NSString *const kXTCommonAPIConstantSubmitOrder = @"http://xxj.yzszsf.com/index.php/Yuyue/index";


#pragma mark - PUBLISH / 上门
//NSString *const kToMyHome = @"http://192.168.1.113/zuliao/index.php/Tohome/index";
NSString *const kToMyHome = @"http://xxj.yzszsf.com/index.php/Tohome/index";

#pragma mark - USER / 商城
//评价
NSString *const XTCommonAPIConstantComment = @"http://xxj.yzszsf.com/index.php/Remark/index";
//主页面的商城
NSString *const kShop = @"http://xxj.yzszsf.com/index.php/Market/index";
//搜索结果的商铺店铺
NSString *const kXTCommonAPIConstantSearchShop = @"http://xxj.yzszsf.com/index.php/Index/search";
//shop详情
NSString *const kXTCommonAPIConstantShopDetail = @"http://xxj.yzszsf.com/index.php/Shop/index";
//项目具体页面
NSString *const kXTCommonAPIConstantProject = @"http://xxj.yzszsf.com/index.php/Project/index";
//查询商品订单
NSString *const kXTCommonAPIConstantQueryOrderForm = @"http://xxj.yzszsf.com/index.php/Market/getorder";
//商品详情
NSString *const kXTCommonAPIConstantShopProductDetail = @"http://xxj.yzszsf.com/index.php/Product/index";
//购物车
NSString *const kXTCommonAPIConstantPruductCar = @"http://xxj.yzszsf.com/index.php/Cart/index";
//添加到购物车
NSString *const kXTCommonAPIConstantAddPruductToCar = @"http://xxj.yzszsf.com/index.php/Cart/add";
//更新购物车商品
NSString *const kXTCommonAPIConstantUpdata = @"http://xxj.yzszsf.com/index.php/Cart/update";
//商品评价
NSString *const kXTCommonAPIConstantMallsComment = @"http://xxj.yzszsf.com/index.php/Remark/add";
//从购物车结算
NSString *const kXTCommonAPIConstantPayPruductCar = @"http://xxj.yzszsf.com/index.php/Cart/checkout";
//微信支付商品
NSString *const kXTCommonAPIConstantPayWX = @"http://xxj.yzszsf.com/index.php/WxPay/generate";

//余额支付
NSString *const kXTCommonAPIConstantPayYuE = @"http://xxj.yzszsf.com/index.php/Order/balancePay";
//支付宝支付
NSString *const kXTCommonAPIConstantPayAlipay = @"http://xxj.yzszsf.com/index.php/Alipay/alipayapi";
//已完成或者未完成订单
NSString *const kXTCommonAPIConstantCompleteOrUnCompleteOrderForm = @"http://xxj.yzszsf.com/index.php/Order/get";
//技师页面
NSString *const kXTCommonAPIConstantTech = @"http://xxj.yzszsf.com/index.php/Tech/index";
#pragma mark - CHECK / 审核


#pragma mark - USER / 用户
//“我的”页面
NSString *const kMinePage = @"http://xxj.yzszsf.com/index.php/Mine/index";

//登入
NSString *const kUserLogin = @"http://xxj.yzszsf.com/index.php/User/login" ;
//注册
NSString *const kUserRegister = @"http://xxj.yzszsf.com/index.php/User/register";
//重置密码
NSString *const kUserReset = @"http://xxj.yzszsf.com/index.php/User/reset";
//短信验证码
NSString *const kUserSms = @"http://xxj.yzszsf.com/index.php/Sms/send";






//我的关注
NSString *const kUserFocusTec = @"http://xxj.yzszsf.com/index.php/Focus/index" ;
//添加关注
NSString *const kUserAddFocusTec = @"http://xxj.yzszsf.com/index.php/Focus/add";
//取消关注
NSString *const kUserCancelFocusTec = @"http://xxj.yzszsf.com/index.php/Focus/remove";
//确认订单已经完成
NSString *const kMakeSureOrderComplete = @"http://xxj.yzszsf.com/index.php/Order/updateState";
//nickname
NSString *const kUserModifyNickName = @"http://xxj.yzszsf.com/index.php/Myinfo/update";
//
NSString *const kUseruploadPicture = @"http://xxj.yzszsf.com/index.php/Myinfo/upload";
//意见反馈
NSString *const kUserSuggestion = @"http://xxj.yzszsf.com/index.php/Suggestion/index";
//个人信息
NSString *const kUserInfo = @"http://xxj.yzszsf.com/index.php/Myinfo/index";
//根据充值金额获取订单号
NSString *const kGetOrderIDByChargeNum = @"http://xxj.yzszsf.com/index.php/Recharge";
//充值
 NSString *const kUserCharge = @"http://xxj.yzszsf.com/index.php/WxPay/generate";
//注册页面
NSString *const kUserregist = @"http://xxj.yzszsf.com/index.php/User/register";
//我的订单
NSString *const kUserrMyOrderNumber = @"http://xxj.yzszsf.com/index.php/Order/index";
//收藏商铺
NSString *const kUserrCollectShop = @"http://xxj.yzszsf.com/index.php/Shop/addFavor";
//取消收藏
NSString *const kUserCancelCollectShop = @"http://xxj.yzszsf.com/index.php/Shop/removeFavor";
//查询我收藏的店铺
NSString *const kUserGetMyCollectShop = @"http://xxj.yzszsf.com/index.php/Mine/favorShop";
@end
