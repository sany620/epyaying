//
//  EPProductInfoViewController.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPProductInfoViewController.h"
#import "EPProductDetailInfoViewController.h"
#import "EPProductInfoCell.h"
#import "SVPullToRefresh.h"
#import "UITableViewPageing.h"

@interface EPProductInfoViewController ()

@property (retain, nonatomic) EPProductInfoListAction *m_action_productInfoList;
@property (retain, nonatomic) NSArray *m_productinfolist;
@property (retain, nonatomic) IBOutlet UITableViewPageing *productinfotableview;

@end

@implementation EPProductInfoViewController
@synthesize m_action_productInfoList;
@synthesize m_productinfolist;
@synthesize productinfotableview;

- (void)dealloc
{
    [m_action_productInfoList release];
    [m_productinfolist release];
    [productinfotableview release];
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
    self.customtitle=@"产品介绍";
    
    m_action_productInfoList = [[EPProductInfoListAction alloc] init];
    m_action_productInfoList.m_delegate_productinfoList = self;
    [self productListSelect];
    
//    [self.productinfotableview addInfiniteScrollingWithActionHandler:^{
//        [self productListSelect];
//        [self.productinfotableview.infiniteScrollingView performSelector:@selector(stopAnimating) withObject:nil afterDelay:1];
//    }];
}

- (void)productListSelect
{
    [m_action_productInfoList requestProductInfoListData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.m_productinfolist.count%2==0?self.m_productinfolist.count/2:self.m_productinfolist.count/2+1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentify = @"cellindentify";
    EPProductInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentify];
    if (cell == nil) {
        NSArray *cellarr=[[NSBundle mainBundle] loadNibNamed:@"EPProductInfoCell" owner:nil options:nil];
        cell=(EPProductInfoCell *)[cellarr objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *leftimagedict = [m_productinfolist objectAtIndex:(indexPath.row*2)];
    NSDictionary *rightimagedict = nil;
    if (indexPath.row*2+1<self.m_productinfolist.count) {
        rightimagedict = [m_productinfolist objectAtIndex:(indexPath.row*2+1)];
    }
    NSArray *cellcontentarr = [NSArray arrayWithObjects:leftimagedict,rightimagedict, nil];
    cell.productInfoDictArr = cellcontentarr;
    return cell;
}

#pragma mark 产品列表Action的代理
- (NSDictionary *)onRequestProductInfoListDataAction
{
//    [self.productinfotableview pageStringValue];
    NSDictionary *productinfodict = [NSDictionary dictionaryWithObjectsAndKeys:@"16",@"cid",@"0",@"p", nil];
    return productinfodict;
}

- (void)onResponseProductInfoListDataSuccess:(NSArray *)l_array_list
{
    self.m_productinfolist = l_array_list;
    [self.productinfotableview reloadData];
}

- (void)onResponseProductInfoListDataFail
{
    NSLog(@"fail");
}

- (void)go2ProductDetailInfo:(NSDictionary *)dict
{
    [Go2PageUtility go2ProductDetailInfoController:self detaildict:dict];
}

@end
