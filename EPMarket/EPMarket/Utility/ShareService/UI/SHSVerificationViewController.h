//
//  SHSVerificationViewController.h
//  EPMarket
//
//  Created by cc on 13-2-20.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPBaseViewController.h"
#import "SHSCore.h"
#import "LoadingView.h"
#import "SHSOAuth1Sharer.h"
#import "SHSOAuth2Sharer.h"
#import "SHSAPIKeys.h"

@protocol SHSVerificationDelegate <NSObject>

@optional
- (void)BeginVerification:(id<SHSOAuthSharerProtocol>)oauthSharer;
- (void)DidFinishVerification:(id<SHSOAuthSharerProtocol>)oauthSharer;
- (void)DidCancelVerification:(id<SHSOAuthSharerProtocol>)oauthSharer;
- (void)DidFailInVerification:(id<SHSOAuthSharerProtocol>)oauthSharer;
@end

@interface SHSVerificationViewController : UIViewController<SHSOAuthDelegate>
{
    LoadingView *_loadView;
    UIViewController *_rootViewController;
    id<SHSVerificationDelegate> _verificationDelegate;
}

@property (nonatomic,assign) UIViewController *rootViewController;
@property (nonatomic,assign) id<SHSVerificationDelegate> verificationDelegate;

- (void)showVerificationView:(NSString *)weiboname;
- (id)initWithRootViewController:(UIViewController *)rootViewController;

@end
