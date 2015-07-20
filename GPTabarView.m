//
//  GPTabarView.m
//  GPCustomTabBar
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "GPTabarView.h"
#import "UIView+GPExt.h"

@implementation GPTabarView

- (id)init
{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
}

- (void)setItems:(NSArray *)items
{
    _items = items;
    
    for (UIButton * btn in self.items) {
        [self addSubview:btn];
    }
    
    //通知父视图调用 layoutSubViews
    [self setNeedsLayout];
    
    //默认选中第一个button
    [self btnAction:self.items[0]];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat superViewWidth = self.width;
    CGFloat superViewHeight = self.height;
    CGFloat btnWidth = superViewWidth / self.items.count;
    
    //遍历数组设置btn的frame
    for (int i = 0; i < self.items.count; i++) {
        
        UIButton * btn = self.items[i];
        btn.width = btnWidth;
        btn.height = superViewHeight;
        btn.x = i * btnWidth;
        btn.y = 0;
        
        btn.tag = i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
}

- (void)btnAction:(UIButton *)btn
{
    //如果btn为选中状态  不处理
    if (btn.selected) {
        return;
    }
    
    //遍历所有的button，设置为非选中状态
    for (UIButton * btn in self.items) {
        btn.selected = NO;
    }
    //将当前点击button 设置为选中状态
    btn.selected = YES;
    
    [self.delegate tabar:self touchItemIndex:btn.tag];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    CGFloat selfW = newSuperview.width;
    CGFloat selfH = 49;
    CGFloat selfX = 0;
    CGFloat selfY = newSuperview.height - selfH;
    
    self.frame = CGRectMake(selfX, selfY, selfW, selfH);
}

+ (id)baseTabar
{
    return [[self alloc] init];
}

@end
