//
//  UIView+GPExt.h
//  GPCustomTabBar
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GPExt)

/**
 *  这里@property的属性只是生成了get和set方法的声明，并没有具体的实现，所以要在.m里去实现get，set方法
 *  这样做的目的是，继承自uiview的类可以直接用.语法得到下面的属性
 *  并且.m中不能用.h里成员的_方式
 */
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

@end
