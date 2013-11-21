//
//  EPScanShopNoticeViewController.m
//  EPMarket
//
//  Created by Chuang CO.,LTD. Chi on 13-2-20.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPScanShopNoticeViewController.h"

@interface EPScanShopNoticeViewController ()


@end

@implementation EPScanShopNoticeViewController
@synthesize ticketImg = _ticketImg;

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
    self.customtitle = @"通知";
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_ticketImg release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTicketImg:nil];
    [super viewDidUnload];
}
- (IBAction)savePhoto:(UIButton *)sender
{
    //保存图片到相册
    UIImageWriteToSavedPhotosAlbum(_ticketImg.image, self, nil, nil);
}
@end
