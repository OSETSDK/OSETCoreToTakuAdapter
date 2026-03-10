//
//  OSETNativeCustomRenderer.m
//  YhsADSProject
//
//  Created by Shens on 24/3/2025.
//

#import "OSETNativeCustomRenderer.h"
#import "OSETNativeCustomEvent.h"
@interface OSETNativeCustomRenderer()
@property (nonatomic, strong) ATNativeAdRenderConfig *configuration;
@property (nonatomic, weak) OSETNativeCustomEvent * customEvent;
@end
@implementation OSETNativeCustomRenderer



#pragma mark - 推荐实现，释放资源
- (void)dealloc {
}

#pragma mark - 必须实现，获取配置并设置给自定义广告平台 SDK
- (void)setNativeADConfiguration:(ATNativeAdRenderConfig *)configuration {
    self.configuration = configuration;
}

#pragma mark - 必须实现，根据渲染类型注册容器
- (void)registerClickableViews:(NSArray<UIView *> *)clickableViews withContainer:(UIView *)container registerArgument:(ATNativeRegisterArgument *)registerArgument {
     
    if (self.nativeAdRenderType == ATNativeAdRenderExpress) {
        [self templateRender];
        return;
    }
    [self slefRenderRenderClickableViews:clickableViews withContainer:container registerArgument:registerArgument];
}
#pragma mark - 模板
- (void)templateRender {
    UIViewController *rootVC = self.configuration.rootViewController;
    if (rootVC == nil) {
        rootVC = [ATGeneralManage getCurrentViewControllerWithWindow:nil];
    }
    self.feedAdModel.viewController = rootVC;
}
#pragma mark - 自渲染
- (void)slefRenderRenderClickableViews:(NSArray<UIView *> *)clickableViews withContainer:(UIView *)container registerArgument:(ATNativeRegisterArgument *)registerArgument {
    
    UIViewController *rootVC = self.configuration.rootViewController;
    if (rootVC == nil) {
        rootVC = [ATGeneralManage getCurrentViewControllerWithWindow:nil];
    }
    self.feedDataAdModel.viewController = rootVC;
    [self.renderer registerContainerView:container withDataObject:self.dataAdObject];
    [self.renderer registerClickableViews:clickableViews];
    [self.renderer registerCloseView:registerArgument.dislikeButton];
    
//    [self.feedAdMetaad setMetaLogoFrame:self.configuration.logoViewFrame];
//    
//    if ([self getMSFeedVideoView] && self.feedAdMetaad) {
//        [[self getMSFeedVideoView] registerDataObject:self.feedAdMetaad
//                            clickableViews:clickableViews];
//    }
//    
//    [self.feedAdMetaad attachAd:container renderViews:container.subviews clickView:clickableViews closeView:registerArgument.dislikeButton presentVc:rootVC];
}

//- (MSFeedVideoView *)getMSFeedVideoView {
//    return (MSFeedVideoView *)self.mediaView;
//}

@end
