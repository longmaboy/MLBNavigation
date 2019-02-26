//
//  MLBConfig.h
//  MLBNavigation
//
//  Created by Mac on 2019/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLBConfig : NSObject

//左边返回item字体大小
@property (nonatomic, strong) UIFont *leftFontSize;

//控制器标题字体大小
@property (nonatomic, strong) UIFont *titleFontSize;

//右边item字体大小
@property (nonatomic, strong) UIFont *rightFontSize;

@property (nonatomic,   copy) NSString *leftItemImg;

@property (nonatomic, assign) CGFloat itemLeftSpace;

//最右边item右边距离
@property (nonatomic, assign) CGFloat itemRightSpace;

@property (nonatomic, strong) UIColor *naviBgColor;

@property (nonatomic,   copy) NSString *naviBgImg;

@property (nonatomic, assign) BOOL lineHidden;

@end

NS_ASSUME_NONNULL_END
