//
//  EPNewZealandCourierViewController.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPNewZealandCourierViewController.h"
#import "EPNewZealandTableCell.h"

@interface EPNewZealandCourierViewController()

@property(nonatomic,retain)EPNewZealandListAction *m_action_newZealandList;
@property(nonatomic,retain)NSArray *m_array_newZealandList;
@property (nonatomic,retain)PSCollectionView *m_collectionView;

@end

@implementation EPNewZealandCourierViewController
@synthesize m_action_newZealandList;
@synthesize m_array_newZealandList;
@synthesize m_collectionView;

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.m_collectionView=nil;
}

- (void)dealloc {
    self.m_action_newZealandList=nil;
    self.m_array_newZealandList=nil;
    self.m_collectionView.delegate = nil;
    self.m_collectionView.collectionViewDelegate=nil;
    self.m_collectionView.collectionViewDataSource=nil;
    self.m_collectionView=nil;
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
    self.customtitle=@"新西兰速递";
    
    self.m_collectionView = [[[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)] autorelease];
    
    [self.view addSubview:self.m_collectionView];
    self.m_collectionView.collectionViewDelegate = self;
    self.m_collectionView.collectionViewDataSource = self;
    self.m_collectionView.backgroundColor = [UIColor clearColor];
    self.m_collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.m_collectionView.numColsPortrait = 2;
    self.m_collectionView.numColsLandscape = 3;
    
    m_action_newZealandList=[[EPNewZealandListAction alloc] init];
    m_action_newZealandList.m_delegate_newZealandList=self;
    
    [m_action_newZealandList requestNewZealandListData];
    
    [self setRightButton:@"right_navigationbar.png"];
    UIButton *rightbtn = [[(UIButton *)self.navigationItem.rightBarButtonItem.customView subviews] objectAtIndex:0];
    [rightbtn addTarget:self action:@selector(shareWeibo:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)shareWeibo:(id)sender
{
    [Go2PageUtility go2WeiboShareViewController:self];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma -
#pragma mark EPNewZealandListActionDelegate

-(NSDictionary*)onRequestNewZealandListDataAction{
    NSString *l_str_page=[NSString stringWithFormat:@"%d",(m_int_page+1)];
    
    NSDictionary *l_dict=[NSDictionary dictionaryWithObjectsAndKeys:
                          l_str_page,@"p",
                          nil];
    return l_dict;
}
-(void)onResponseNewZealandListDataSuccess:(NSArray*)l_array_list pageData:(EPPageData*)l_data_page{
//    m_int_page=[l_data_page.mcurrPage intValue];
//    m_int_pageSize=[l_data_page.mpageSize intValue];
    m_int_allcount=[l_data_page.mallCount intValue];
    
    self.m_array_newZealandList=l_array_list;
    
    [self.m_collectionView reloadData];
}
-(void)onResponseNewZealandListDataFail{
    
}


#pragma mark - PSCollectionViewDelegate and DataSource
- (NSInteger)numberOfViewsInCollectionView:(PSCollectionView *)collectionView {
    return [self.m_array_newZealandList count];
}

- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView viewAtIndex:(NSInteger)index {
    if ([m_array_newZealandList count]<=0) {
        return nil;
    }
    
    EPNewZealandListData *item = [self.m_array_newZealandList objectAtIndex:index];
    
    EPNewZealandTableCell *l_cell = (EPNewZealandTableCell *)[self.m_collectionView dequeueReusableView];
    if (!l_cell) {
        NSArray *l_arr_views=[[NSBundle mainBundle] loadNibNamed:@"EPNewZealandTableCell" owner:nil options:nil];
        
        for (UIView *l_view in l_arr_views) {
            if ([l_view isKindOfClass:[EPNewZealandTableCell class]]) {
                l_cell=(EPNewZealandTableCell*)l_view;
            }
        }
    }
    
    [l_cell fillViewWithObject:item];
    
    return l_cell;
}

- (CGFloat)heightForViewAtIndex:(NSInteger)index {
    if ([m_array_newZealandList count]<=0) {
        return 0;
    }
    
    EPNewZealandListData *item = [self.m_array_newZealandList objectAtIndex:index];
    
    return [EPNewZealandTableCell heightForViewWithObject:item inColumnWidth:self.m_collectionView.colWidth];
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectView:(PSCollectionViewCell *)view atIndex:(NSInteger)index {
    //    NSDictionary *item = [self.items objectAtIndex:index];
    
    // You can do something when the user taps on a collectionViewCell here
}
@end
