//
//  OSETNativeCustomRenderer.h
//  YhsADSProject
//
//  Created by Shens on 24/3/2025.
//
#import <Foundation/Foundation.h>
#import "OSETCustomAdapterCommonHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface OSETNativeCustomRenderer : ATCustomNetworkNativeAd

@property (nonatomic, strong) OSETNativeAd *feedAdModel;
@property (nonatomic, strong) OSETNativeDataAd *feedDataAdModel;
@property (nonatomic, strong) OSETNativeDataAdObject * dataAdObject;
@property (nonatomic, strong) OSETNativeAdRenderer *renderer;

@end

NS_ASSUME_NONNULL_END
