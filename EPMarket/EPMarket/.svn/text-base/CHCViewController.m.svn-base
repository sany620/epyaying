//
//  CHCViewController.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "CHCViewController.h"
#import "Go2PageUtility.h"

@interface CHCViewController ()

@property BOOL notFristLoad;

@end

@implementation CHCViewController
@synthesize m_view_splash;
@synthesize m_imgV_start01;
@synthesize m_imgV_start02;
@synthesize m_imgV_start03;
@synthesize m_imgV_startBg;
@synthesize notFristLoad;

- (void)dealloc {
    [m_view_splash release];
    [m_imgV_start01 release];
    [m_imgV_start02 release];
    [m_imgV_start03 release];
    [m_imgV_startBg release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self displaySplashView];
}

- (void)viewDidUnload
{
    [self setM_view_splash:nil];
    [self setM_imgV_start01:nil];
    [self setM_imgV_start02:nil];
    [self setM_imgV_start03:nil];
    [self setM_imgV_startBg:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (notFristLoad) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else{
        notFristLoad = YES;
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)onButtonActionMenu:(id)sender {
    UIButton *l_btn_curr=(UIButton*)sender;
    
    switch (l_btn_curr.tag) {
        case NewZealandCourier:{//新西兰速递
            [Go2PageUtility go2NewZealandViewController:self];
            break;
        }
        case ProductInfo:{//产品介绍
            [Go2PageUtility go2ProductInfoListViewController:self];
            break;
        }
        case ScanFlower:{//繁花视觉
            [Go2PageUtility go2ScanFlowerViewController:self];
            break;
        }
        case ScanShop:{//寻花觅宝
            [Go2PageUtility go2ScanShopViewController:self];
            break;
        }
        case Setting:{//设置
            [Go2PageUtility go2SettingViewController:self];
            break;
        }    
        default:
            break;
    }
}

- (void)displaySplashView{
    [self.view addSubview:m_view_splash];
    [self.m_imgV_startBg setAlpha:1];
    [self.m_imgV_start01 setAlpha:0];
    [self.m_imgV_start02 setAlpha:0];
    [self.m_imgV_start03 setAlpha:0];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.m_imgV_startBg setAlpha:1];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            [self.m_imgV_start01 setAlpha:1];
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                [self.m_imgV_start02 setAlpha:1];
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1 animations:^{
                    [self.m_imgV_start03 setAlpha:1];
                    
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1 animations:^{
                        [self.m_view_splash setAlpha:0];
                        
                    } completion:^(BOOL finished) {
                        [self.m_view_splash setHidden:YES];
                    }];
                }];
            }];
        }];
    }];
    
    
}

@end
