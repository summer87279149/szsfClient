//
//  TechViewController.h
//  FootMassage
//
//  Created by Admin on 16/8/8.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TechViewController : UIViewController
//技师id
@property (copy, nonatomic) NSString *techID;
//技师头像
@property (strong, nonatomic)  UIImageView *portrait;
//关注按钮
@property (strong, nonatomic)  UIButton *focusButton;
//技师名字
@property (strong, nonatomic)  UILabel *name;
//名师认证章图标
@property (strong, nonatomic)  UIImageView *AuthenticationImage;
//工作经验UITextView
@property (strong, nonatomic)  UITextView *workExperience;
//TA的动态button
@property (strong, nonatomic)  UIButton *hisActionButton;
//认证证书Button
@property (strong, nonatomic)  UIButton *AuthenticationButton;
//技能
@property (strong, nonatomic)  UILabel *skill;
//服务次数
@property (strong, nonatomic)  UILabel *serviceTimes;
//评论和好评率
@property(nonatomic,strong) UILabel *comments;
@end
