//
//  EPWeiboShareViewController.m
//  EPMarket
//
//  Created by cc on 13-2-18.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPWeiboShareViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SHSShareViewController.h"

@interface EPWeiboShareViewController ()

@property (retain, nonatomic) IBOutlet UIView *backgroundview;
@property (retain, nonatomic) IBOutlet UITextView *sharetextview;

- (IBAction)hideKeyBorder:(id)sender;
- (IBAction)shareToWeibo:(id)sender;

@end

@implementation EPWeiboShareViewController
@synthesize backgroundview;
@synthesize sharetextview;

- (void)dealloc
{
    [backgroundview release];
    [sharetextview release];
    [super dealloc];
}

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
    self.customtitle = @"分享到微博";
    
    self.backgroundview.layer.cornerRadius = 10;//调节圆角的大小，数值越大，圆角的拐弯越大
    self.backgroundview.layer.masksToBounds = YES;
    self.backgroundview.layer.borderColor = [[UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1.00] CGColor];
    self.backgroundview.layer.borderWidth = 1;
    
    self.sharetextview.layer.cornerRadius = 10;//调节圆角的大小，数值越大，圆角的拐弯越大
    self.sharetextview.layer.masksToBounds = YES;
    self.sharetextview.layer.borderColor = [[UIColor colorWithRed:0.90 green:0.90 blue:0.90 alpha:1.00] CGColor];
    self.sharetextview.layer.borderWidth = 1;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareToWeibo:(id)sender
{
    [self.view endEditing:YES];
    SHSShareViewController *shareController=[[SHSShareViewController alloc] initWithRootViewController:self];
    shareController.shareType=ShareTypeText;
    shareController.sharedtitle=@"雅莹";
    shareController.sharedText= self.sharetextview.text;
    shareController.sharedURL = @"http://www.google.com";
    [shareController showShareView];
}

- (IBAction)hideKeyBorder:(id)sender
{
    [self.view endEditing:YES];
}

@end
