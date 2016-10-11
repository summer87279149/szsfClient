//
//  HeaderView.h
//  foot
//
//  Created by Admin on 16/8/10.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYScrollView.h"

@protocol HeaderViewDelegate <NSObject>
@required
-(void)scrollImagesClickedAt:(NSInteger)index;
@end
@interface HeaderView : UICollectionReusableView
{
    NSMutableArray *NetImageArray;
}
@property(nonatomic,strong)WYScrollView* WYNetScrollView;
@property(nonatomic,weak) id <HeaderViewDelegate> delegate;
-(void)xt_setupScrollview;
@end
