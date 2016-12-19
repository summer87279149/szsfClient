/*!
 @header YCUserModel.h
 @abstract 用户数据
 @version 1.00 2015/04/20 Creation
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define USER_TOKEN                          @"ud_user_token"
#define USER_NAME                           @"ud_user_name"
#define USER_PASSWORD                       @"ud_user_password"
#define USER_STATUS                         @"ud_user_status"
#define USER_ID                             @"ud_user_id"
#define USER_PHONE                          @"phoneNumber"
#define USER_LA                             @"latitude"
#define USER_LO                             @"longitude"
#define USER_Position                       @"position"
#define USER_City                           @"city"
#define USER_Info                           @"ud_pay_Info"
/*!
 @class
 @abstract 用户数据类
 */
@interface YCUserModel : NSObject
//用户名
@property (strong, nonatomic) NSString *userName;
//密码
@property (strong, nonatomic) NSString *password;
//用户id
@property (strong, nonatomic) NSString *userId;
//手机号
@property (strong, nonatomic) NSString *phoneNumber;
//token
@property (strong, nonatomic) NSString *token;
//经度
@property(nonatomic,strong)NSString *latitude;
//纬度
@property(nonatomic,strong)NSString *longitude;
//城市
@property(nonatomic,copy) NSString *city;
//位置
@property(nonatomic,copy) NSString *position;
//记录用户支付的是服务订单还是商品 1:服务订单，2商品订单,3充值订单
@property(nonatomic,copy) NSString *payInfo;
// 用户状态，0为待审核，1为审核通过，2为驳回，3为失败
@property (strong, nonatomic) NSString *userStates;

+(instancetype)shareManager;

- (void)save;

+ (NSString *)userToken;

+ (NSString *)userStatus;

+ (NSString *)username;

+ (NSString *)phoneNumber;

+ (NSString *)password;

+ (NSString *)userId;

+ (BOOL)didLogin;

- (void)logOut;

+ (NSString *)latitude;

+ (NSString *)longitude;

+ (NSString *)position;

+ (NSString *)getPayInfo;

@end
