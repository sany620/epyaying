//
//  EPScanShopViewController.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPScanShopViewController.h"
#import "EPScanShopListViewController.h"
#import "EPScanShopSignInViewController.h"
#import "EPScanShopNoticeViewController.h"

@implementation EPScanShopViewController
@synthesize rulesView =_rulesView;
@synthesize activityRules = _activityRules;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.customtitle = @"寻花觅宝";

    _rulesView.backgroundColor = [UIColor clearColor];
    [_rulesView addSubview:_activityRules];
    
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightBtn setFrame:CGRectMake(0, 0, 17, 26)];
//    [rightBtn setImage:[UIImage imageNamed:@"layout_04LBS_dot.png"] forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(shopList:) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIView* ricusview = [[[UIView alloc] initWithFrame:CGRectMake(260, 0, 17, 26)] autorelease];
//    
//    [ricusview addSubview:rightBtn];
//    
//    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:ricusview];
//    self.navigationItem.rightBarButtonItem = rightButtonItem;
    UIButton *testBtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 300, 200, 50)];
    [testBtn addTarget:self action:@selector(notice:) forControlEvents:UIControlEventTouchUpInside];
    [self setRightButton:@"layout_04LBS_03.png"];
    UIButton *rightbtn = [[(UIButton *)self.navigationItem.rightBarButtonItem.customView subviews] objectAtIndex:0];
    [rightbtn addTarget:self action:@selector(shopList:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidUnload
{
    
    [self setActivityRules:nil];
    [self setRulesView:nil];
    [self setSignInBtn:nil];
    [self setNoticeBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_activityRules release];
    [_rulesView release];
    [_signInBtn release];
    [_noticeBtn release];
    [super dealloc];
}


- (void)shopList:(UIButton *)sender
{
    EPScanShopListViewController *shopListVC= [[EPScanShopListViewController alloc] init];
    [self.navigationController pushViewController:shopListVC animated:YES];
}
- (IBAction)signIn:(UIButton *)sender
{
    EPScanShopSignInViewController *signInVC = [[EPScanShopSignInViewController alloc] init];
    [self.navigationController pushViewController:signInVC animated:YES];
}

- (IBAction)notice:(UIButton *)sender
{
    EPScanShopNoticeViewController *noticeVC = [[[EPScanShopNoticeViewController alloc] init] autorelease];
    [self.navigationController pushViewController:noticeVC animated:YES];
}

- (IBAction)activityRules:(UIButton *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    if (_rulesView.frame.origin.y == 365) {
        
        [_rulesView setFrame:CGRectMake(0, 0, 320, 460)];
        _rulesView.backgroundColor = [[UIColor alloc]initWithRed:0.0 green:0.0  blue:0.0 alpha:0.5] ;
        [_activityRules setImage:[UIImage imageNamed:@"rules_down.png"] forState:UIControlStateNormal];
        [_activityRules setImage:[UIImage imageNamed:@"rules_down.png"] forState:UIControlStateHighlighted];
    }else{
        
        [_rulesView setFrame:CGRectMake(0, 365, 320, 460)];
        _rulesView.backgroundColor = [UIColor clearColor];
        [_activityRules setImage:[UIImage imageNamed:@"rules_up.png"] forState:UIControlStateNormal];
        [_activityRules setImage:[UIImage imageNamed:@"rules_up.png"] forState:UIControlStateHighlighted];
    }
    
}
@end
