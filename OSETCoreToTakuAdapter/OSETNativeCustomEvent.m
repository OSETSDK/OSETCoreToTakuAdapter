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

-(void)nativeExpressAdDidExposured:(id)nativeExpressView{
    [self.adStatusBridge atOnAdShow:nil];
}


/// 信息流加载成功
/// @param nativeDataObjects 信息流广告data数组
- (void)nativeDataAdLoadSuccessWithNative:(id)nativeDataAd nativeDataObjects:(NSArray<OSETNativeDataAdObject *> * _Nullable)nativeDataObjects{
//    self.nativeFeedAd = native;
    if(nativeDataObjects &&  nativeDataObjects.count > 0){
        OSETNativeDataAdObject * nativeAdData =nativeDataObjects.firstObject;
        NSMutableArray *offerArray = [NSMutableArray array];
        NSDictionary *infoDic = [OSETCustomBaseAdapter getC2SInfo:nativeAdData.eCPM];
        OSETNativeCustomRenderer *nativeObject = [[OSETNativeCustomRenderer alloc] init];
        nativeObject.renderer= [[OSETNativeAdRenderer alloc]init];
        nativeObject.renderer.delegate = self;
        nativeObject.dataAdObject = nativeAdData;
        nativeObject.feedDataAdModel = nativeDataAd;
        nativeObject.nativeAdRenderType = ATNativeAdRenderSelfRender;
        nativeObject.title = nativeAdData.title;
        nativeObject.mainText = nativeAdData.desc;
        if(nativeAdData.buttonText && [nativeAdData.buttonText isKindOfClass:[NSString class]] && nativeAdData.buttonText.length > 0){
            nativeObject.ctaText = nativeAdData.buttonText;
        }else{
            nativeObject.ctaText = @"查看详情";
        }
        nativeObject.appPrice = [NSString stringWithFormat:@"%ld",(long)nativeAdData.eCPM];
        nativeObject.logoUrl = nativeAdData.adIconUrl;
        nativeObject.iconUrl = nativeAdData.appIconUrl;
        if(nativeAdData.imageList && nativeAdData.imageList.count > 0 && nativeAdData.imageList.firstObject[@"url"]){
            nativeObject.imageUrl = nativeAdData.imageList.firstObject[@"url"];
            nativeObject.imageList = @[nativeObject.imageUrl];
        }else{
            nativeObject.imageUrl = nativeAdData.appIconUrl;
        }
        //根据自定义广告平台SDK素材类型，设置是否是视频素材
        if (nativeAdData.isVideoAd) {
            //设置为视频素材
            nativeObject.isVideoContents = YES;
            nativeObject.mediaView = nativeObject.renderer.mediaView;
        }
        
        [offerArray addObject:nativeObject];
        [self.adStatusBridge atOnNativeAdLoadedArray:offerArray adExtra:infoDic];
    }
}

/// 加载失败
/// @param nativeDataAd 信息流实例
/// @param error 错误信息
- (void)nativeDataAdFailedToLoad:(id)nativeDataAd error:(NSError *)error{
    [self.adStatusBridge atOnAdLoadFailed:error adExtra:nil];
}

/**
 广告曝光回调
 */
- (void)OSETNativeAdRendererWillExpose:(OSETNativeAdRenderer *)renderer{
    [self.adStatusBridge atOnAdShow:nil];

}

/**
 广告点击回调
 */
- (void)OSETNativeAdRendererDidClick:(OSETNativeAdRenderer *)renderer{
    [self.adStatusBridge atOnAdClick:nil];
}

/**
 广告关闭回调
 */
- (void)OSETNativeAdRendererDidClose:(OSETNativeAdRenderer *)renderer{
    [self.adStatusBridge atOnAdClosed:nil];

}

/**
 广告详情页关闭回调
 */
- (void)OSETNativeAdRendererDetailViewClosed:(OSETNativeAdRenderer *)renderer{
    
}


@end
