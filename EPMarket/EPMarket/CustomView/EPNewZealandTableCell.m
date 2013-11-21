//
//  EPNewZealandTableCell.m
//  EPMarket
//
//  Created by xx on 13-2-18.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPNewZealandTableCell.h"
#import "EPStatusUtility.h"

#define MARGIN 4.0
#define kLabel_ImgV_Width 152
#define kLabel_Title_Height 10.0
#define kLabel_Content_Width 141.0
#define kLabel_Content_FontSize 10.0

@implementation EPNewZealandTableCell
@synthesize m_label_created;
@synthesize m_label_content;
@synthesize m_imgV_top;
@synthesize m_label_title;
@synthesize m_data_item;

- (void)dealloc {
    [m_label_created release];
    [m_label_content release];
    [m_imgV_top release];
    [m_label_title release];
    [m_data_item release];
    [super dealloc];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.m_imgV_top.image = nil;
    self.m_label_title.text = nil;
    self.m_label_created.text = nil;
    self.m_label_content.text = nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width - MARGIN * 2;
    CGFloat top = 0;
    CGFloat left = MARGIN;
    
    //top Image
    CGFloat objectWidth = [self.m_data_item.mimageWidth floatValue];
    CGFloat objectHeight = [self.m_data_item.mimageHeight floatValue];
    CGFloat scaledHeight = floorf(objectHeight / (objectWidth / width));
    self.m_imgV_top.frame = CGRectMake(left, top, width, scaledHeight);
    
    //title Label
    [self.m_label_title setFrame:CGRectMake(self.m_label_title.frame.origin.x, self.m_imgV_top.frame.origin.y+self.m_imgV_top.frame.size.height+MARGIN, self.m_label_title.frame.size.width, self.m_label_title.frame.size.height)];
    
    //created Label
    [self.m_label_created setFrame:CGRectMake(self.m_label_created.frame.origin.x, self.m_imgV_top.frame.origin.y+self.m_imgV_top.frame.size.height+MARGIN, self.m_label_created.frame.size.width, self.m_label_created.frame.size.height)];
    
    
    //content Label
    CGSize labelSize = CGSizeZero;
    labelSize = [self.m_label_content.text sizeWithFont:self.m_label_content.font constrainedToSize:CGSizeMake(kLabel_Content_Width, MAXFLOAT) lineBreakMode:self.m_label_content.lineBreakMode];
    top = self.m_label_title.frame.origin.y + self.m_label_title.frame.size.height + MARGIN;
    
    self.m_label_content.frame = CGRectMake(left, top, labelSize.width, labelSize.height);
}

- (void)fillViewWithObject:(id)object{
    [super fillViewWithObject:object];
    
    self.m_data_item=(EPNewZealandListData*)object;
    
    NSURL *l_url=[EPStatusUtility createImageURLWithPath:m_data_item.mphoto];
    [self.m_imgV_top setImageWithURL:l_url];
    NSLog(@"图片地址%@",[l_url absoluteString]);
    [self.m_label_title setText:m_data_item.mtitle];
    [self.m_label_created setText:m_data_item.mcreated];
    [self.m_label_content setText:m_data_item.mcontent];
}

+ (CGFloat)heightForViewWithObject:(id)object inColumnWidth:(CGFloat)columnWidth{
    CGFloat height = 0.0;
    CGFloat width = columnWidth - MARGIN * 2;
    
    EPNewZealandListData *l_data=(EPNewZealandListData*)object;
    // Image
    CGFloat objectWidth = [l_data.mimageWidth floatValue];
    CGFloat objectHeight = [l_data.mimageHeight floatValue];
    CGFloat scaledHeight = floorf(objectHeight / (objectWidth / width));
    height += scaledHeight;
    height += MARGIN;
    
    // title/created
    height += kLabel_Title_Height;
    height += MARGIN;
    
    // Label
    NSString *caption = l_data.mcontent;
    CGSize labelSize = CGSizeZero;
    UIFont *labelFont = [UIFont boldSystemFontOfSize:kLabel_Content_FontSize];
    labelSize = [caption sizeWithFont:labelFont constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
    height += labelSize.height;
    height += MARGIN;
    
    return height;
}
@end
