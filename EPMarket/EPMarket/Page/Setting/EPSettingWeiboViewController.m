//
//  EPSettingWeiboViewController.m
//  EPMarket
//
//  Created by cc on 13-2-19.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPSettingWeiboViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface EPSettingWeiboViewController ()

@property (retain, nonatomic) IBOutlet UIImageView *weibologoimageview;
@property (retain, nonatomic) IBOutlet UILabel *tiplabel;
@property (retain, nonatomic) IBOutlet UITextField *accountfield;
@property (retain, nonatomic) IBOutlet UITextField *passwordfield;

@end

@implementation EPSettingWeiboViewController
@synthesize weiboname;
@synthesize tiplabel;
@synthesize accountfield;
@synthesize passwordfield;

- (void)dealloc
{
    [weiboname release];
    [tiplabel release];
    [accountfield release];
    [passwordfield release];
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
    self.customtitle = @"设置";
    
    self.accountfield.layer.borderColor = [[UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1.00] CGColor];
    self.accountfield.layer.borderWidth = 1;
    self.passwordfield.layer.borderColor = [[UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1.00] CGColor];
    self.passwordfield.layer.borderWidth = 1;

    
    if (self.weiboname!=nil && [self.weiboname isEqualToString:@"新浪"]) {
        self.weibologoimageview.image = [UIImage imageNamed:@"新浪logo.png"];
        self.tiplabel.text = @"授权同步到你的新浪微博账号";
    }else if(self.weiboname!=nil && [self.weiboname isEqualToString:@"腾讯"]){
        self.weibologoimageview.image = [UIImage imageNamed:@"腾讯logo.png"];
        self.tiplabel.text = @"授权同步到你的腾讯微博账号";
    }else{
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
