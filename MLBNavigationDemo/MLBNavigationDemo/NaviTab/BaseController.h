//
//  BaseController.h
//  MLBNavigationDemo
//
//  Created by Mac on 2019/2/26.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "MLBBaseController.h"

/** 屏幕宽高 */
#define kScreenW    [UIScreen mainScreen].bounds.size.width
#define kScreenH    [UIScreen mainScreen].bounds.size.height

/** 导航栏高度和导航栏、tab变化值 */
#define kTabbarIncrease  (kScreenH >= 812 ? 34 : 0)
#define kNaviIncrease    (kScreenH >= 812 ? 24 : 0)
#define kStatusHeight    [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNaviHeight      (kStatusHeight+44)
#define kTabbarHeight    (kTabbarIncrease+49)

/** 字体、图片、RGB值*/
#define FONT(flot)       [UIFont systemFontOfSize:flot]
#define ImgName(imgName) [UIImage imageNamed:imgName]
#define RGB(r,g,b,alp)   [UIColor colorWithRed:((float)r/255.0f) green:((float)g/255.0f) blue:((float)b/255.0f) alpha:alp]

NS_ASSUME_NONNULL_BEGIN

@interface BaseController : MLBBaseController

/**
 说明：最好是像这样，新建一个基类继承我的MLBBaseController
 这样在这个基类中还能做你想做的事情
 */

@end

NS_ASSUME_NONNULL_END
