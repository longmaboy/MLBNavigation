//
//  NavigationController.m
//  TestNavi
//
//  Created by Mac on 2019/1/14.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation NavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //系统滑动手势
    self.interactivePopGestureRecognizer.delegate = self;
        
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //只要不等于1就返回YES，说明此时具有滑动功能
    return self.childViewControllers.count != 1;
}

//拦截控制器的push操作
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count != 0) {
        // 隐藏下面的TabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
        
    //这句super的push要放在后面
    [super pushViewController:viewController animated:animated];
}

@end
