//
//  LCSubMagRecomCollectionViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSubMagRecomCollectionViewCell.h"
#import "LCMacro.h"

@implementation LCSubMagRecomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.magRecomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.01, SCREEN_WIDTH * 0.365, SCREEN_WIDTH * 0.365)];
        _magRecomImageView.image = [UIImage imageNamed:@""];
        _magRecomImageView.backgroundColor = [UIColor cyanColor];
        [self addSubview:_magRecomImageView];
        
        
        self.topMagRecomLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.11, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.07)];
        _topMagRecomLabel.numberOfLines = 1;
        _topMagRecomLabel.textColor = [UIColor colorWithRed:0.373 green:0.494 blue:0.639 alpha:1.000];
        _topMagRecomLabel.text = @"";
        _topMagRecomLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        [self addSubview:_topMagRecomLabel];
        
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.38, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.06)];
        _nameLabel.numberOfLines = 2;
        _nameLabel.textColor = [UIColor lightGrayColor];
        _nameLabel.text = @"";
        _nameLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.749 blue:0.261 alpha:1.000];
        [self addSubview:_nameLabel];
        
        self.artLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.07, SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.06)];
        _artLabel.numberOfLines = 1;
        _artLabel.textColor = [UIColor lightGrayColor];
        _artLabel.text = @"";
        _artLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.490 blue:0.434 alpha:1.000];
        [self addSubview:_artLabel];
        
        self.subscribeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.23, SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.06)];
        _subscribeLabel.numberOfLines = 1;
        _subscribeLabel.textColor = [UIColor lightGrayColor];
        _subscribeLabel.text = @"";
        _subscribeLabel.backgroundColor = [UIColor colorWithRed:0.763 green:0.406 blue:1.000 alpha:1.000];
        [self addSubview:_subscribeLabel];
        
        self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.38, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.06)];
        _userImageView.image = [UIImage imageNamed:@""];
        _userImageView.backgroundColor = [UIColor colorWithRed:0.423 green:0.980 blue:1.000 alpha:1.000];
        [self addSubview:_userImageView];

    }
    return self;
}

- (void)setMagRecomImage:(UIImage *)magRecomImage {
    if (_magRecomImage != magRecomImage) {
        _magRecomImageView.image = magRecomImage;
    }
}


- (void)setTopText:(NSString *)topText {
    if (_topText != topText) {
        _topMagRecomLabel.text = topText;
    }
}

- (void)setNameText:(NSString *)nameText {
    if (_nameText != nameText) {
        _nameLabel.text = nameText;
    }
}

- (void)setArtText:(NSString *)artText {
    if (_artText != artText) {
        _artLabel.text = artText;
    }
}

- (void)setSubscribeText:(NSString *)subscribeText {
    if (_subscribeText != subscribeText) {
        _subscribeLabel.text = subscribeText;
    }
}

- (void)setUserImage:(UIImage *)userImage {
    if (_userImage != userImage) {
        _userImageView.image = userImage;
    }
}


@end
