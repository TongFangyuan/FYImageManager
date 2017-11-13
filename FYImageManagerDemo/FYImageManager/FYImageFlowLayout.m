//
//  FYImageFlowLayout.m
//  FYImageManagerDemo
//
//  Created by tongfy on 2017/11/11.
//  Copyright © 2017年 tongfy. All rights reserved.
//

#import "FYImageFlowLayout.h"

@implementation FYImageFlowLayout

- (instancetype)init
{
    if (self = [super init]) {
        self.minimumLineSpacing = 1;
        self.minimumInteritemSpacing = 1;
    }
    return self;
}

- (CGSize)itemSize
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat width = floor((screenSize.width-3)/4.0);
    return CGSizeMake(width, width);
}

@end
