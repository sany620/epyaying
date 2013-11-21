//
//  Go2PageUtility.h
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPBaseViewController.h"

@interface Go2PageUtility : NSObject

//新西兰速递
+(void)go2NewZealandViewController:(UIViewController*)l_viewCtrl;

//产品介绍
+(void)go2ProductInfoListViewController:(UIViewController*)l_viewCtrl;

//繁花视觉
+(void)go2ScanFlowerViewController:(UIViewController*)l_viewCtrl;

//寻花觅宝
+(void)go2ScanShopViewController:(UIViewController*)l_viewCtrl;

//设置
+(void)go2SettingViewController:(UIViewController*)l_viewCtrl;

//产品详情
+(void)go2ProductDetailInfoController:(UIViewController *)l_viewCtrl detaildict:(NSDictionary *)detaildict;

//微博分享
+(void)go2WeiboShareViewController:(UIViewController *)l_viewCtrl;

//绑定微博
+(void)go2SettingWeiboViewController:(UIViewController *)l_viewCtrl weiboname:(NSString *)weiboname;

@end
