//
//  OSETCustomInitAdapter.m
//  OSETATADemo
//
//  Created by Shens on 25/11/2025.
//

#import "OSETCustomInitAdapter.h"

@implementation OSETCustomInitAdapter

/// Init Ad SDK
/// - Parameter adInitArgument: server info
- (void)initWithInitArgument:(ATAdInitArgument *)adInitArgument {
   dispatch_async(dispatch_get_main_queue(), ^{
       //Get dashboard setting params in serverContentDic
       NSString * appId = adInitArgument.serverContentDic[@"app_id"];
       if(appId && appId.length == 16){
           [OSETManager openDebugLog];
           [OSETManager configure:adInitArgument.serverContentDic[@"app_id"]];
           [self notificationNetworkInitSuccess];
       }else{
           NSError *error = [NSError errorWithDomain:@"DemoCustomInitAdapter init fail" code:-1 userInfo:@{}];
           [self notificationNetworkInitFail:error];
       }
   });
}

#pragma mark - version
- (nullable NSString *)sdkVersion {
   return [OSETManager version];
}

- (nullable NSString *)adapterVersion {
   return @"6.6.0.0";
}
@end
