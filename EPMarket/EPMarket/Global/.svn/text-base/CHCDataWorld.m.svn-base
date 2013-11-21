//
//  CHCDataWorld.m
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#import "CHCDataWorld.h"
static CHCDataWorld* s_dataWorld;

@implementation CHCDataWorld
@synthesize m_httpEngine_chc;
// 单例模式
+ (CHCDataWorld*)shareData{
    @synchronized(self)
    {
        if (s_dataWorld==nil) {
            s_dataWorld = [[CHCDataWorld alloc] init];
            
        }
    }
    return s_dataWorld;
}

// 绮美服务器Http请求引擎
- (CCSHttpEngine *)httpEngineCHC{
    @synchronized(self)
	{
        
		if (m_httpEngine_chc==nil)
		{
            //非ARC保存一次
			m_httpEngine_chc = [[CCSHttpEngine engineWithHeaderParams:nil] retain];
            [m_httpEngine_chc setM_timeInterval_timeout:5.0f];
		}
	}
	return m_httpEngine_chc;
}

@end
