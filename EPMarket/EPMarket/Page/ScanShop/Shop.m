//
//  Shop.m
//  EPMarket
//
//  Created by Chuang CO.,LTD. Chi on 13-2-19.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "Shop.h"

@implementation Shop
@synthesize shopName,lat,lng,address,distance;

-(void)dealloc{
    self.distance = nil;
    self.shopName = nil;
    self.lng = nil;
    self.lat= nil;
    self.address =nil;
    [super dealloc ];
}

@end
