//
//  EPScanShopSignInViewController.m
//  EPMarket
//
//  Created by Chuang CO.,LTD. Chi on 13-2-20.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPScanShopSignInViewController.h"

@interface EPScanShopSignInViewController ()

@end

@implementation EPScanShopSignInViewController
@synthesize sinaBtn = _sinaBtn;
@synthesize tencentBtn = _tencentBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.customtitle = @"授权登陆";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_sinaBtn release];
    [_tencentBtn release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setSinaBtn:nil];
    [self setTencentBtn:nil];
    [super viewDidUnload];
}
- (IBAction)sinaAuth:(UIButton *)sender
{
    SHSVerificationViewController *vc=[[SHSVerificationViewController alloc] initWithRootViewController:self];
    vc.verificationDelegate = self;
    [vc showVerificationView:@"新浪微博"];
}

- (IBAction)tencentAuth:(UIButton *)sender
{
    SHSVerificationViewController *vc=[[SHSVerificationViewController alloc] initWithRootViewController:self];
    vc.verificationDelegate = self;
    [vc showVerificationView:@"腾讯微博"];
//    EPWeiboShareViewController *weiboVC = [[[EPWeiboShareViewController alloc] init]autorelease];
//    [self.navigationController  pushViewController:weiboVC animated:YES];
}
@end
