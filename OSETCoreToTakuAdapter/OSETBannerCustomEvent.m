//
//  OSETBannerCustomEvent.m
//  OSETATADemo
//
//  Created by Shens on 26/11/2025.
//

#import "OSETBannerCustomEvent.h"

@implementation OSETBannerCustomEvent

- (void)bannerDidReceiveSuccess:(id)bannerView slotId:(NSString *)slotId{
    
    NSDictionary * extraDic;
    if([bannerView isKindOfClass:[OSETBaseView class]]){
        OSETBaseView * b = bannerView;
        extraDic = [OSETCustomBaseAdapter getC2SInfo:b.eCPM];
    }else{
        extraDic = [OSETCustomBaseAdapter getC2SInfo:0];
    }
    [self.adStatusBridge atOnBannerAdLoadedWithView:bannerView adExtra:extraDic];
}
/// banner加载失败
- (void)bannerLoadToFailed:(id)bannerView error:(NSError *)error{
    [self.adStatusBridge atOnAdLoadFailed:error adExtra:nil];
}
- (void)bannerDidClose:(id)bannerView{
    [self.adStatusBridge atOnAdClosed:nil];
    OSETBaseView * banner = bannerView;
    if([bannerView isKindOfClass:[UIView class]]){
        UIView *view = (UIView *)bannerView;
        [view removeFromSuperview];
    }
}
-(void)bannerDidClick:(id)bannerView{
    [self.adStatusBridge atOnAdClick:nil];

}
-(void)dealloc{
}
@end
