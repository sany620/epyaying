//
//  CHCDataWorld.h
//  EPMarket
//
//  Created by xx on 13-2-16.
//  Copyright (c) 2013年 com.chichuang. All rights reserved.
//

#define KDATAWORLD [CHCDataWorld shareData]
#import <Foundation/Foundation.h>
#import "CCSHttpEngine.h"

@interface CHCDataWorld : NSObject{
    CCSHttpEngine *m_httpEngine_chc;
}
@property(nonatomic,retain)CCSHttpEngine *m_httpEngine_chc;

// 单例模式
+ (CHCDataWorld*)shareData;

// 绮美服务器Http请求引擎
- (CCSHttpEngine *)httpEngineCHC;
@end
