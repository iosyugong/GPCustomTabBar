//
//  ViewController.m
//  GPCustomTabBar
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 daihanqi. All rights reserved.
//

#import "ViewController.h"
#import "GPTabarView.h"
#import "GPCListView.h"
#import "GPJavaListView.h"
#import "GPOCListView.h"

@interface ViewController ()<TabarViewDelegate>

@property (nonatomic, weak) GPCListView * cListView;
@property (nonatomic, weak) GPJavaListView * javaListView;
@property (nonatomic, weak) GPOCListView * ocListView;

@end

@implementation ViewController

- (GPCListView *)cListView
{
    if (_cListView == nil) {
        
        GPCListView * clistView = [GPCListView cListView];
        [self.view addSubview:clistView];
        _cListView = clistView;
    }
    
    return _cListView;
}

- (GPJavaListView *)javaListView
{
    if (_javaListView == nil) {
        
        GPJavaListView * javaListView = [GPJavaListView javaListView];
        [self.view addSubview:javaListView];
        _javaListView = javaListView;
    }
    
    return _javaListView;
}

- (GPOCListView *)ocListView
{
    if (_ocListView == nil) {
        
        GPOCListView * ocListView = [GPOCListView ocListView];
        [self.view addSubview:ocListView];
        _ocListView = ocListView;
    }
    
    return _ocListView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GPTabarView * tabbarView = [GPTabarView baseTabar];
    //代理
    tabbarView.delegate = self;

    [self.view addSubview:tabbarView];
    tabbarView.backgroundColor = [UIColor grayColor];
    
    UIButton * btnOC = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setButton:btnOC WithImageSelected:@"b_selected" normal:@"b_normal" title:@"OC"];
    
    UIButton * btnJava = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setButton:btnJava WithImageSelected:@"b_selected" normal:@"b_normal" title:@"OC"];
    
    UIButton * btnC = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setButton:btnC WithImageSelected:@"b_selected" normal:@"b_normal" title:@"OC"];
    
    tabbarView.items = @[btnOC, btnJava, btnC];
    
}

- (void)setButton:(UIButton *)button WithImageSelected:(NSString *)selected normal:(NSString *)normal title:(NSString *)title{
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
}

#pragma mark - 代理方法实现

- (void)tabar:(GPTabarView *)tabar touchItemIndex:(NSInteger)index
{
    NSLog(@"%@", tabar);
    
    switch (index) {
        case 0:
            [self.view bringSubviewToFront:self.ocListView];
            break;
        case 1:
            [self.view bringSubviewToFront:self.javaListView];
            break;
        case 2:
            [self.view bringSubviewToFront:self.cListView];
            break;
            
        default:
            break;
    }
    [self.view bringSubviewToFront:tabar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
