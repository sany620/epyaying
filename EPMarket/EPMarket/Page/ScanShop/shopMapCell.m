//
//  Cell.m
//  EPMarket
//
//  Created by Chuang CO.,LTD. Chi on 13-2-17.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "shopMapCell.h"
#import "EPScanShopMapViewController.h"
#import "MapViewController.h"

@implementation shopMapCell
@synthesize distance = _distance;
@synthesize storeName = _storeName;
@synthesize address = _address;
//@synthesize coordinateBtn = _coordinateBtn;


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

- (void)dealloc {
    [_distance release];
    [_storeName release];
    [_address release];
    //[_coordinateBtn release];
    [super dealloc];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

+ (NSString*)nibName {
    return [self description];
}


+ (id)loadFromNIB {
    Class klass = [self class];
    NSString *nibName = [self nibName];
    
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    
    for (id object in objects) {
        if ([object isKindOfClass:klass]) {
            return object;
        }
    }
    
    [NSException raise:@"WrongNibFormat" format:@"Nib for '%@' must contain one UIView, and its class must be '%@'", nibName, NSStringFromClass(klass)];
    
    return nil;
}

@end

//@implementation shopButton
//
//@synthesize shop;
//
//@end
