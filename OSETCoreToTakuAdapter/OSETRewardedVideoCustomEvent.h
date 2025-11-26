//
//  OSETRewardedVideoCustomEvent.h
//  YhsADSProject
//
//  Created by Shens on 21/3/2025.
//

#import <UIKit/UIKit.h>
#import "OSETCustomAdapterCommonHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface OSETRewardedVideoCustomEvent :  NSObject<OSETRewardVideoAdDelegate>

@property (nonatomic, strong) ATRewardedAdStatusBridge * adStatusBridge;

@end

NS_ASSUME_NONNULL_END
