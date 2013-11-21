//
//  EPScanShopListViewController.m
//  EPMarket
//
//  Created by Chuang CO.,LTD. Chi on 13-2-17.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPScanShopListViewController.h"
#import "EPScanShopMapViewController.h"
#import "shopMapCell.h"

@interface EPScanShopListViewController ()
{
    UIButton *coordinateBtn;
    UIScrollView *myScrollView;
}
@end

@implementation EPScanShopListViewController



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
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(0, 0, 40, 25)];
    [rightBtn setImage:[UIImage imageNamed:@"map.png"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(shopMap:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView* ricusview = [[[UIView alloc] initWithFrame:CGRectMake(270, 10, 40, 25)] autorelease];
    //270  7  44  30
    [ricusview addSubview:rightBtn];
    
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:ricusview];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 190)];
    myScrollView.pagingEnabled = YES;
    [self.view addSubview:myScrollView];
    for (int i= 0 ; i<5; i++) {
//        shopBtn = [[UIButton alloc]initWithFrame:CGRectMake(320 * i, 0, 320, 190)];
//        shopBtn.tag = i;
//        [shopBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"Shop_SH_%d.jpg",i+1]] forState:UIControlStateNormal];
//        [shopBtn addTarget:self action:@selector(shopPic:) forControlEvents:UIControlEventTouchUpInside];
//        [myScrollView addSubview:shopBtn];
//        [shopBtn release];
        UIImageView *shopImg = [[UIImageView alloc] initWithFrame:CGRectMake(320 * i, 0, 320, 190)];
        [shopImg setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Shop_SH_%d.jpg",i+1]]];
        [myScrollView addSubview:shopImg];
        [shopImg release];
    }
    
    myScrollView.contentSize = CGSizeMake(320 * 5, 190);
    myScrollView.delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [myScrollView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [super viewDidUnload];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"shopMapCell";
    
    shopMapCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [shopMapCell  loadFromNIB];
     }
    coordinateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [coordinateBtn setFrame:CGRectMake(273, 12, 25, 36)];
    [coordinateBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"layout_04LBS_03.png"]] forState:UIControlStateNormal];
    [coordinateBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [coordinateBtn setTag:indexPath.row];
    [cell addSubview:coordinateBtn];
    NSInteger row = indexPath.row;
    if (row == 0) {
        cell.distance.text = @"Shanghai   2千米";
        cell.storeName.text = @"上海浦东第一八佰伴";
        cell.address.text = @"地址：上海市浦东张杨路501号八佰伴2楼";
        
    }
    if (row == 1) {
        cell.distance.text = @"Shanghai   5千米";
        cell.storeName.text = @"上海淮海路旗舰店";
        cell.address.text = @"地址：上海市淮海中路852号底层商铺";
    }
    if (row == 2) {
        cell.distance.text = @"Shanghai   11千米";
        cell.storeName.text = @"上海港汇广场";
        cell.address.text = @"地址：上海市虹桥路一号3F3号商铺";
    }
    if (row == 3) {
        cell.distance.text = @"Jiaxing   7千米";
        cell.storeName.text = @"上海久光百货";
        cell.address.text = @"地址：上海市南京西路1618号久百城市广场S319雅莹专柜";
    }
    if (row == 4) {
        cell.distance.text = @"Jiaxing   8千米";
        cell.storeName.text = @"上海梅龙镇广场MALL";
        cell.address.text = @"地址：上海南京西路1038号梅龙镇广场4楼410号";
    }
//    cell.coordinateBtn.shop = nil;
//    [cell.coordinateBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}
-(void)buttonClick:(id)sender{
//    Shop *shop = [(shopButton *)sender shop];
    EPScanShopMapViewController *mapVC = [[[EPScanShopMapViewController alloc] init] autorelease];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
    
}



- (void)shopMap:(UIButton *)sender
{
    EPScanShopMapViewController *shopMapVC = [[EPScanShopMapViewController alloc] init];
    [self.navigationController pushViewController:shopMapVC animated:YES];
}
@end
