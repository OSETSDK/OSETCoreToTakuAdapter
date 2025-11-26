//
//  OSETSplashCustomEvent.m
//  YhsADSProject
//
//  Created by Shens on 20/3/2025.
//

#import "OSETSplashCustomEvent.h"

@implementation OSETSplashCustomEvent


#pragma mark - OSETSplashAdDelegate

/// 开屏加载成功
/// @param splashAd 开屏实例
/// @param slotId 广告位ID
- (void)splashDidReceiveSuccess:(id)splashAd slotId:(NSString *)slotId{
    NSDictionary * extraDic;
    if([splashAd isKindOfClass:[OSETSplashAd class]]){
        OSETSplashAd * s = splashAd;
        extraDic = [OSETCustomBaseAdapter getC2SInfo:s.eCPM];
    }else{
        extraDic = [OSETCustomBaseAdapter getC2SInfo:0];
    }
    [self.adStatusBridge atOnSplashAdLoadedExtra:extraDic];

}

/// 开屏加载失败
- (void)splashLoadToFailed:(id)splashAd error:(NSError *)error{
    [self.adStatusBridge atOnAdLoadFailed:error adExtra:nil];
}
/// 开屏点击
- (void)splashDidClick:(id)splashAd{
    [self.adStatusBridge atOnAdClick:nil];
}
/// 开屏关闭
- (void)splashDidClose:(id)splashAd{
    [self.adStatusBridge atOnAdClosed:nil];
}
/// 开屏将要关闭
- (void)splashWillClose:(id)splashAd{
    [self.adStatusBridge atOnAdWillClosed:nil];
}
- (void)splashAdExposured:(id)splashAd{
    [self.adStatusBridge atOnAdShow:nil];
}
- (void)splashAdExposuredToFailed:(id)splashAd error:(NSError *)error{
    [self.adStatusBridge atOnAdShowFailed:error extra:nil];
}
//关闭广告详情页（落地页）
- (void)splashCloseTarget:(id)splashAd{
    [self.adStatusBridge atOnAdDetailClosed:nil];
}
@end
