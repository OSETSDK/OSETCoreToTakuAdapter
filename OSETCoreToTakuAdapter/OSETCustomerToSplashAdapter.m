//
//  OSETCustomerToSplashAdapter.m
//  YhsADSProject
//
//  Created by Shens on 20/3/2025.
//

#import "OSETCustomerToSplashAdapter.h"
#import "OSETSplashCustomEvent.h"




#import <OSETSDK/OSETSDK.h>
@interface OSETCustomerToSplashAdapter ()
@property (nonatomic, strong) OSETSplashCustomEvent *customEvent;
@property (nonatomic, strong) OSETSplashAd *splashAd;

@end
@implementation OSETCustomerToSplashAdapter
#pragma mark - load Ad
- (void)loadADWithArgument:(ATAdMediationArgument *)argument {
    self.splashAd = [[OSETSplashAd alloc] initWithSlotId:argument.serverContentDic[@"unit_id"] window:nil bottomView:self.containerView];
    self.splashAd.delegate = self.customEvent;
    [self.splashAd loadSplashAd];
}
// Ad ready
- (BOOL)adReadySplashWithInfo:(NSDictionary *)info {
    return self.splashAd.isAdValid;
}
// Ad show
- (void)showSplashAdInWindow:(UIWindow *)window inViewController:(UIViewController *)inViewController parameter:(NSDictionary *)parameter {
    if(window){
        self.splashAd.window = window;
    }else if(inViewController){
        self.splashAd.window = inViewController.view.window;
    }
    
    [self.splashAd showSplashAd];
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
    [ATAdLogger logMessage:[NSString stringWithFormat:@"OSETCustomSplashAdapter sendWin"] type:ATLogTypeExternal];
//    NSMutableDictionary *infoDic = [OSETCustomBaseAdapter getWinInfoResult:result];
//    [self.splashAd sendWinNotificationWithInfo:infoDic];
}

- (void)sendLoss:(ATBidWinLossResult *)result {
   [ATAdLogger logMessage:[NSString stringWithFormat:@"OSETCustomSplashAdapter sendLoss"] type:ATLogTypeExternal];
//    NSString *priceStr = [self.splashAd mediaExt][@"ecpm"];
//    NSMutableDictionary *infoDict = [OSETCustomBaseAdapter getLossInfoResult:result];
//    [infoDict AT_setDictValue:priceStr key:kMSAdMediaWinPrice];
//    [self.splashAd sendLossNotificationWithInfo:infoDict];
}

#pragma mark - lazy
- (OSETSplashCustomEvent *)customEvent {
    if (_customEvent == nil) {
        _customEvent = [[OSETSplashCustomEvent alloc] init];
        _customEvent.adStatusBridge = self.adStatusBridge;
    }
    return _customEvent;
}

@end
