//
//  OSETSplashCustomEvent.h
//  YhsADSProject
//
//  Created by Shens on 20/3/2025.
//

#import "OSETCustomAdapterCommonHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSETSplashCustomEvent : NSObject<OSETSplashAdDelegate>
@property (nonatomic, strong) ATSplashAdStatusBridge * adStatusBridge;

@property (nonatomic, strong,nullable) UIView *splashView;

@property (nonatomic, strong,nullable) UIView *containerView;
@end

NS_ASSUME_NONNULL_END
