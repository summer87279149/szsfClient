//
//  HeaderView.m
//  foot
//
//  Created by Admin on 16/8/10.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "HeaderView.h"
#import "WYScrollView.h"
@interface HeaderView ()<WYScrollViewNetDelegate>

@end
@implementation HeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NetImageArray = [[NSMutableArray alloc]initWithCapacity:0];
        // ========测试数据 记得删掉=======
        NetImageArray = [NSMutableArray arrayWithObjects:
                         @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                         @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                         @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                         nil];
        self.backgroundColor = COLOR;
        _WYNetScrollView = [[WYScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200) WithNetImages:NetImageArray];
        /** 设置滚动延时*/
        _WYNetScrollView.AutoScrollDelay = 3;
        /** 设置占位图*/
        _WYNetScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
        /** 获取网络图片的index*/
        self.WYNetScrollView.netDelagate = self;
        /** 添加到当前View上*/
        [self addSubview:_WYNetScrollView];
    }
    return self;
}

-(void)didSelectedNetImageAtIndex:(NSInteger)index{
    NSLog(@"点击了第%ld图片",(long)index);
}

@end
