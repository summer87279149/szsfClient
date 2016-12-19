//
//  XTCommonAPIConstant.m
//  foot
//
//  Created by Admin on 16/9/27.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "XTCommonAPIConstant.h"

@implementation XTCommonAPIConstant

NSString *const XTCommonAPIConstantURL = @"http://121.40.108.71";
#pragma mark - HOME / 首页
/** 上传经纬度*/
NSString *const XTUploadLinAndLon = @"http://121.40.108.71/zuliao/index.php/Index/index";


#pragma mark - DISCOVER / 到店
NSString *const kXTGoToShop = @"http://121.40.108.71/zuliao/index.php/Toshop/index";
//确认预约
NSString *const kXTCommonAPIConstantSubmitOrder = @"http://121.40.108.71/zuliao/index.php/Yuyue/index";


#pragma mark - PUBLISH / 上门
//NSString *const kToMyHome = @"http://192.168.1.113/zuliao/index.php/Tohome/index";
NSString *const kToMyHome = @"http://121.40.108.71/zuliao/index.php/Tohome/index";

#pragma mark - USER / 商城
//评价
NSString *const XTCommonAPIConstantComment = @"http://121.40.108.71/zuliao/index.php/Remark/index";
//主页面的商城
NSString *const kShop = @"http://121.40.108.71/zuliao/index.php/Market/index";
//搜索结果的商铺店铺
NSString *const kXTCommonAPIConstantSearchShop = @"http://121.40.108.71/zuliao/index.php/Index/search";
//shop详情
NSString *const kXTCommonAPIConstantShopDetail = @"http://121.40.108.71/zuliao/index.php/Shop/index";
//项目具体页面
NSString *const kXTCommonAPIConstantProject = @"http://121.40.108.71/zuliao/index.php/Project/index";
//查询商品订单
NSString *const kXTCommonAPIConstantQueryOrderForm = @"http://121.40.108.71/zuliao/index.php/Market/getorder";
//商品详情
NSString *const kXTCommonAPIConstantShopProductDetail = @"http://121.40.108.71/zuliao/index.php/Product/index";
//购物车
NSString *const kXTCommonAPIConstantPruductCar = @"http://121.40.108.71/zuliao/index.php/Cart/index";
//添加到购物车
NSString *const kXTCommonAPIConstantAddPruductToCar = @"http://121.40.108.71/zuliao/index.php/Cart/add";
//更新购物车商品
NSString *const kXTCommonAPIConstantUpdata = @"http://121.40.108.71/zuliao/index.php/Cart/update";
//商品评价
NSString *const kXTCommonAPIConstantMallsComment = @"http://121.40.108.71/zuliao/index.php/Remark/add";
//从购物车结算
NSString *const kXTCommonAPIConstantPayPruductCar = @"http://121.40.108.71/zuliao/index.php/Cart/checkout";
//微信支付商品
NSString *const kXTCommonAPIConstantPayWX = @"http://121.40.108.71/zuliao/index.php/WxPay/generate";

//余额支付
NSString *const kXTCommonAPIConstantPayYuE = @"http://121.40.108.71/zuliao/index.php/Order/balancePay";
//支付宝支付
NSString *const kXTCommonAPIConstantPayAlipay = @"http://121.40.108.71/zuliao/index.php/Alipay/alipayapi";
//已完成或者未完成订单
NSString *const kXTCommonAPIConstantCompleteOrUnCompleteOrderForm = @"http://121.40.108.71/zuliao/index.php/Order/get";
//技师页面
NSString *const kXTCommonAPIConstantTech = @"http://121.40.108.71/zuliao/index.php/Tech/index";
#pragma mark - CHECK / 审核


#pragma mark - USER / 用户
//“我的”页面
NSString *const kMinePage = @"http://121.40.108.71/zuliao/index.php/Mine/index";

//登入
NSString *const kUserLogin = @"http://121.40.108.71/zuliao/index.php/User/login" ;
//注册
NSString *const kUserRegister = @"http://121.40.108.71/zuliao/index.php/User/register";
//重置密码
NSString *const kUserReset = @"http://121.40.108.71/zuliao/index.php/User/reset";
//短信验证码
NSString *const kUserSms = @"http://121.40.108.71/zuliao/index.php/Sms/send";






//我的关注
NSString *const kUserFocusTec = @"http://121.40.108.71/zuliao/index.php/Focus/index" ;
//添加关注
NSString *const kUserAddFocusTec = @"http://121.40.108.71/zuliao/index.php/Focus/add";
//取消关注
NSString *const kUserCancelFocusTec = @"http://121.40.108.71/zuliao/index.php/Focus/remove";
//确认订单已经完成
NSString *const kMakeSureOrderComplete = @"http://121.40.108.71/zuliao/index.php/Order/updateState";
//nickname
NSString *const kUserModifyNickName = @"http://121.40.108.71/zuliao/index.php/Myinfo/update";
//
NSString *const kUseruploadPicture = @"http://121.40.108.71/zuliao/index.php/Myinfo/upload";
//意见反馈
NSString *const kUserSuggestion = @"http://121.40.108.71/zuliao/index.php/Suggestion/index";
//个人信息
NSString *const kUserInfo = @"http://121.40.108.71/zuliao/index.php/Myinfo/index";
//根据充值金额获取订单号
NSString *const kGetOrderIDByChargeNum = @"http://121.40.108.71/zuliao/index.php/Recharge";
//充值
 NSString *const kUserCharge = @"http://121.40.108.71/zuliao/index.php/WxPay/generate";
//注册页面
NSString *const kUserregist = @"http://121.40.108.71/zuliao/index.php/User/register";
//我的订单
NSString *const kUserrMyOrderNumber = @"http://121.40.108.71/zuliao/index.php/Order/index";
//收藏商铺
NSString *const kUserrCollectShop = @"http://121.40.108.71/zuliao/index.php/Shop/addFavor";
//取消收藏
NSString *const kUserCancelCollectShop = @"http://121.40.108.71/zuliao/index.php/Shop/removeFavor";
//查询我收藏的店铺
NSString *const kUserGetMyCollectShop = @"http://121.40.108.71/zuliao/index.php/Mine/favorShop";
@end
