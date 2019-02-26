//
//  MLBConfigSingle.h
//  MLBNavigation
//
//  Created by Mac on 2019/2/26.
//

#import <Foundation/Foundation.h>
#import "MLBConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLBConfigSingle : NSObject

+ (MLBConfigSingle *)single;

@property (nonatomic, strong) MLBConfig *config;

@end

NS_ASSUME_NONNULL_END
