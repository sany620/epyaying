//
//  HUDImageView.m
//  HudDemo
//
//  Created by user on 12-9-7.
//  Copyright (c) 2012年 Matej Bukovinski. All rights reserved.
//

#import "HUDImageView.h"

@implementation HUDImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray* animations = [NSMutableArray arrayWithCapacity:19];
        for (int i = 1; i < 19; i++) {
            NSString* imageName = [NSString stringWithFormat:@"loading%d.png", i];
            [animations addObject:[UIImage imageNamed:imageName]];
        }
        self.animationImages = animations; // 每帧图片，对象是UIImage
        // imageView.animationRepeatCount = 100; // 播放次数
        self.animationDuration = 2.80f; // 动画播一次的总时间
        [self startAnimating]; // 开始播放

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
