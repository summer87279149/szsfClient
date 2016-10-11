//
//  XTCommonAPIConstant.m
//  foot
//
//  Created by Admin on 16/9/27.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "XTCommonAPIConstant.h"

@implementation XTCommonAPIConstant
NSString *const XTCommonAPIConstantURL = @"http://192.168.0.195";
#pragma mark - HOME / 首页
/** 上传经纬度*/
NSString *const XTUploadLinAndLon = @"http://192.168.0.195/zuliao/index.php/Index/index";


#pragma mark - DISCOVER / 到店
NSString *const kXTGoToShop = @"http://192.168.0.195/zuliao/index.php/Toshop/index";
NSString *const kXTCommonAPIConstantSubmitOrder = @"http://192.168.0.195/zuliao/index.php/Yuyue/index";


#pragma mark - PUBLISH / 上门
NSString *const kToMyHome = @"http://192.168.0.195/zuliao/index.php/Tohome/index";


#pragma mark - USER / 商城
//评价
NSString *const XTCommonAPIConstantComment = @"http://192.168.0.195/zuliao/index.php/Remark/index";
//主页面的商城
NSString *const kShop = @"http://192.168.0.195/zuliao/index.php/Market/index";
//搜索结果的商铺店铺
NSString *const kXTCommonAPIConstantSearchShop = @"http://192.168.0.195/zuliao/index.php/Index/search";
//shop详情
NSString *const kXTCommonAPIConstantShopDetail = @"http://192.168.0.195/zuliao/index.php/Shop/index";
//项目具体页面
NSString *const kXTCommonAPIConstantProject = @"http://192.168.0.195/zuliao/index.php/Project/index";
//查询订单
NSString *const kXTCommonAPIConstantQueryOrderForm = @"http://192.168.0.195/zuliao/index.php/Order/index";
//商品详情
NSString *const kXTCommonAPIConstantShopProductDetail = @"http://192.168.0.195/zuliao/index.php/Product/index";
//购物车
NSString *const kXTCommonAPIConstantPruductCar = @"http://192.168.0.195/zuliao/index.php/Cart/index";
//添加到购物车
NSString *const kXTCommonAPIConstantAddPruductToCar = @"http://192.168.0.195/zuliao/index.php/Cart/add";
//更新购物车商品
NSString *const kXTCommonAPIConstantUpdata = @"http://192.168.0.195/zuliao/index.php/Cart/update";

//从购物车结算
NSString *const kXTCommonAPIConstantPayPruductCar = @"http://192.168.0.195/zuliao/index.php/Cart/checkout";
//已完成或者未完成订单
NSString *const kXTCommonAPIConstantCompleteOrUnCompleteOrderForm = @"http://192.168.0.195/zuliao/index.php/Order/get";
//技师页面
NSString *const kXTCommonAPIConstantTech = @"http://192.168.0.195/zuliao/index.php/Tech/index";
#pragma mark - CHECK / 审核


#pragma mark - USER / 用户
//“我的”页面
NSString *const kMinePage = @"http://192.168.0.195/zuliao/index.php/Mine/index";
//登入注册
NSString *const kUserLogin = @"http://192.168.0.195/zuliao/index.php/User/login" ;
//我的关注
NSString *const kUserFocusTec = @"http://192.168.0.195/zuliao/index.php/Focus/index" ;
//添加关注
NSString *const kUserAddFocusTec = @"http://192.168.0.195/zuliao/index.php/Focus/add";
//取消关注
NSString *const kUserCancelFocusTec = @"http://192.168.0.195/zuliao/index.php/Focus/remove";
//nickname

NSString *const kUserModifyNickName = @"http://192.168.0.195/zuliao/index.php/Myinfo/update";
//
NSString *const kUseruploadPicture = @"http://192.168.0.195/zuliao/index.php/Myinfo/upload";
//意见反馈
NSString *const kUserSuggestion = @"http://192.168.0.195/zuliao/index.php/Suggestion/index";
//个人信息
NSString *const kUserInfo = @"http://192.168.0.195/zuliao/index.php/Myinfo/index";
//注册页面
NSString *const kUserregist = @"http://192.168.0.195/zuliao/index.php/User/register";

@end
