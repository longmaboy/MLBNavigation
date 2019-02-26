//
//  UIView+MLBLayout.m
//
//
//  Created by Mac on 2019/2/25.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "UIView+MLBLayout.h"

@implementation UIView (MLBLayout)

- (void)setM_x:(CGFloat)m_x
{
    CGRect frame = self.frame;
    frame.origin.x = m_x;
    self.frame = frame;
}

- (void)setM_y:(CGFloat)m_y
{
    CGRect frame = self.frame;
    frame.origin.y = m_y;
    self.frame = frame;
}

- (CGFloat)m_x
{
    return self.frame.origin.x;
}

- (CGFloat)m_y
{
    return self.frame.origin.y;
}

- (void)setM_centerX:(CGFloat)m_centerX
{
    CGPoint center = self.center;
    center.x = m_centerX;
    self.center = center;
}

- (CGFloat)m_centerX
{
    return self.center.x;
}

- (void)setM_centerY:(CGFloat)m_centerY
{
    CGPoint center = self.center;
    center.y = m_centerY;
    self.center = center;
}

- (CGFloat)m_centerY
{
    return self.center.y;
}

- (void)setM_width:(CGFloat)m_width
{
    CGRect frame = self.frame;
    frame.size.width = m_width;
    self.frame = frame;
}

- (void)setM_height:(CGFloat)m_height
{
    CGRect frame = self.frame;
    frame.size.height = m_height;
    self.frame = frame;
}

- (CGFloat)m_height
{
    return self.frame.size.height;
}

- (CGFloat)m_width
{
    return self.frame.size.width;
}

- (void)setM_size:(CGSize)m_size
{
    CGRect frame = self.frame;
    frame.size = m_size;
    self.frame = frame;
}

- (CGSize)m_size
{
    return self.frame.size;
}

- (void)setM_origin:(CGPoint)m_origin
{
    CGRect frame = self.frame;
    frame.origin = m_origin;
    self.frame = frame;
}

- (CGPoint)m_origin
{
    return self.frame.origin;
}
- (CGFloat)m_top
{
    return self.frame.origin.y;
}

- (void)setM_top:(CGFloat)m_top
{
    CGRect frame = self.frame;
    frame.origin.y = m_top;
    self.frame = frame;
}

- (void)setM_left:(CGFloat)m_left
{
    CGRect frame = self.frame;
    frame.origin.x = m_left;
    self.frame = frame;
}

- (CGFloat)m_left
{
    return self.frame.origin.x;
}

- (CGFloat)m_bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (void)setM_bottom:(CGFloat)m_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = m_bottom - frame.size.height;
    self.frame = frame;
}

- (void)setM_right:(CGFloat)m_right
{
    CGRect frame = self.frame;
    frame.origin.x = m_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)m_right
{
    return self.frame.size.width + self.frame.origin.x;
}


@end
