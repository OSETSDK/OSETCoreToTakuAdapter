//
//  OSETCustomerToNativeAdapter.m
//  YhsADSProject
//
//  Created by Shens on 20/3/2025.
//

#import "OSETCustomerToNativeAdapter.h"
#import "OSETNativeCustomEvent.h"
#import "OSETNativeCustomRenderer.h"


@interface OSETCustomerToNativeAdapter ()<OSETNativeAdDelegate>

@property (nonatomic, strong) OSETNativeCustomEvent *customEvent;
@property (nonatomic, strong) OSETNativeAd *nativeAd;

@end


@implementation OSETCustomerToNativeAdapter

#pragma mark - init
- (void)loadADWithArgument:(ATAdMediationArgument *)argument {
   
    dispatch_async(dispatch_get_main_queue(), ^{
        CGSize size;
        if ([argument.localInfoDic[kATExtraInfoNativeAdSizeKey] respondsToSelector:@selector(CGSizeValue)]) {
            size = [argument.localInfoDic[kATExtraInfoNativeAdSizeKey] CGSizeValue];
        }
        UIViewController *rootVC = argument.viewController;
        if (rootVC == nil) {
            rootVC = [ATGeneralManage getCurrentViewControllerWithWindow:nil];
        }
        self.nativeAd = [[OSETNativeAd alloc]initWithSlotId:argument.serverContentDic[@"unit_id"] size:size rootViewController:rootVC];
        self.nativeAd.delegate = self.customEvent;
        [self.nativeAd loadAdData];

    });
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
//    NSMutableDictionary *infoDict = [DemoCustomBaseAdapter getWinInfoResult:result];
    
//    NSString *priceStr = [self.nativeExpressAd mediaExt][@"ecpm"];
//    [infoDict AT_setDictValue:priceStr key:kMSAdMediaWinPrice];
//    [self.nativeExpressAd sendWinNotificationWithInfo:infoDict];
}

- (void)sendLoss:(ATBidWinLossResult *)result {
//    NSMutableDictionary *infoDic = [DemoCustomBaseAdapter getLossInfoResult:result];
//    [self.nativeExpressAd sendLossNotificationWithInfo:infoDic];
}
 
#pragma mark - lazy
- (OSETNativeCustomEvent *)customEvent{
    if (_customEvent == nil) {
        _customEvent = [[OSETNativeCustomEvent alloc] init];
        _customEvent.adStatusBridge = self.adStatusBridge;
    }
    return _customEvent;
}



@end
