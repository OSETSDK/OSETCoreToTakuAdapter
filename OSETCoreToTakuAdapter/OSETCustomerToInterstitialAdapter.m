//
//  OSETCustomerToInterstitialAdapter.m
//  YhsADSProject
//
//  Created by Shens on 20/3/2025.
//

#import "OSETCustomerToInterstitialAdapter.h"
#import "OSETInterstitialCustomEvent.h"

@interface OSETCustomerToInterstitialAdapter ()
@property (nonatomic, strong) OSETInterstitialCustomEvent *customEvent;
@property (nonatomic, strong) OSETInterstitialAd *interstitialAd;

@end

@implementation OSETCustomerToInterstitialAdapter


#pragma mark - Ad load
- (void)loadADWithArgument:(ATAdMediationArgument *)argument {
    
    self.interstitialAd = [[OSETInterstitialAd alloc] initWithSlotId:argument.serverContentDic[@"unit_id"]];
    self.interstitialAd.delegate = self.customEvent;
    [self.interstitialAd loadInterstitialAdData];
}
 
#pragma mark - Ad show
- (void)showInterstitialInViewController:(UIViewController *)viewController {
    [self.interstitialAd showInterstitialFromRootViewController:viewController];
}
 
#pragma mark - Ad ready
- (BOOL)adReadyInterstitialWithInfo:(NSDictionary *)info {
    return self.interstitialAd.isAdValid;
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
    [ATAdLogger logMessage:[NSString stringWithFormat:@"DemoCustomInterstitialAdapter sendWin"] type:ATLogTypeExternal];
    
//    NSMutableDictionary *infoDic = [DemoCustomBaseAdapter getWinInfoResult:result];
//    [self.interstitialAd sendWinNotificationWithInfo:infoDic];
}

- (void)sendLoss:(ATBidWinLossResult *)result {
   [ATAdLogger logMessage:[NSString stringWithFormat:@"DemoCustomInterstitialAdapter sendLoss"] type:ATLogTypeExternal];
//    NSString *priceStr = [self.interstitialAd mediaExt][@"ecpm"];
//    
//    NSMutableDictionary *infoDict = [DemoCustomBaseAdapter getLossInfoResult:result];
//    [infoDict AT_setDictValue:priceStr key:kMSAdMediaWinPrice];
//    [self.interstitialAd sendLossNotificationWithInfo:infoDict];
}

#pragma mark - lazy
- (OSETInterstitialCustomEvent *)customEvent{
    if (_customEvent == nil) {
        _customEvent = [[OSETInterstitialCustomEvent alloc] init];
        _customEvent.adStatusBridge = self.adStatusBridge;
    }
    return _customEvent;
}

@end
