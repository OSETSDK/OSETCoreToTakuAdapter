//
//  OSETCustomerToSplashAdapter.h
//  YhsADSProject
//
//  Created by Shens on 20/3/2025.
//

#import <Foundation/Foundation.h>
#import "OSETCustomAdapterCommonHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSETCustomerToSplashAdapter :OSETCustomBaseAdapter<ATBaseSplashAdapterProtocol>
@property (nonatomic, strong) UIView * containerView;

@end

NS_ASSUME_NONNULL_END

