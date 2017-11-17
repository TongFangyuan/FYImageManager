//
//  FYPrivewCell.m
//  FYImageManagerDemo
//
//  Created by tongfy on 2017/11/16.
//  Copyright © 2017年 tongfy. All rights reserved.
//

#import "FYPrivewCell.h"
#import "UIImage+animatedGIF.h"

@implementation FYPrivewCell


- (void)setModel:(FYAssetModel *)model
{
    _model = model;
    
    PHAsset *asset = model.asset;
    if (@available(iOS 11.0, *)) {
        NSLog(@"%ld",(long)asset.playbackStyle);
    }
    
    PHImageRequestOptions *options = [PHImageRequestOptions new];
    /*
     [[PHImageManager defaultManager] requestImageForAsset:model.asset targetSize:[UIScreen mainScreen].bounds.size contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
     self.iconView.image = result;
     CGFloat imageHeight = result.size.height/result.size.width * [UIScreen mainScreen].bounds.size.width;
     CGFloat imageY = [UIScreen mainScreen].bounds.size.height*0.5 - imageHeight*0.5;
     self.iconView.frame = CGRectMake(0, imageY, [UIScreen mainScreen].bounds.size.width, imageHeight);
     }];
     */
    
    [[PHImageManager defaultManager] requestImageDataForAsset:model.asset  options:options resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
        UIImage *result = [UIImage imageWithData:imageData];
        CGFloat imageHeight = result.size.height/result.size.width * [UIScreen mainScreen].bounds.size.width;
        CGFloat imageY = [UIScreen mainScreen].bounds.size.height*0.5 - imageHeight*0.5;
        self.iconView.frame = CGRectMake(0, imageY, [UIScreen mainScreen].bounds.size.width, imageHeight);
        self.iconView.image = result;
//        NSLog(@"%@",info[@"PHImageFileURLKey"]);
        NSURL *imageFileURL = info[@"PHImageFileURLKey"];
        if ([imageFileURL.absoluteString hasSuffix:@".GIF"] ) {
            self.iconView.image = [UIImage animatedImageWithAnimatedGIFData:imageData];
        } else {
            self.iconView.image = result;
        }
    }];

}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self.contentView addSubview:self.scrollView];
        [self.scrollView addSubview:self.iconView];
         
        self.scrollView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.iconView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
    }
    return self;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.minimumZoomScale = 1;
        _scrollView.maximumZoomScale = 2.5;
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView  = [UIImageView new];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconView;
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.iconView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"%@",view);
    NSLog(@"%f",scale);
    NSLog(@"%@",scrollView);
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat scrollViewWidth = self.scrollView.frame.size.width;
    CGFloat scrollViewHeight = self.scrollView.frame.size.height;
    CGFloat offsetX = (scrollViewWidth > self.scrollView.contentSize.width) ? ((scrollViewWidth - _scrollView.contentSize.width) * 0.5) : 0.0;
    CGFloat offsetY = (scrollViewHeight > _scrollView.contentSize.height) ? ((scrollViewHeight - _scrollView.contentSize.height) * 0.5) : 0.0;
    self.iconView.center = CGPointMake(_scrollView.contentSize.width * 0.5 + offsetX, _scrollView.contentSize.height * 0.5 + offsetY);
}


- (void)prepareForReuse
{
    [super prepareForReuse];
    self.scrollView.zoomScale = 1;
}
@end
