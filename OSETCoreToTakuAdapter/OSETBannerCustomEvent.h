//
//  OSETBannerCustomEvent.h
//  OSETATADemo
//
//  Created by Shens on 26/11/2025.
//

#import <Foundation/Foundation.h>
#import "OSETCustomAdapterCommonHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSETBannerCustomEvent : NSObject<OSETBannerAdDelegate>

@property (nonatomic, strong) ATBannerAdStatusBridge * adStatusBridge;


@end

NS_ASSUME_NONNULL_END
