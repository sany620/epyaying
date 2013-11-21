//
//  EPNewZealandTableCell.h
//  EPMarket
//
//  Created by xx on 13-2-18.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSCollectionViewCell.h"
#import "EPNewZealandListData.h"

@interface EPNewZealandTableCell : PSCollectionViewCell

@property(retain,nonatomic)EPNewZealandListData *m_data_item;
@property(retain,nonatomic)IBOutlet UILabel *m_label_created;
@property(retain,nonatomic)IBOutlet UILabel *m_label_content;
@property(nonatomic,retain)IBOutlet UIImageView *m_imgV_top;
@property(nonatomic,retain)IBOutlet UILabel *m_label_title;
@end
