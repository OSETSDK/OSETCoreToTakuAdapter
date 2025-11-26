//
//  OSETNativeCustomEvent.h
//  YhsADSProject
//
//  Created by Shens on 21/3/2025.
//

#import <UIKit/UIKit.h>
#import "OSETCustomAdapterCommonHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface OSETNativeCustomEvent :NSObject<OSETNativeAdDelegate>

@property (nonatomic,strong) ATNativeAdStatusBridge *adStatusBridge;

@property (nonatomic, strong) ATAdMediationArgument *adMediationArgument;

@end

NS_ASSUME_NONNULL_END
