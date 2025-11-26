//
//  OSETCustomBaseAdapter.h
//  OSETATADemo
//
//  Created by Shens on 25/11/2025.
//

#import <Foundation/Foundation.h>
#import "OSETCustomAdapterCommonHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSETCustomBaseAdapter : ATBaseMediationAdapter

//C2S flow needed
+ (NSMutableDictionary *)getLossInfoResult:(ATBidWinLossResult *)winLossResult;

//C2S flow needed
+ (NSMutableDictionary *)getWinInfoResult:(ATBidWinLossResult *)winLossResult;

//C2S flow needed
+ (NSMutableDictionary *)getC2SInfo:(NSInteger)ecpm;
@end

NS_ASSUME_NONNULL_END
