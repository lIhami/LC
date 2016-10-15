//
//  MyCollectionViewCell.m
//  Animation
//
//  Created by Eiwodetianna on 15/6/19.
//  Copyright © 2015年 jinxinliang. All rights reserved.
//

#import "XLImagePageDetailCell.h"
#import "LCMacro.h"

@interface XLImagePageDetailCell ()<UIScrollViewDelegate>


@end

@implementation XLImagePageDetailCell

- (nonnull instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.contentView.frame];
        
        _scrollView.contentSize = self.contentView.frame.size;
        self.scrollView.delegate = self;
        [self.contentView addSubview:_scrollView];
        
        self.contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 145)];
        _contentImageView.userInteractionEnabled = YES;
        [_scrollView addSubview:_contentImageView];
        
        UITapGestureRecognizer *tapGestuerRecogniazer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_contentImageViewSelected)];
        [_contentImageView addGestureRecognizer:tapGestuerRecogniazer];
        
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.4, SCREEN_WIDTH * 0.06)];
        _titleLabel.text = @"";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        //        _titleLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        _titleLabel.numberOfLines = 1;
        [_scrollView addSubview:_titleLabel];
        
        self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.38, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.24, 1)];
        _lineLabel.backgroundColor = [UIColor whiteColor];
        [_scrollView addSubview:_lineLabel];
        
        
        self.artLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.37, SCREEN_WIDTH * 0.22, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.05)];
        _artLabel.numberOfLines = 1;
        _artLabel.textColor = [UIColor whiteColor];
        _artLabel.font = [UIFont systemFontOfSize:12];
        _artLabel.text = @"";
        //        _artLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.490 blue:0.434 alpha:1.000];
        [_scrollView addSubview:_artLabel];
        
        self.subscribeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.51, SCREEN_WIDTH * 0.22, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.05)];
        _subscribeLabel.numberOfLines = 1;
        _subscribeLabel.textColor = [UIColor whiteColor];
        _subscribeLabel.font = [UIFont systemFontOfSize:12];
        _subscribeLabel.text = @"";
        //        _subscribeLabel.backgroundColor = [UIColor colorWithRed:0.763 green:0.406 blue:1.000 alpha:1.000];
        [_scrollView addSubview:_subscribeLabel];
    }
    return self;
}


- (void)setTitleText:(NSString *)titleText {
    if (_titleText != titleText) {
        _titleText = titleText;
        _titleLabel.text = titleText;
    }
}

- (void)setArtText:(NSString *)artText {
    if (_artText != artText) {
        _artText = artText;
        _artLabel.text = artText;
    }
}

- (void)setSubscribeText:(NSString *)subscribeText {
    if (_subscribeText != subscribeText) {
        _subscribeText = subscribeText;
        _subscribeLabel.text = subscribeText;
    }
}


- (void)p_contentImageViewSelected {
    
    [self.delegate XLImagePageDetailCellDidSelectedWithIndex:self.tag - 1000];
}

@end
