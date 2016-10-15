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
        
        self.magRecomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.01, SCREEN_WIDTH * 0.37, SCREEN_WIDTH * 0.365)];
        _magRecomImageView.image = [UIImage imageNamed:@"background.png"];
        UIBlurEffect *blurFirst = [ UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *effectFirstView = [[ UIVisualEffectView alloc] initWithEffect:blurFirst];
        effectFirstView.frame = CGRectMake(SCREEN_WIDTH * 0.005, SCREEN_WIDTH * 0.005, SCREEN_WIDTH * 0.36, SCREEN_WIDTH * 0.355);
        effectFirstView.alpha = 0.4f;
        [_magRecomImageView addSubview:effectFirstView];
        [self addSubview:_magRecomImageView];
        
        
        self.topMagRecomLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.31, SCREEN_WIDTH * 0.07)];
        _topMagRecomLabel.numberOfLines = 1;
        _topMagRecomLabel.textColor = [UIColor whiteColor];
        _topMagRecomLabel.textAlignment = NSTextAlignmentCenter;
        _topMagRecomLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _topMagRecomLabel.text = @"";
        _topMagRecomLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_topMagRecomLabel];
        
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.11, SCREEN_WIDTH * 0.38, SCREEN_WIDTH * 0.25, SCREEN_WIDTH * 0.06)];
        _nameLabel.numberOfLines = 1;
        _nameLabel.textColor = [UIColor grayColor];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.text = @"";
        [self addSubview:_nameLabel];
        
        
        self.artLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.07, SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.06)];
        _artLabel.numberOfLines = 1;
        _artLabel.textColor = [UIColor whiteColor];
        _artLabel.textAlignment = NSTextAlignmentCenter;
        _artLabel.font = [UIFont systemFontOfSize:11];
        _artLabel.text = @"";
        [self addSubview:_artLabel];
        
        
        self.subscribeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.23, SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.06)];
        _subscribeLabel.numberOfLines = 1;
        _subscribeLabel.textColor = [UIColor whiteColor];
        _subscribeLabel.font = [UIFont systemFontOfSize:11];
        _subscribeLabel.textAlignment = NSTextAlignmentCenter;
        _subscribeLabel.text = @"";
        [self addSubview:_subscribeLabel];
        
        
        self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.38, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.06)];
        _userImageView.image = [UIImage imageNamed:@"background.png"];
        
        _userImageView.clipsToBounds = YES;
        [self addSubview:_userImageView];
        
    }
    return self;
}


#pragma mark - set传值
- (void)setMagRecomImage:(UIImage *)magRecomImage {
    if (_magRecomImage != magRecomImage) {
        _magRecomImage = magRecomImage;
        _magRecomImageView.image = magRecomImage;
    }
}


- (void)setTopText:(NSString *)topText {
    if (_topText != topText) {
        _topText = topText;
        _topMagRecomLabel.text = topText;
    }
}

- (void)setNameText:(NSString *)nameText {
    if (_nameText != nameText) {
        _nameText = nameText;
        _nameLabel.text = nameText;
    }
}

- (void)setArtText:(NSString *)artText {
    if (_artText != artText) {
        _artText =artText;
        _artLabel.text = artText;
    }
}

- (void)setSubscribeText:(NSString *)subscribeText {
    if (_subscribeText != subscribeText) {
        _subscribeText = subscribeText;
        _subscribeLabel.text = subscribeText;
    }
}

- (void)setUserImage:(UIImage *)userImage {
    if (_userImage != userImage) {
        _userImage = userImage;
        _userImageView.image = userImage;
    }
}

- (void)setCornerRadius:(float)cornerRadius {
    if (_cornerRadius != cornerRadius) {
        _cornerRadius = cornerRadius;
        _userImageView.layer.cornerRadius = _cornerRadius;
    }
}


@end
