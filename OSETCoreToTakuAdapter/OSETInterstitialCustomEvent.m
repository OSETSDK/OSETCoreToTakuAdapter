//
//  OSETInterstitialCustomEvent.m
//  YhsADSProject
//
//  Created by Shens on 21/3/2025.
//

#import "OSETInterstitialCustomEvent.h"

@implementation OSETInterstitialCustomEvent


- (void)interstitialDidReceiveSuccess:(nonnull id)interstitialAd slotId:(nonnull NSString *)slotId {
    NSDictionary * extraDic;
    if([interstitialAd isKindOfClass:[OSETInterstitialAd class]]){
        OSETInterstitialAd * i = interstitialAd;
        extraDic = [OSETCustomBaseAdapter getC2SInfo:i.eCPM];
    }else{
        extraDic = [OSETCustomBaseAdapter getC2SInfo:0];
    }
//    //自定义参数
//    [extraDic setValue:@"dwadaw" forKey:@"dawdaw"];
//    //传入自定义参数
//    [self.adStatusBridge setNetworkCustomInfo:extraDic];
    [self.adStatusBridge atOnInterstitialAdLoadedExtra:extraDic];
}

- (void)interstitialLoadToFailed:(nonnull id)interstitialAd error:(nonnull NSError *)error {
    [self.adStatusBridge atOnAdLoadFailed:error adExtra:nil];
}

- (void)interstitialDidClick:(nonnull id)interstitialAd {
    [self.adStatusBridge atOnAdClick:nil];
}

- (void)interstitialDidClose:(nonnull id)interstitialAd {
    [self.adStatusBridge atOnAdClosed:nil];
}
- (void)interstitialExposured:(id)interstitialAd{
    [self.adStatusBridge atOnAdShow:nil];
}
@end
