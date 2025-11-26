//
//  OSETNativeCustomEvent.m
//  YhsADSProject
//
//  Created by Shens on 21/3/2025.
//

#import "OSETNativeCustomEvent.h"
#import "OSETNativeCustomRenderer.h"

@interface OSETNativeCustomEvent()

@property (nonatomic, strong) OSETNativeAd *nativeFeedAd;

@end

@implementation OSETNativeCustomEvent


- (void)nativeExpressAdLoadSuccessWithNative:(id)native nativeExpressViews:(NSArray *)nativeExpressViews{
    self.nativeFeedAd = native;
    if(nativeExpressViews &&  nativeExpressViews.count > 0){
        OSETBaseView * view =nativeExpressViews.firstObject;
        NSMutableArray *offerArray = [NSMutableArray array];
        NSDictionary *infoDic = [OSETCustomBaseAdapter getC2SInfo:view.eCPM];
        [nativeExpressViews enumerateObjectsUsingBlock:^(OSETBaseView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIView *nativeAdView = obj;
            OSETNativeCustomRenderer *nativeObject = [[OSETNativeCustomRenderer alloc] init];
            nativeObject.feedAdModel = self.nativeFeedAd;
            nativeObject.templateView = nativeAdView;
            nativeObject.nativeAdRenderType = ATNativeAdRenderExpress;
            nativeObject.nativeExpressAdViewWidth = nativeAdView.frame.size.width;
            nativeObject.nativeExpressAdViewHeight = nativeAdView.frame.size.height;
            [offerArray addObject:nativeObject];
        }];
        [self.adStatusBridge atOnNativeAdLoadedArray:offerArray adExtra:infoDic];
    }
}


- (void)nativeExpressAdFailedToLoad:(nonnull id)nativeExpressAd error:(nonnull NSError *)error {
    [self.adStatusBridge atOnAdLoadFailed:error adExtra:nil];
}
- (void)nativeExpressAdFailedToRender:(nonnull id)nativeExpressView {
    NSLog(@"nativeExpressAdFailedToRender");
}
- (void)nativeExpressAdDidClick:(nonnull id)nativeExpressView {
    [self.adStatusBridge atOnAdClick:nil];
}
- (void)nativeExpressAdDidClose:(nonnull id)nativeExpressView {
    [self.adStatusBridge atOnAdClosed:nil];
}
@end
