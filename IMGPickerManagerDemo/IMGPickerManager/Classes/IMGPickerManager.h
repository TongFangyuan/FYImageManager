//
//  IMGPickerTool.h
//  FYImageManagerDemo
//
//  Created by tongfangyuan on 2018/3/28.
//  Copyright © 2018年 tongfangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PHAsset;
@interface IMGPickerManager : NSObject

+ (void)startChoose:(void(^)(NSArray<PHAsset *> *results,NSError *error))completeBlock;

@end

extern NSNotificationName const IMGPickerManagerWillPickCompleteNotification;
extern NSNotificationName const IMGPickerManagerCancelPickNotification;

