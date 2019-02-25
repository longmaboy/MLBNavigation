//
//  ConfigSingle.m
//  MLBNavigation
//
//  Created by Mac on 2019/2/25.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "ConfigSingle.h"

@implementation ConfigSingle

static id shared = nil;

+ (ConfigSingle *)single
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shared = [[self alloc] init];
        
    });
    
    return shared;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
