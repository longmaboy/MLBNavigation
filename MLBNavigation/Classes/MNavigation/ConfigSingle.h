//
//  ConfigSingle.h
//  MLBNavigation
//
//  Created by Mac on 2019/2/25.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConfigSingle : NSObject

+ (ConfigSingle *)single;

@property (nonatomic, strong) MConfig *config;

@end

NS_ASSUME_NONNULL_END
