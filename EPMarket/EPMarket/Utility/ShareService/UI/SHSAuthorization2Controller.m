//
//  SHSAuthorization2Controller.m
//  ShareDemo
//
//  Created by tmy on 11-11-29.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "SHSAuthorization2Controller.h"

@implementation SHSAuthorization2Controller
@synthesize authorizationURL=_authorizationURL,authorizationDelegate=_authorizationDelegate;

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

- (void)dealloc
{
    [_webView release];
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    if(_loadView)
        [_loadView release];
    self.authorizationURL=nil;
    [super dealloc];
}

#pragma mark - View lifecycle


- (void)loadView
{
    _webView=[[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    _webView.delegate=self;
    self.view=_webView;
    self.customtitle=@"请求授权";
        
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"按钮.png"] forState:UIControlStateNormal];
    [rightbtn setTitle:@"取消" forState:UIControlStateNormal];
    [rightbtn.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    rightbtn.frame = CGRectMake(0, 10, 50, 24);
    [rightbtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    //customview
	UIView* ricusview = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 44)] autorelease];
	[ricusview addSubview:rightbtn];
    
    UIBarButtonItem *backbtnitem = [[UIBarButtonItem alloc] initWithCustomView:ricusview];
    self.navigationItem.rightBarButtonItem = backbtnitem;
    [backbtnitem release];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    //清空cookie
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *each in [[[cookieStorage cookiesForURL:[NSURL URLWithString:self.authorizationURL]] copy] autorelease]) {
        [cookieStorage deleteCookie:each];
    }
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.authorizationURL]]];
    
    self.navigationItem.leftBarButtonItem = nil;
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

- (void)cancel
{
    if([_authorizationDelegate respondsToSelector:@selector(authorizationDidCancel)])
        [_authorizationDelegate authorizationDidCancel];
    [_webView loadHTMLString:nil baseURL:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController dismissModalViewControllerAnimated:YES];
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.view.userInteractionEnabled=NO;
    if(!_loadView)
        _loadView=[[LoadingView alloc] initWithFrame:CGRectMake(0, 0, 130, 100) LoadingViewStyle:LoadingViewStyleStandard];
    _loadView.titleLabel.font=[UIFont systemFontOfSize:13];
    _loadView.title=@"加载中";
    [_loadView showInView:self.view];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.view.userInteractionEnabled=YES;
    [_loadView dismiss];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString *queryStr=request.URL.fragment;
    NSArray *parameters=[queryStr componentsSeparatedByString:@"&"];
    for(NSString *parameterKeyValue in parameters)
    {
        NSArray *keyValue=[parameterKeyValue componentsSeparatedByString:@"="];
        
        if([[keyValue objectAtIndex:0] isEqualToString:@"access_token"])
        {
            NSString *accessToken=[keyValue objectAtIndex:1];  
            accessToken=[accessToken URLDecodedString];
            NSTimeInterval expire=[[[[parameters objectAtIndex:1] componentsSeparatedByString:@"="] objectAtIndex:1] floatValue];
            [_authorizationDelegate authorizationDidFinishWithAccessToken:accessToken withExpireTime:expire];
            [self.navigationController popViewControllerAnimated:NO];
            [self.navigationController dismissModalViewControllerAnimated:YES];
            return NO;
        }
    }
    
    return YES;
}


@end
