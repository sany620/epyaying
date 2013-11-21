//
//  EPProductDetailInfoViewController.m
//  EPMarket
//
//  Created by cc on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPProductDetailInfoViewController.h"
#import "UIImageView+WebCache.h"

@interface EPProductDetailInfoViewController ()

@property (retain, nonatomic) IBOutlet UIImageView *productimageview;
@property (retain, nonatomic) IBOutlet UIView *catagoryview;
@property (retain, nonatomic) NSString *catagory;

- (IBAction)changeCatagory:(id)sender;

@end

@implementation EPProductDetailInfoViewController
@synthesize productimageview;
@synthesize detaildict;
@synthesize catagoryview;
@synthesize catagory;

- (void)dealloc
{
    [detaildict release];
    [productimageview release];
    [catagoryview release];
    [catagory release];
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
    self.customtitle = [detaildict valueForKey:@"title"];
    
    [self setRightButton:@"right_navigationbar.png"];
    UIButton *rightbtn = [[(UIButton *)self.navigationItem.rightBarButtonItem.customView subviews] objectAtIndex:0];
    [rightbtn addTarget:self action:@selector(showCatagory:) forControlEvents:UIControlEventTouchUpInside];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",CCS_COMMONURL_PREFIX,[detaildict valueForKey:@"productphoto"]]];
    [self.productimageview setImageWithURL:url];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showCatagory:(id)sender
{
    __block typeof (self)bself = self;
    [UIView animateWithDuration:1 delay:.0 options:UIViewAnimationCurveEaseOut animations:^{
        if (bself.catagoryview.frame.size.height == 140) {
            bself.catagoryview.frame = CGRectMake(240, 4, 70, 0);
        }else{
            bself.catagoryview.frame = CGRectMake(240, 4, 70, 140);
        }
    } completion:^(BOOL finished) {
    }];
}

- (IBAction)changeCatagory:(id)sender
{
    if (((UIButton *)sender).selected == NO) {
        self.catagory = [NSString stringWithFormat:@"%d",[sender tag]];
        NSArray *allcatagorybtn = [[sender superview] subviews];
        for (UIButton *btn in allcatagorybtn) {
            btn.selected = NO;
            btn.backgroundColor = [UIColor clearColor];
        }
        ((UIButton *)sender).selected = YES;
        ((UIButton *)sender).backgroundColor = [UIColor colorWithRed:0.67 green:0.52 blue:0.28 alpha:1.00];
    }
}

@end
