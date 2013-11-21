//
//  EPStatusUtility.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPStatusUtility.h"
#import <netinet/in.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/sysctl.h>
#import <SystemConfiguration/SCNetworkReachability.h>
#import "EPResultData.h"

static UIAlertView *_alertView = nil;

@implementation EPStatusUtility
#ifndef CCS_NAVIGATIONBAR_REALHEIGHT
#define CCS_NAVIGATIONBAR_REALHEIGHT 44
#endif

+(CGFloat)getNavigationBarHeight
{
	return CCS_NAVIGATIONBAR_REALHEIGHT;
}

+(CGFloat)getTabBarHeight
{
	return 44;
}

+(CGFloat)getShowViewHeight
{
	return 460.0 - [EPStatusUtility getNavigationBarHeight] - [EPStatusUtility getTabBarHeight];
}

+ (void)showAlert:(NSString *)aTitle message:(NSString *)aMessage delegate:(id<UIAlertViewDelegate>)aDelegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    
    if (_alertView.isVisible) {
        return;
    }
    if (_alertView != nil) {
        [_alertView release],_alertView = nil;
    }
    _alertView = [[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:aDelegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (otherButtonTitles != nil) {
        va_list args;
        va_start(args, otherButtonTitles);
        NSString* arg = nil;
        [_alertView addButtonWithTitle:otherButtonTitles];
        while ( ( arg = va_arg( args, NSString*) ) != nil ) {
            [_alertView addButtonWithTitle:arg];
        }
        va_end(args);
    }
    [_alertView show];
}

/**
 *	@brief	判断是否有网络
 *	@return	
 */
+(BOOL)isNetworkReachable{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection) ? YES : NO;
}

/**
 *	@brief 判断请求JSON是否成功
 *	失败时通知请求失败
 */
+(BOOL)isRequestJSONSuccess:(NSDictionary*)jsonDict{
    
    BOOL isSuccess = YES;
	if (jsonDict==nil) { // 网络错误
        
        if (![[self class] isNetworkReachable]){
            [EPStatusUtility showAlert:DEFAULTTIP_TITLE 
                               message:@"网络连接失败，请确保设备已经连网" 
                              delegate:nil 
                     cancelButtonTitle:@"确定" 
                     otherButtonTitles:nil];
        }else{
            [EPStatusUtility showAlert:DEFAULTTIP_TITLE 
                               message:@"网络连接失败，请稍后再试" 
                              delegate:nil 
                     cancelButtonTitle:@"确定" 
                     otherButtonTitles:nil];
        }
        isSuccess = NO;
	}else{
        EPResultData* _data = [[[EPResultData alloc] init] autorelease];
        
        _data.mstate=[[jsonDict objectForKey:@"state"] stringValue];
        _data.mmessage=[jsonDict objectForKey:@"message"];
        if (![_data.mstate isEqualToString:@"1"]) {
            
            UIAlertView *l_alert=[[UIAlertView alloc] initWithTitle:ERROR_TITLE message:_data.mmessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [l_alert show];
            [l_alert release];

            isSuccess = NO;
        }
    }
	return isSuccess;
}

/**
 *	@brief 判断请求JSON是否成功
 *	失败时通知请求失败
 */
+(BOOL)isRequestNoAlertJSONSuccess:(NSDictionary*)jsonDict{
    
    BOOL isSuccess = YES;
	if (jsonDict==nil) { // 网络错误
        
        isSuccess = NO;
	}else{
//        QMResultData* _data = [[[QMResultData alloc] init] autorelease];
//        
//        _data.mresultCode=[jsonDict objectForKey:@"ResultCode"];
//        _data.mresultMsg=[jsonDict objectForKey:@"ResultMsg"];
//        
//        if (![_data.mresultCode isEqualToString:@"0"]) {
//            isSuccess = NO;
//        }
    }
	return isSuccess;
}

+(NSURL*)createImageURLWithPath:(NSString*)l_str_path{
    
    NSString *l_str_url=[NSString stringWithFormat:@"%@%@",CCS_COMMONURL_PREFIX,l_str_path];
    
    return [NSURL URLWithString:l_str_url];
}
@end
