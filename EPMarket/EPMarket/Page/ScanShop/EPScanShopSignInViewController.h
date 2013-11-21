//
//  EPScanShopSignInViewController.h
//  EPMarket
//
//  Created by Chuang CO.,LTD. Chi on 13-2-20.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHSVerificationViewController.h"
#import "EPWeiboShareViewController.h"

@interface EPScanShopSignInViewController : EPBaseViewController<SHSVerificationDelegate>

@property (retain, nonatomic) IBOutlet UIButton *sinaBtn;

@property (retain, nonatomic) IBOutlet UIButton *tencentBtn;
- (IBAction)sinaAuth:(UIButton *)sender;

- (IBAction)tencentAuth:(UIButton *)sender;
@end
