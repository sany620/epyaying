//
//  Go2PageUtility.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "Go2PageUtility.h"
#import "EPNewZealandCourierViewController.h"
#import "EPProductInfoViewController.h"
#import "EPScanFlowerViewController.h"
#import "EPScanShopViewController.h"
#import "EPSettingViewController.h"
#import "EPProductDetailInfoViewController.h"
#import "EPWeiboShareViewController.h"
#import "EPSettingWeiboViewController.h"

@implementation Go2PageUtility
//新西兰速递
+(void)go2NewZealandViewController:(EPBaseViewController*)l_viewCtrl{
    EPNewZealandCourierViewController *l_viewCtrl_newZealand=[[EPNewZealandCourierViewController alloc] initWithNibName:@"EPNewZealandCourierViewController" bundle:nil];
    [l_viewCtrl.navigationController pushViewController:l_viewCtrl_newZealand animated:YES];
    [l_viewCtrl_newZealand release];
}

//产品介绍
+(void)go2ProductInfoListViewController:(EPBaseViewController*)l_viewCtrl{
    EPProductInfoViewController *l_viewCtrl_productList=[[EPProductInfoViewController alloc] initWithNibName:@"EPProductInfoViewController" bundle:nil];
    [l_viewCtrl.navigationController pushViewController:l_viewCtrl_productList animated:YES];
    [l_viewCtrl_productList release];
}

//繁花视觉
+(void)go2ScanFlowerViewController:(EPBaseViewController*)l_viewCtrl{
    EPScanFlowerViewController *l_viewCtrl_scanFlower=[[EPScanFlowerViewController alloc] initWithNibName:@"EPScanFlowerViewController" bundle:nil];
    [l_viewCtrl.navigationController pushViewController:l_viewCtrl_scanFlower animated:YES];
    [l_viewCtrl_scanFlower release];
}

//寻花觅宝
+(void)go2ScanShopViewController:(EPBaseViewController*)l_viewCtrl{
    EPScanShopViewController *l_viewCtrl_scanShop=[[EPScanShopViewController alloc] initWithNibName:@"EPScanShopViewController" bundle:nil];
    [l_viewCtrl.navigationController pushViewController:l_viewCtrl_scanShop animated:YES];
    [l_viewCtrl_scanShop release];
}

//设置
+(void)go2SettingViewController:(EPBaseViewController*)l_viewCtrl{
    EPSettingViewController *l_viewCtrl_setting=[[EPSettingViewController alloc] initWithNibName:@"EPSettingViewController" bundle:nil];
    [l_viewCtrl.navigationController pushViewController:l_viewCtrl_setting animated:YES];
    [l_viewCtrl_setting release];
}

//产品详情
+(void)go2ProductDetailInfoController:(UIViewController *)l_viewCtrl detaildict:(NSDictionary *)detaildict{
    EPProductDetailInfoViewController *infovc = [[EPProductDetailInfoViewController alloc] init];
    infovc.detaildict = detaildict;
    [l_viewCtrl.navigationController pushViewController:infovc animated:YES];
    [infovc release];
}

//微博分享
+(void)go2WeiboShareViewController:(UIViewController *)l_viewCtrl{
    EPWeiboShareViewController *epweibovc = [[EPWeiboShareViewController alloc] init];
    [l_viewCtrl.navigationController pushViewController:epweibovc animated:YES];
    [epweibovc release];
}

//绑定微博
+(void)go2SettingWeiboViewController:(UIViewController *)l_viewCtrl weiboname:(NSString *)weiboname{
    EPSettingWeiboViewController *epswbc = [[EPSettingWeiboViewController alloc] init];
    epswbc.weiboname = weiboname;
    [l_viewCtrl.navigationController pushViewController:epswbc animated:YES];
    [epswbc release];
}

@end
