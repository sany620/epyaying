//
//  EPBaseViewController.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#if OBJC_API_VERSION >= 2
#import <objc/runtime.h>
#else
#import <objc/objc-class.h>
#endif
#import <mach/mach.h>
#import <mach/mach_time.h>
#import "EPBaseViewController.h"
#import "EPStatusUtility.h"

/**
 UINavigationBar的类别
 实现对系统按钮样式的更改
 */

#define KNaviBarBg_Tag 785478647
#define KNaviDefaultHeight 44.0

static IMP originalMethodOfdrawRect = nil;

static IMP originalMethodOfSizeThatFits = nil;

@implementation UINavigationBar (UINavigationBarImage)

- (void)setDefaultBackground
{
    [self setBackground:[UIImage imageNamed:CCS_COMMONIMG_NAVI]];
    
    if (originalMethodOfSizeThatFits == nil) {
        originalMethodOfSizeThatFits = [self methodForSelector:@selector(sizeThatFits:)];
        class_replaceMethod([self class], @selector(sizeThatFits:), [self methodForSelector:@selector(customSizeThatFits:)], nil);
    }
}

// Junshuang added.控制是否需要使用自定义导航栏
- (void)useCustomNavBar:(BOOL)yesOrNo
{
    if (yesOrNo) {
        class_replaceMethod([self class], @selector(sizeThatFits:),
                            [self methodForSelector:@selector(customSizeThatFits:)], nil);
    }
    else {
        class_replaceMethod([self class],@selector(sizeThatFits:), originalMethodOfSizeThatFits, nil);
    }
}

- (void)setBackground:(UIImage*)image
{
	self.backgroundColor = [UIColor clearColor];
	if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
	{
		// set globablly for all UINavBars
		//UIBarMetricsDefault
		[self setBackgroundImage:image forBarMetrics:0];
	}
	else
	{
		if (originalMethodOfdrawRect == nil)
		{
			originalMethodOfdrawRect = [self methodForSelector:@selector(drawRect:)];
			class_replaceMethod([self class],@selector(drawRect:), [self methodForSelector:@selector(customDrawRect:)],nil);
		}
		
		UIImageView* bgview = [self testAndGetBgView];
		if (!image)
		{
			[bgview removeFromSuperview];
			return;
		}
		
		if (!bgview)
		{
			bgview = [[[UIImageView alloc] init] autorelease];
			bgview.tag = KNaviBarBg_Tag;
			[self addSubview:bgview];
			[self sendSubviewToBack:bgview];
		}
		[bgview setImage:image];
		bgview.frame = CGRectMake(0, 0, self.bounds.size.width, image.size.height);
	}
}

-(UIImageView *)testAndGetBgView
{
    return (UIImageView *)[self viewWithTag:KNaviBarBg_Tag];
}

- (BOOL)isUsedCustomerBg
{
	if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
	{
		UIImage* bgimage = [self backgroundImageForBarMetrics:0];
		if (bgimage) {
			return YES;
		}
	}
	else
	{
		if ([self testAndGetBgView]) {
			return YES;
		}
	}
	return NO;
}

//for other views
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index
{
    [super insertSubview:view atIndex:index];
    [self sendSubviewToBack:[self testAndGetBgView]];
}

/* input: The tag you chose to identify the view */
-(void)resetBackground
{
    [self sendSubviewToBack:[self viewWithTag:KNaviBarBg_Tag]];
}

- (void)customDrawRect:(CGRect)rect
{
	if (![self testAndGetBgView])
	{
        if (originalMethodOfdrawRect) {
            originalMethodOfdrawRect(self,@selector(drawRect:),rect);
        }
	}
}

//// the real navigationBar height
//- (CGSize)sizeThatFits:(CGSize)size
- (CGSize)customSizeThatFits:(CGSize)size
{
	self.frame = CGRectMake(0, 0, 320, [self getFitHeight]);
	
	if (![self isUsedCustomerBg])
	{
		CGSize newSize = CGSizeMake(320, KNaviDefaultHeight);
		return newSize;
	}
	else
	{
		CGSize newSize = CGSizeMake(320, [EPStatusUtility getNavigationBarHeight]);
		return newSize;
	}
}

- (CGFloat)getFitHeight
{
	if (![self isUsedCustomerBg])
	{
		return KNaviDefaultHeight;
	}
	else
	{
		CGFloat height = KNaviDefaultHeight - (KNaviDefaultHeight - [EPStatusUtility getNavigationBarHeight]) / 2;
		return height;
	}
}

static CGPoint oldNavBarPoint;

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // get the timebase info -- different on phone and OSX
    mach_timebase_info_data_t info;
    mach_timebase_info(&info);
    
    // get the time
    uint64_t absTime = mach_absolute_time();
    
    // apply the timebase info
    absTime *= info.numer;
    absTime /= info.denom;
    
	NSTimeInterval system = (NSTimeInterval) ((double) absTime / 1000000000.0);
	
	CGPoint nowpoint = point;
	if (system - event.timestamp < 0.1 && [[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2)
	{
		nowpoint = oldNavBarPoint;
	}
	oldNavBarPoint = point;
    
	if ([self pointInside:nowpoint withEvent:event])
	{
		for (UIView* vi in self.subviews)
		{
			CGPoint realpoint = [self convertPoint:nowpoint toView:vi];
			UIView* realview = [vi hitTest:realpoint withEvent:event];
			if (realview)
			{
				return realview;
			}
		}
		return self;
	}
	return nil;
}

@end

@interface EPBaseViewController() 

-(void)createBackNavBar;
-(void)onButtonActionBack:(id)sender;
@end


@implementation EPBaseViewController
@synthesize customtitle = _customtitle;

- (void)dealloc
{
    [_customtitle release];
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackground:[UIImage imageNamed:CCS_COMMONIMG_NAVI]];
    [self createBackNavBar];
}

//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//}

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

#pragma -
#pragma mark 创建自定义返回按钮
-(void)createBackNavBar{
    
    UIImage *l_normalImage_back=[UIImage imageNamed:@"nav_btn_back.png"];
    UIButton *l_btn_back=[UIButton buttonWithType:UIButtonTypeCustom];
    [l_btn_back setFrame:CGRectMake(10, 10, 24, 24)];
    [l_btn_back setImage:l_normalImage_back forState:UIControlStateNormal];
    
    [l_btn_back addTarget:self action:@selector(onButtonActionBack:) forControlEvents:UIControlEventTouchUpInside];
    //customview
	UIView* ricusview = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 44)] autorelease];
	[ricusview addSubview:l_btn_back];
    
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:ricusview];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    [leftButtonItem release];
}

-(void)onButtonActionBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setCustomtitle:(NSString *)customtitle
{
    [customtitle retain];
    [_customtitle release];
    _customtitle = customtitle;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithRed:0.67 green:0.52 blue:0.28 alpha:1.00];
    [label setFont:[UIFont boldSystemFontOfSize:24]];
    label.text = customtitle;
    label.textAlignment = UITextAlignmentCenter;
    self.navigationItem.titleView = label;
    [label release];
}

- (void)setRightButton:(NSString *)rightbtnimagename
{
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightbtn setBackgroundImage:[UIImage imageNamed:rightbtnimagename] forState:UIControlStateNormal];
    rightbtn.frame = CGRectMake(16, 10, 24, 24);
    
    //customview
	UIView* ricusview = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 44)] autorelease];
	[ricusview addSubview:rightbtn];
    
    UIBarButtonItem *backbtnitem = [[UIBarButtonItem alloc] initWithCustomView:ricusview];
    self.navigationItem.rightBarButtonItem = backbtnitem;
    [backbtnitem release];
}

@end

