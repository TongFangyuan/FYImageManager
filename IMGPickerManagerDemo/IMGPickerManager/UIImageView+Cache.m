//
//  UIImageView+Cache.m
//  IMGPickerManagerDemo
//
//  Created by admin on 2018/5/23.
//  Copyright © 2018年 tongfangyuan. All rights reserved.
//

#import "UIImageView+Cache.h"
#import "UIView+Cache.h"

@implementation UIImageView (Cache)

- (void)img_setImageWithAsset:(nullable PHAsset *)asset
{
    [self img_setImageWithAsset:asset targetSize:[UIScreen mainScreen].bounds.size];
}

- (void)img_setImageWithAsset:(nullable PHAsset *)asset targetSize:(CGSize)targetSize{
    [self img_setImageWithAsset:asset  placeholderImage:nil targetSize:targetSize mode:PHImageContentModeAspectFill completed:nil];
}

- (void)img_setImageWithAsset:(PHAsset *)asset
                   targetSize:(CGSize)targetSize
                    completed:(nullable void(^)(UIImage * _Nullable image,  NSData * _Nullable imageData,  NSDictionary * _Nullable info))completedBlock
{
    [self img_localSetImageWithAsset:asset placeholderImage:nil targetSize:targetSize mode:PHImageContentModeAspectFill setImageBlock:nil completed:completedBlock];
}

- (void)img_setImageWithAsset:(PHAsset *)asset
             placeholderImage:(UIImage *)placeholder
                   targetSize:(CGSize)targetSize
                         mode:(PHImageContentMode)mode
                    completed:(void (^)(UIImage * _Nullable, NSData * _Nullable, NSDictionary * _Nullable))completedBlock
{
    [self img_localSetImageWithAsset:asset placeholderImage:placeholder targetSize:targetSize mode:mode setImageBlock:nil completed:completedBlock];
}

@end
