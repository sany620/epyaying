//
//  SHSVerificationViewController.m
//  EPMarket
//
//  Created by cc on 13-2-20.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "SHSVerificationViewController.h"

@interface SHSVerificationViewController ()

@end

@implementation SHSVerificationViewController
@synthesize rootViewController=_rootViewController;
@synthesize verificationDelegate=_verificationDelegate;

- (void)dealloc
{
    [_loadView release];
    [super dealloc];
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super init];
    if (self) {
        _rootViewController=rootViewController;
    }
    return self;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 调用分享微博的验证
- (void)showVerificationView:(NSString *)weiboname//这里的weiboname是根据ServiceConfig.plist的配置而写的，不能随意写
{
    NSDictionary *dict = [self loadConfig:weiboname];
    id<SHSOAuthSharerProtocol> sharer=nil;
    OAuthType type=[[dict objectForKey:@"oauthType"] intValue];
    switch (type) {
        case OAuthTypeOAuth1WithHeader:
        case OAuthTypeOAuth1WithQueryString:{
            SHSOAuth1Sharer * serviceSharer=[[NSClassFromString([dict objectForKey:@"name"]) alloc] init];
            serviceSharer.key=[dict objectForKey:@"key"];
            serviceSharer.name=[dict objectForKey:@"title"];
            serviceSharer.requestTokenURL=[dict objectForKey:@"requestTokenURL"];
            serviceSharer.autherizeURL=[dict objectForKey:@"authorizeURL"];
            serviceSharer.accessTokenURL=[dict objectForKey:@"accessTokenURL"];
            serviceSharer.callbackURL=[dict objectForKey:@"callbackURL"];
            serviceSharer.rootViewController=self.rootViewController;
            serviceSharer.delegate=self;
            serviceSharer.signatureProvider=[[[OAHMAC_SHA1SignatureProvider alloc] init] autorelease];
            serviceSharer.sharedUrl = @"http://www.google.com";
            serviceSharer.oauthType=type;
            sharer=serviceSharer;
            break;
        }
        case OAuthTypeOAuth2:{
            SHSOAuth2Sharer * serviceSharer=[[NSClassFromString([dict objectForKey:@"name"]) alloc] init];
            serviceSharer.key=[dict objectForKey:@"key"];
            serviceSharer.name=[dict objectForKey:@"title"];
            serviceSharer.autherizeURL=[dict objectForKey:@"authorizeURL"];
            serviceSharer.callbackURL=[dict objectForKey:@"callbackURL"];
            serviceSharer.rootViewController=self.rootViewController;
            serviceSharer.delegate=self;
            serviceSharer.oauthType=type;
            serviceSharer.sharedUrl = @"http://www.google.com";
            sharer=serviceSharer;
            break;
        }
        default:{
            break;
        }
    }
    [sharer beginOAuthVerification];
}

#pragma mark 加载serviceconfig.plist文件
- (NSDictionary *)loadConfig:(NSString *)type
{
    NSDictionary *config=[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ServiceConfig" ofType:@"plist"]];
    NSArray *services=[config objectForKey:@"OAuthServices"];
    for(int i=0; i<[services count];i++)
    {
        NSDictionary *dict=[services objectAtIndex:i];
        if ([[dict objectForKey:@"title"] isEqualToString:type])
        {
            return [dict retain];
        }
    }
    return nil;
}

#pragma mark 关闭验证窗口
- (void)loadViewDidDismissed
{
    [_loadView dismiss];
    [_loadView release];
    _loadView=nil;
}

- (void)loadViewDelayClose
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(loadViewDidDismissed)];
    _loadView.alpha=0;
    _loadView.transform=CGAffineTransformMakeScale(1.7f, 1.7f);
    [UIView commitAnimations];
}

#pragma mark - SHSOAuthShareDelegate
- (void)OAuthSharerDidBeginVerification:(id<SHSOAuthSharerProtocol>)oauthSharer
{
    if(!_loadView)
        _loadView=[[LoadingView alloc] initWithFrame:CGRectMake(0, 0, 130, 100) LoadingViewStyle:LoadingViewStyleStandard];
    _loadView.titleLabel.font=[UIFont boldSystemFontOfSize:13];
    _loadView.title=@"加载中";
    
    _loadView.alpha=0;
    _loadView.transform=CGAffineTransformMakeScale(1.7f, 1.7f);
    [_loadView showInView:self.view];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    _loadView.alpha=1;
    _loadView.transform=CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    if([_verificationDelegate respondsToSelector:@selector(BeginVerification:)]){
        [_verificationDelegate BeginVerification:oauthSharer];
    }
}

- (void)OAuthSharerDidFinishVerification:(id<SHSOAuthSharerProtocol>)oauthSharer
{
    [self loadViewDidDismissed];
    if([_verificationDelegate respondsToSelector:@selector(DidFinishVerification:)]){
        [_verificationDelegate DidFinishVerification:oauthSharer];
    }
}

- (void)OAuthSharerDidCancelVerification:(id<SHSOAuthSharerProtocol>)oauthSharer
{
    [self loadViewDidDismissed];
    if([_verificationDelegate respondsToSelector:@selector(DidCancelVerification:)]){
        [_verificationDelegate DidCancelVerification:oauthSharer];
    }
}

- (void)OAuthSharerDidFailInVerification:(id<SHSOAuthSharerProtocol>)oauthSharer
{
    [self loadViewDidDismissed];
    
    if(!_loadView)
        _loadView=[[LoadingView alloc] initWithFrame:CGRectMake(0, 0, 130, 100) LoadingViewStyle:LoadingViewStyleTilte];
    _loadView.titleLabel.font=[UIFont boldSystemFontOfSize:15];
    _loadView.title=@"用户授权失败";
    
    _loadView.alpha=0;
    _loadView.transform=CGAffineTransformMakeScale(1.7f, 1.7f);
    [_loadView showInView:self.view];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    _loadView.alpha=1;
    _loadView.transform=CGAffineTransformMakeScale(1, 1);
    [UIView commitAnimations];
    [self performSelector:@selector(loadViewDelayClose) withObject:nil afterDelay:1];
    
    if([_verificationDelegate respondsToSelector:@selector(DidFailInVerification:)]){
        [_verificationDelegate DidFailInVerification:oauthSharer];
    }
}

@end
