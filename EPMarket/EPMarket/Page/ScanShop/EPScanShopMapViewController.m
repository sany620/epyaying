//
//  EPScanShopMapViewController.m
//  EPMarket
//
//  Created by Chuang CO.,LTD. Chi on 13-2-17.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPScanShopMapViewController.h"
#import "EPScanShopListViewController.h"

@interface EPScanShopMapViewController ()
{
    MapViewController *_mapViewController;
}
@end

@implementation EPScanShopMapViewController

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
    self.customtitle = @"附近门店";
    
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightBtn setFrame:CGRectMake(0, 0, 40, 25)];
//    [rightBtn setImage:[UIImage imageNamed:@"list.png"] forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(shopList:) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIView* ricusview = [[[UIView alloc] initWithFrame:CGRectMake(270, 10, 40, 25)] autorelease];
//    
//    [ricusview addSubview:rightBtn];
//    
//    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:ricusview];
//    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:@"31.228468",@"latitude",@"121.516879",@"longitude",nil];

    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:@"31.218213",@"latitude",@"121.462135",@"longitude",nil];

    NSDictionary *dic3=[NSDictionary dictionaryWithObjectsAndKeys:@"31.194742",@"latitude",@"121.437686",@"longitude",nil];

    NSDictionary *dic4=[NSDictionary dictionaryWithObjectsAndKeys:@"31.223821",@"latitude",@"121.446302",@"longitude",nil];
    
    NSDictionary *dic5=[NSDictionary dictionaryWithObjectsAndKeys:@"31.229200",@"latitude",@"121.456175",@"longitude",nil];
    
    NSArray *array = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4,dic5, nil];
    
	_mapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    _mapViewController.delegate = self;
    [self.view addSubview:_mapViewController.view];
    [_mapViewController.view setFrame:self.view.bounds];
    [_mapViewController resetAnnitations:array];
}

- (void)customMKMapViewDidSelectedWithInfo:(id)info
{
    NSLog(@"%@",info);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_mapViewController release];
    [super dealloc];
}
- (void)viewDidUnload {
    
    [super viewDidUnload];
}


//- (IBAction)shopList:(UIButton *)sender
//{
//    EPScanShopListViewController *shopListVC = [[EPScanShopListViewController alloc] init];
//    [self.navigationController pushViewController:shopListVC animated:YES];
//}
@end
