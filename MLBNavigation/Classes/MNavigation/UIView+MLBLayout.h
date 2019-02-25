//
//  UIView+MLBLayout.h
//  
//
//  Created by Mac on 2019/2/25.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MLBLayout)

/**  起点x坐标  */
@property (nonatomic, assign) CGFloat m_x;
/**  起点y坐标  */
@property (nonatomic, assign) CGFloat m_y;
/**  中心点x坐标  */
@property (nonatomic, assign) CGFloat m_centerX;
/**  中心点y坐标  */
@property (nonatomic, assign) CGFloat m_centerY;
/**  宽度  */
@property (nonatomic, assign) CGFloat m_width;
/**  高度  */
@property (nonatomic, assign) CGFloat m_height;
/**  顶部  */
@property (nonatomic, assign) CGFloat m_top;
/**  底部  */
@property (nonatomic, assign) CGFloat m_bottom;
/**  左边  */
@property (nonatomic, assign) CGFloat m_left;
/**  右边  */
@property (nonatomic, assign) CGFloat m_right;
/**  size  */
@property (nonatomic, assign) CGSize m_size;
/**  origin */
@property (nonatomic, assign) CGPoint m_origin;

@end

NS_ASSUME_NONNULL_END
