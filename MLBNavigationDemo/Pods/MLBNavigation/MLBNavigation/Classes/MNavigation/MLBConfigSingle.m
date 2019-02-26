//
//  MLBConfigSingle.m
//  MLBNavigation
//
//  Created by Mac on 2019/2/26.
//

#import "MLBConfigSingle.h"

@implementation MLBConfigSingle

static id shared = nil;

+ (MLBConfigSingle *)single
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
