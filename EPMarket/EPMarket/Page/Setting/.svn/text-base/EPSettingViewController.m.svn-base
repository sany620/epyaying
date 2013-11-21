//
//  EPSettingViewController.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPSettingViewController.h"
#import "DCRoundSwitch.h"

@interface EPSettingViewController ()

@property (retain, nonatomic) IBOutlet UITableView *settingtableview;
@property (retain, nonatomic) NSString *vailidateweiboname;
@property (retain, nonatomic) NSString *sinaaccount;

- (UITableViewCell *)createTableViewCell:(NSIndexPath *)indexPath;

@end

@implementation EPSettingViewController
@synthesize settingtableview;
@synthesize vailidateweiboname;
@synthesize sinaaccount;

- (void)dealloc
{
    [settingtableview release];
    [vailidateweiboname release];
    [sinaaccount release];
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
    self.customtitle=@"设置";
    
    self.settingtableview.backgroundColor = [UIColor clearColor];
    
    self.sinaaccount = [OAuthInfo readAccessToken:sinawb2];
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

#pragma mark tableview的数据源和代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==1) {
        return 50;
    }else{
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self createTableViewCell:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SHSVerificationViewController *vc=[[SHSVerificationViewController alloc] initWithRootViewController:self];
            vc.verificationDelegate = self;
            [vc showVerificationView:@"新浪微博"];
        }else{
            [Go2PageUtility go2SettingWeiboViewController:self weiboname:@"腾讯微博"];
        }
    }
}

#pragma mark 创建tableviewcell
- (UITableViewCell *)createTableViewCell:(NSIndexPath *)indexPath
{
    NSString *cellidentify = [NSString stringWithFormat:@"cellidentify%d",indexPath.section];
    if (indexPath.section == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        DCRoundSwitch *roundswitch = [[DCRoundSwitch alloc] initWithFrame:CGRectMake(200, 10, 60, 24)];
        roundswitch.offText = @"OFF";
        roundswitch.onText = @"ON";
        roundswitch.onTintColor = [UIColor colorWithRed:0.72 green:0.51 blue:0.14 alpha:1.00];
        [cell.contentView addSubview:roundswitch];
        [roundswitch release];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
        if (indexPath.row == 0) {
            imageview.image = [UIImage imageNamed:@"设置-WIFI.png"];
        }
        if (indexPath.row == 1) {
            imageview.image = [UIImage imageNamed:@"设置-系统通知.png"];
        }
        cell.backgroundView = imageview;
        [imageview release];
        return cell;
    }
    if (indexPath.section == 1) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *weiboaccountlabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 15, 102, 14)];
        weiboaccountlabel.backgroundColor = [UIColor clearColor];
        weiboaccountlabel.textColor = [UIColor colorWithRed:0.45 green:0.44 blue:0.44 alpha:1.00];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
        if (indexPath.row == 0) {
            imageview.image = [UIImage imageNamed:@"设置-新浪.png"];
            weiboaccountlabel.text = self.sinaaccount;
        }
        if (indexPath.row == 1) {
            imageview.image = [UIImage imageNamed:@"设置-腾讯.png"];
        }
        [cell.contentView addSubview:weiboaccountlabel];
        [weiboaccountlabel release];
        cell.backgroundView = imageview;
        [imageview release];
        return cell;
    }
    return nil;
}

#pragma mark 验证微博后的回调函数
- (void)DidFinishVerification:(id<SHSOAuthSharerProtocol>)oauthSharer
{
    NSLog(@"fdsafdsaf");
}

@end
