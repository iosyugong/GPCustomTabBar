//
//  GPTabarView.h
//  GPCustomTabBar
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPTabarView;

@protocol TabarViewDelegate <NSObject>

- (void)tabar:(GPTabarView *)tabar touchItemIndex:(NSInteger) index;

@end

@interface GPTabarView : UIView

@property (nonatomic, strong) NSArray * items;

//assign?
@property (nonatomic, weak) id<TabarViewDelegate> delegate;

+ (id)baseTabar;

@end
