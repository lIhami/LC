//
//  LCSpecialRecommendZoomScrollView.m
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSpecialRecommendZoomScrollView.h"

@interface LCSpecialRecommendZoomScrollView ()

@property (nonatomic, strong)UIImageView *imageView;

@end

@implementation LCSpecialRecommendZoomScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
    }
    return self;
}


- (void)setImage:(UIImage *)image {
    if (_image != image) {
        _image = image;
        _imageView.image = image;
    }
}

@end
