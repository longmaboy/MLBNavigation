//
//  TabbarController.m
//  TestNavi
//
//  Created by Mac on 2019/1/14.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "TabbarController.h"
#import "HomeController.h"
#import "CameraController.h"
#import "PersonController.h"
#import "NavigationController.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar setBackgroundImage:[self createImageWithColor:RGB(110, 199, 239, 1)]];
    [self.tabBar setSelectionIndicatorImage:[self createImageWithColor:RGB(110, 199, 239, 1)]];
    
    self.tabBar.translucent = NO;
    
    //初始化所有的自控制器
    [self setUpAllChildController];
    
    
}

#pragma mark ========= 初始化所有的子控制器 =========
/**
 *  初始化所有的子控制器
 */
- (void)setUpAllChildController
{
    NSArray *imageArr = @[@"tab_home", @"tab_quotation", @"tab_trans", @"tab_me"];
    NSArray *selImgArr = @[@"tab_home_sel", @"tab_quotation_sel", @"tab_trans_sel", @"tab_me_sel"];
    
    // 添加子控制器
    
    [self addChildVc:[[HomeController alloc] init] title:@"首页" image:imageArr[0] selectedImage:selImgArr[0]];
    
    [self addChildVc:[[CameraController alloc] init] title:@"相机" image:imageArr[1] selectedImage:selImgArr[1]];
    
    [self addChildVc:[[PersonController alloc] init] title:@"我的" image:imageArr[2] selectedImage:selImgArr[2]];
    
    
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor yellowColor]} forState:UIControlStateSelected];
    
    // 为子控制器包装导航控制器
    NavigationController *navigationVc = [[NavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
}

//UIColor生成UIImage
- (UIImage *)createImageWithColor:(UIColor *)color
{
    if (color == nil) {
        return nil;
    }
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
