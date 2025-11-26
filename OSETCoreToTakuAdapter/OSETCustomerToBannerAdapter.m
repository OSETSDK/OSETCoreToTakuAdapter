//
//  OSETCustomerToBannerAdapter.m
//  OSETATADemo
//
//  Created by Shens on 26/11/2025.
//

#import "OSETCustomerToBannerAdapter.h"
#import "OSETBannerCustomEvent.h"

@interface OSETCustomerToBannerAdapter()

@property (nonatomic, strong) OSETBannerCustomEvent * bannerDelegate;

@property (nonatomic, strong) OSETBannerAd * bannerAd;

@end

@implementation OSETCustomerToBannerAdapter

#pragma mark - Ad load
- (void)loadADWithArgument:(ATAdMediationArgument *)argument {
    dispatch_async(dispatch_get_main_queue(), ^{
        CGSize bannerSize = CGSizeMake(320, 50);
        if (!CGSizeEqualToSize(argument.bannerSize, CGSizeZero)) {
            bannerSize = argument.bannerSize;
        }
        self.bannerAd = [[OSETBannerAd alloc] initWithSlotId:argument.serverContentDic[@"unit_id"] rootViewController:argument.viewController rect:CGRectMake(0, 0, bannerSize.width, bannerSize.height)];
        self.bannerAd.delegate  = self.bannerDelegate;
        [self.bannerAd loadAdData];
    });
}

#pragma mark - lazy
- (OSETBannerCustomEvent *)bannerDelegate{
    if (_bannerDelegate == nil) {
        _bannerDelegate = [[OSETBannerCustomEvent alloc] init];
        _bannerDelegate.adStatusBridge = self.adStatusBridge;
    }
    return _bannerDelegate;
}
 
#pragma mark - C2S Win Loss
- (void)didReceiveBidResult:(ATBidWinLossResult *)result {
    if (result.bidResultType == ATBidWinLossResultTypeWin) {
        [self sendWin:result];
        return;
    }
    [self sendLoss:result];
}
 
- (void)sendWin:(ATBidWinLossResult *)result {
    [ATAdLogger logMessage:[NSString stringWithFormat:@"DemoCustomBannerAdapter sendWin"] type:ATLogTypeExternal];
    
}

- (void)sendLoss:(ATBidWinLossResult *)result {
   [ATAdLogger logMessage:[NSString stringWithFormat:@"DemoCustomBannerAdapter sendLoss"] type:ATLogTypeExternal];
}
@end
