//
//  CHCViewController.h
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPBaseViewController.h"

typedef enum{
    NewZealandCourier=1,
    ProductInfo=2,
    ScanFlower=3,
    ScanShop=4,
    Setting=5
}MenuListName;

@interface CHCViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIView *m_view_splash;
@property (retain, nonatomic) IBOutlet UIImageView *m_imgV_start01;
@property (retain, nonatomic) IBOutlet UIImageView *m_imgV_start02;
@property (retain, nonatomic) IBOutlet UIImageView *m_imgV_start03;
@property (retain, nonatomic) IBOutlet UIImageView *m_imgV_startBg;

/**
 *	@brief	菜单事件
 *	
 *	五个按钮事件
 *
 *	@param 	sender 	按钮
 */
- (IBAction)onButtonActionMenu:(id)sender;


/**
 *	@brief	启动动画
 *	
 *	启动动画
 */
- (void)displaySplashView;


@end
