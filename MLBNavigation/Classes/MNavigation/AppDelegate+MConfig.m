//
//  AppDelegate+MConfig.m
//  MNavigation
//
//  Created by Mac on 2019/2/25.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "AppDelegate+MConfig.h"
#import <objc/runtime.h>

static const void * MConfigKey = &MConfigKey;

@implementation AppDelegate (MConfig)

@dynamic config;

- (MConfig *)config
{
    return objc_getAssociatedObject(self, &MConfigKey);
}

- (void)setConfig:(MConfig *)config
{
    objc_setAssociatedObject(self, MConfigKey, config, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
