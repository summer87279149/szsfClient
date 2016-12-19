//
//  SomeOtherRequest.h
//  foot
//
//  Created by Admin on 16/9/29.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PayType) {
    PayTypeWX,
    PayTypeYuE,
    PayTypeAlipay,
};
typedef NS_ENUM(NSUInteger, PayServiceType) {
    PayServiceTypeService,
    PayServiceTypeShopItems,
};
typedef void(^Success)(id response);
typedef void(^Error)(id response);

@interface SomeOtherRequest : NSObject

@property (nonatomic, strong) AFNetworkReachabilityManager *manager;
/**
 *  关注某个技师
 *
 *  @param TecID   技师id
 *  @param user    用户id
 *  @param success 成功回调
 */
+(void)UserFocusTecWithTecID:(NSString *)TecID UserID:(NSString *)user success:(void (^)(id response))xt_success error:(Error)xt_error;
/**
 *  取消关注某个技师
 *
 *  @param TecID      技师id
 *  @param user       用户id
 */
+(void)UserCancelFocusWithTecID:(NSString *)TecID UserID:(NSString *)user success:(void (^)(id response))xt_success error:(Error)xt_error;
/**
 *  我的关注
 *
 *  @param user       技师id
 */
+(void)GetMyFocusTecWithUserID:(NSString *)user success:(void (^)(id response))xt_success error:(Error)xt_error;

/**
 *  用户建议
 *  @param suggestion 建议内容
 *  @param user       用户id
 *  @param success    成功回调
 */
+(void)UserSuggestion:(NSString*)suggestion UserID:(NSString *)user success:(Success)xt_success error:(Error)xt_error;

/**
 *  查询商品订单   我的商品订单
 *
 *  @param userID     用户id
 *  @param typeNumber 订单类型0/1
 *  @param xt_success 成功回调
 *  @param xt_error   失败回调
 */
+(void)QueryOrderFormWithUserID:(NSString *)userID FormType:(NSInteger)typeNumber page:(NSInteger)page isHeaderRefresh:(BOOL)isHeaderRefresh success:(Success)xt_success error:(Error)xt_error;

/**
 *  "我的"页面
 *  @param userID 用户id
 */
+(void)GetMineInfoWithUserID:(NSString *)userID success:(Success)xt_success error:(Error)xt_error;
/**
 *  商品详情
 *
 *  @param productID  商品id
 *  @param xt_success 成功回调
 *  @param xt_error   失败回调
 */
+(void)GetShopProductDetailWithProductID:(NSString *)productID success:(Success)xt_success error:(Error)xt_error;

/**
 *  购物车
 *
 *  @param userID     用户id
 *  @param xt_success 成功回调
 *  @param xt_error   失败回调
 */
+(void)GetProductCarWithUserID:(NSString *)userID success:(Success)xt_success error:(Error)xt_error;
/**
 *  添加到购物车
 *
 *  @param userID     用户id
 *  @param productID  商品id
 *  @param xt_success 成功回调
 *  @param xt_error   失败回调
 */
+(void)AddProductToCarWithUserId:(NSString *)userID andProductID:(NSString *)productID success:(Success)xt_success error:(Error)xt_error;
/**
 *  查询已完成或未完成订单
 *
 *  @param userID     用户id
 *  @param type       订单类型0(服务订单),1(商品定单)
 *  @param state      订单状态0(未完成),1(已完成)
 *  @param xt_success 成功回调
 *  @param xt_error   失败回调
 */
+(void)CompleteAndUnCompleteOrderWith:(NSString *)userID andOrderType:(NSInteger)type andOrderState:(NSInteger)state success:(Success)xt_success error:(Error)xt_error;

/**
 *  技师页面
 *
 *  @param TechID     技师id
 *  @param userID     用户id
 *  @param xt_success 成功回调
 *  @param xt_error   失败回调
 */
+(void)ShowTechWithTecID:(NSString *)TechID AndUserID:(NSString*)userID success:(Success)xt_success error:(Error)xt_error;
/**
 *  商家页面(未测试)
 *
 *  @param ShopID     ShopID
 *  @param xt_success 成功回调
 *  @param xt_error   失败回调
 */
+(void)GetShopDetailWithShopID:(NSString *)ShopID success:(Success)xt_success error:(Error)xt_error;
/**
 *  删除商品 ／ 增加一个商品 ／减少一个商品
 *
 *  @param ShopID
 *  @param userID
 *  @param xt_success
 *  @param xt_error
 */
+(void)deleteItemWithItemID:(NSString *)ShopID AndUserID:(NSString*)userID success:(Success)xt_success error:(Error)xt_error;
+(void)addItemWithItemID:(NSString *)ShopID AndUserID:(NSString*)userID success:(Success)xt_success error:(Error)xt_error;
+(void)decreaseItemWithItemID:(NSString *)ShopID AndUserID:(NSString*)userID success:(Success)xt_success error:(Error)xt_error;
/**
 *  结算购物车中的商品
 *
 *  @param para       参数
 *  @param xt_success
 *  @param xt_error
 */
+(void)checkoutWithPara:(id)para success:(Success)xt_success error:(Error)xt_error;
/**
 *  提交服务订单
 *
 *  @param para       参数
 *  @param xt_success
 *  @param xt_error
 */
+(void)submitOrderWithPara:(id)para success:(Success)xt_success error:(Error)xt_error;
/**
 *  上传图片
 *
 *  @param image <#image description#>
 */
+(void)saveImage:(UIImage*)image userid:(NSString*)userid  success:(Success)xt_success error:(Error)xt_error;
/**
 *  修改用户昵称
 *
 *  @param userid     <#userid description#>
 *  @param nameStr    <#nameStr description#>
 *  @param xt_success <#xt_success description#>
 *  @param xt_error   <#xt_error description#>
 */
+(void)modifyNickNameWithUserID:(NSString*)userid andName:(NSString *)nameStr success:(Success)xt_success error:(Error)xt_error;
/**
 *  意见反馈
 *
 *  @param userid     <#userid description#>
 *  @param suggestion 反馈意见内容
 *  @param xt_success <#xt_success description#>
 *  @param xt_error   <#xt_error description#>
 */
+(void)feedBackWithUserID:(NSString*)userid andSuggestion:(NSString *)suggestion success:(Success)xt_success error:(Error)xt_error;
/**
 *  获取评价
 *
 *  @param para       技师页面传入tid、店铺页面传入sid、项目页面传入tid和pid
 *  @param xt_success <#xt_success description#>
 *  @param xt_error   <#xt_error description#>
 */
+(void)GetCommentWith:(id)para success:(Success)xt_success error:(Error)xt_error;
/**
 *  订单支付的支付类型选择,不包含余额支付
 *
 *  @param orderNumber 订单号
 *  @param payType     支付类型
 *  @param xt_success
 *  @param xt_error
 */
+(void)getPayParameterWithOrderNumber:(NSString*)orderNumber andPayTape:(PayType)payType success:(Success)xt_success error:(Error)xt_error;
//微信支付服务
+(void)getPayServiceParameterWithOrderNumber:(NSString*)orderNumber andPayTape:(PayType)payType success:(Success)xt_success error:(Error)xt_error;
/**
 *  查询我的服务订单
 *  @param userID           user ID
 *  @param isComplete       查询“已完成”还是“未完成”订单
 *  @param page             page
 *  @param isHeaderRefresh  是否是headerRefresh
 *  @param xt_success
 *  @param xt_error
 */

+(void)queryMyOrderNumberWithUserID:(NSString *)userID isComplete:(NSString *)isComplete  page:(NSInteger)page isHeaderRefresh:(BOOL)isHeaderRefresh success:(Success)xt_success error:(Error)xt_error;

/**
 *  商品页面 发表评价
 *
 *  @param userid   用户id
 *  @param orderNum 订单号
 *  @param scores   评分 填写 0～5分
 *  @param content  评价内容
 */
+(void)commentWithUserid:(NSString *)userid orderNum:(NSString*)orderNum stars:(float)scores content:(NSString *)content success:(Success)xt_success error:(Error)xt_error;

/**
 用户确认订单已经完成

 @param orderID <#orderID description#>
 @param userID <#userID description#>
 @param xt_success <#xt_success description#>
 @param xt_error <#xt_error description#>
 */
+(void)makeSureOrderHasCompleted:(NSString *)orderID status:(NSString *)status success:(Success)xt_success error:(Error)xt_error;
/**
 *  注册
 *
 *  @param telNumber  手机号码
 *  @param psw        密码
 *  @param code       短信验证码
 *  @param xt_success
 *  @param xt_error
 */
+(void)registWith:(NSString *)telNumber password:(NSString *)psw smsCode:(NSString *)code success:(Success)xt_success error:(Error)xt_error;

/**
 *  重置密码
 *
 *  @param telNumber   手机号
 *  @param newPassword 新密码
 *  @param code        验证码
 *  @param xt_success
 *  @param xt_error
 */
+(void)resetPasswordWith:(NSString *)telNumber password:(NSString *)newPassword smsCode:(NSString *)code success:(Success)xt_success error:(Error)xt_error;
/**
 *  发送短信验证码
 */
+(void)sendVerifyCodeWithPhoneNumber:(NSString *)tel success:(Success)xt_success error:(Error)xt_error;
/**
 *  登入
 *
 *  @param tel        手机号
 *  @param psw        密码
 *  @param xt_success
 *  @param xt_error
 */
+(void)loginWithPhoneNumber:(NSString *)tel password:(NSString *)psw success:(Success)xt_success error:(Error)xt_error;

/**
 收藏商铺

 @param shopID     商铺id
 @param userID     用户id
 @param xt_success <#xt_success description#>
 @param xt_error   <#xt_error description#>
 */
+(void)collectShopID:(NSString *)shopID userID:(NSString *)userID success:(Success)xt_success error:(Error)xt_error;

/**
 取消收藏店铺

 @param shopID     <#shopID description#>
 @param userID     <#userID description#>
 @param xt_success <#xt_success description#>
 @param xt_error   <#xt_error description#>
 */
+(void)cancelCollectShopID:(NSString *)shopID userID:(NSString *)userID success:(Success)xt_success error:(Error)xt_error;
/**
 查询我的收藏店铺

 @param userID     <#userID description#>
 @param xt_success <#xt_success description#>
 @param xt_error   <#xt_error description#>
 */
+(void)getMyCollectionShopByUserID:(NSString *)userID page:(NSInteger)page success:(Success)xt_success error:(Error)xt_error;

/**
 充值

 @param orderID <#orderID description#>
 @param xt_success <#xt_success description#>
 @param xt_error <#xt_error description#>
 */
+(void)userChargeWithOID:(NSString *)orderID success:(Success)xt_success error:(Error)xt_error;

/**
 根据充值金额获取订单id

 @param money <#money description#>
 @param userid <#userid description#>
 @param xt_success <#xt_success description#>
 @param xt_error <#xt_error description#>
 */
+(void)userGetOrderIdBy:(int)money andUserId:(NSString*)userid success:(Success)xt_success error:(Error)xt_error;

/**
 余额支付

 @param uid <#uid description#>
 @param success <#success description#>
 @param xt_success <#xt_success description#>
 @param xt_error <#xt_error description#>
 */
+(void)payByListMoney:(NSString *)uid oid:(NSString *)oid payServiceType:(PayServiceType)type success:(Success)xt_success error:(Error)xt_error;

@end
