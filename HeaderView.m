//
//  HeaderView.m
//  foot
//
//  Created by Admin on 16/8/10.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "HeaderView.h"
#import "XThttpManager.h"
#import "SDCycleScrollView.h"

@interface HeaderView ()<WYScrollViewNetDelegate,SDCycleScrollViewDelegate>{
    SDCycleScrollView *topScrollView;
    NSInteger page ;
    
}

@end
@implementation HeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
            WS(weakSelf)
            XThttpManager*manager= [XThttpManager shareManager] ;
            [manager uploadLatAndLonComplete:^(NSMutableArray *array) {
                NSLog(@"商城页面顶部滚动视图的数组是：%@",array);
                
                topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 200) imageNamesGroup:array];
                /** 设置占位图*/
                topScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
                /** 获取网络图片的index*/
                topScrollView.delegate = weakSelf;
                /** 添加到当前View上*/
                [weakSelf addSubview:topScrollView];
            }];

        }
    return self;
}
-(void)xt_setupScrollview{
    
}


/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{

//    NSLog(@"点击了第%ld图片",(long)index);
    NSNumber *num = [NSNumber numberWithInteger:index];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"scrollImageClicked" object:nil userInfo:@{@"index":num}];
}


@end
