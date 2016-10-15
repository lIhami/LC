//
//  LCZoomDisScrollView.m
//  LC_微刊
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCZoomDisScrollView.h"

@interface LCZoomDisScrollView ()

@property (nonatomic, retain)UIImageView *imageView;

@end

@implementation LCZoomDisScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
      
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    if (_image != image) {
        _imageView.image = image;
    }
}

@end
