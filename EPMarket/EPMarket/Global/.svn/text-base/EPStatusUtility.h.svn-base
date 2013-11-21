//
//  EPStatusUtility.h
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EPStatusUtility : NSObject

+(CGFloat)getNavigationBarHeight;//返回导航栏高度

+(CGFloat)getTabBarHeight;//返回tabbar高度

+(CGFloat)getShowViewHeight;//返回可显示区域的高度

+ (void)showAlert:(NSString *)aTitle message:(NSString *)aMessage delegate:(id<UIAlertViewDelegate>)aDelegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;//显示alert

/**
 *	@brief	判断是否有网络
 *	@return	
 */
+(BOOL)isNetworkReachable;

/**
 *	@brief 判断请求JSON是否成功
 *	失败时通知请求失败
 */
+(BOOL)isRequestJSONSuccess:(NSDictionary*)jsonDict;

/**
 *	@brief 判断请求JSON是否成功
 *	失败时通知请求失败
 */
+(BOOL)isRequestNoAlertJSONSuccess:(NSDictionary*)jsonDict;

/**
 *	@brief	返回image的网络地址
 *	
 *	image的网络地址
 *
 *	@param 	l_str_path 	image的相对地址
 *
 *	@return	image的网络地址
 */
+(NSURL*)createImageURLWithPath:(NSString*)l_str_path;

@end
