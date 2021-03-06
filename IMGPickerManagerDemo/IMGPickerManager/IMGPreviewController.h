//
//  FYImagePrivewController.h
//  FYImageManagerDemo
//
//  Created by tongfangyuan on 2017/11/15.
//  Copyright © 2017年 tongfangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMGConfigManager.h"
#import <Photos/Photos.h>

typedef void(^IMGPrivewCancelBlock)(NSArray *result);


@interface IMGPreviewController : UIViewController

/// 所有资源数组
@property (nonatomic,strong) NSArray<PHAsset *> *assets;
/// 初始选中的资源数组
@property (nonatomic,strong) NSMutableArray<PHAsset *> *originalSelectedAssets;
/// 当前选中的 indexPath
@property (nonatomic,strong) NSIndexPath *selectIndexPath;
/// 取消选择
@property (nonatomic,copy) IMGPrivewCancelBlock cancelBlock;

@end
