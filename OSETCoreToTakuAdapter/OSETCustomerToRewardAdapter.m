//
//  OSETCustomerToRewardAdapter.m
//  YhsADSProject
//
//  Created by Shens on 20/3/2025.
//

#import "OSETCustomerToRewardAdapter.h"
#import "OSETRewardedVideoCustomEvent.h"

@interface OSETCustomerToRewardAdapter ()
@property (nonatomic, strong) OSETRewardedVideoCustomEvent *customEvent;
@property (nonatomic, strong) OSETRewardVideoAd *rewardAd;

@end
@implementation OSETCustomerToRewardAdapter

#pragma mark - Ad load
- (void)loadADWithArgument:(ATAdMediationArgument *)argument {
    
   self.rewardAd = [[OSETRewardVideoAd alloc] initWithSlotId:argument.serverContentDic[@"unit_id"] withUserId:argument.localInfoDic[kATAdLoadingExtraUserIDKey]];
   self.rewardAd.delegate = self.customEvent;
   [self.rewardAd loadRewardAdData];
}

#pragma mark - Ad show
- (void)showRewardedVideoInViewController:(UIViewController *)viewController {
   [self.rewardAd showRewardFromRootViewController:viewController];
}

#pragma mark - Ad ready
- (BOOL)adReadyRewardedWithInfo:(NSDictionary *)info {
   return self.rewardAd.isAdValid;
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
   [ATAdLogger logMessage:[NSString stringWithFormat:@"DemoCustomRewardVideoAdapter sendWin"] type:ATLogTypeExternal];
   
//   NSMutableDictionary *infoDic = [DemoCustomBaseAdapter getWinInfoResult:result];
//   [self.rewardAd sendWinNotificationWithInfo:infoDic];
}

- (void)sendLoss:(ATBidWinLossResult *)result {
  [ATAdLogger logMessage:[NSString stringWithFormat:@"DemoCustomRewardVideoAdapter sendLoss"] type:ATLogTypeExternal];
//   NSString *priceStr = [self.rewardAd mediaExt][@"ecpm"];
//   
//   NSMutableDictionary *infoDict = [DemoCustomBaseAdapter getLossInfoResult:result];
//   [infoDict AT_setDictValue:priceStr key:kMSAdMediaWinPrice];
//   [self.rewardAd sendLossNotificationWithInfo:infoDict];
}
#pragma mark - lazy
- (OSETRewardedVideoCustomEvent *)customEvent{
   if (_customEvent == nil) {
       _customEvent = [[OSETRewardedVideoCustomEvent alloc] init];
       _customEvent.adStatusBridge = self.adStatusBridge;
   }
   return _customEvent;
}

@end
