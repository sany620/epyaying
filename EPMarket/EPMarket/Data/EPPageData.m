//
//  EPPageData.m
//  EPMarket
//
//  Created by xx on 13-2-17.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPPageData.h"

@implementation EPPageData
@synthesize mallCount;
@synthesize mcurrPage;
@synthesize mpageSize;

- (void)dealloc {
    self.mpageSize=nil;
    self.mcurrPage=nil;
    self.mallCount=nil;
    [super dealloc];
}

@end
