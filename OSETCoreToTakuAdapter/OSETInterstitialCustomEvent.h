//
//  OSETInterstitialCustomEvent.h
//  YhsADSProject
//
//  Created by Shens on 21/3/2025.
//

#import <UIKit/UIKit.h>
#import "OSETCustomAdapterCommonHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSETInterstitialCustomEvent : NSObject<OSETInterstitialAdDelegate>

@property (nonatomic, strong) ATInterstitialAdStatusBridge * adStatusBridge;
@end

NS_ASSUME_NONNULL_END
