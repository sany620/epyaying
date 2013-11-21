//
//  EPProductInfoCell.m
//  EPMarket
//
//  Created by cc on 13-2-17.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPProductInfoCell.h"
#import "UIImageView+WebCache.h"
#import "EPProductInfoViewController.h"

@implementation EPProductInfoCell
@synthesize leftPictureImageView;
@synthesize rightPictureImageView;
@synthesize leftPictureTitleLabel;
@synthesize rightPictureTitleLabel;
@synthesize productInfoDictArr = _productInfoDictArr;

- (void)dealloc
{
    [leftPictureImageView release];
    [rightPictureImageView release];
    [leftPictureTitleLabel release];
    [rightPictureTitleLabel release];
    [_productInfoDictArr release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setProductInfoDictArr:(NSArray *)productInfoDictArr
{
    [productInfoDictArr retain];
    [_productInfoDictArr release];
    _productInfoDictArr = productInfoDictArr;
    
    NSDictionary *leftImageProductInfoDict = [productInfoDictArr objectAtIndex:0];
    NSString *leftPictureUrlString;
    NSString *leftPictureTitle;
    leftPictureUrlString = [NSString stringWithFormat:@"%@%@",CCS_COMMONURL_PREFIX,[leftImageProductInfoDict valueForKey:@"productphoto"]];
    leftPictureTitle = [leftImageProductInfoDict valueForKey:@"title"];
    NSURL *leftPictureUrl = [NSURL URLWithString:leftPictureUrlString];
    [self.leftPictureImageView setImageWithURL:leftPictureUrl];
    self.leftPictureImageView.tag = 0;
    self.leftPictureTitleLabel.text = leftPictureTitle;
    
    self.leftPictureImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTouchSaleRecommendview:)];
    [self.leftPictureImageView addGestureRecognizer:singleTap];
    [singleTap release];
    
    if (productInfoDictArr.count== 2) {
        NSDictionary *rightImageProductInfoDict = [productInfoDictArr objectAtIndex:1];
        NSString *rightPictureUrlString;
        NSString *rightPictureTitle;
        rightPictureUrlString = [NSString stringWithFormat:@"%@%@",CCS_COMMONURL_PREFIX,[rightImageProductInfoDict valueForKey:@"productphoto"]];
        rightPictureTitle = [rightImageProductInfoDict valueForKey:@"title"];
        NSURL *rightPictureUrl = [NSURL URLWithString:rightPictureUrlString];
        [self.rightPictureImageView setImageWithURL:rightPictureUrl];
        self.rightPictureImageView.tag = 1;
        self.rightPictureTitleLabel.text = rightPictureTitle;
        
        self.rightPictureImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTouchSaleRecommendview:)];
        [self.rightPictureImageView addGestureRecognizer:singleTap];
        [singleTap release];
    }
}

- (void)imageTouchSaleRecommendview:(id)sender
{
    id next = [[sender view] nextResponder];
    while(![next isKindOfClass:[EPProductInfoViewController class]]) {
        next = [next nextResponder];
    }
    NSDictionary *dict = [_productInfoDictArr objectAtIndex:[[sender view] tag]];
    [(EPProductInfoViewController *)next go2ProductDetailInfo:dict];
}

@end
