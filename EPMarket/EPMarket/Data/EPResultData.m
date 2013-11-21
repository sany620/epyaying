//
//  EPResultData.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "EPResultData.h"

@implementation EPResultData
@synthesize mstate;
@synthesize mmessage;

- (void)dealloc {
    [mmessage release];
    [mstate release];
    [super dealloc];
}

@end
