//
//  GPCListView.m
//  GPCustomTabBar
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "GPCListView.h"

@implementation GPCListView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (id)cListView
{
    return [[self alloc] init];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
    
    self.backgroundColor = [UIColor greenColor];
}

@end
