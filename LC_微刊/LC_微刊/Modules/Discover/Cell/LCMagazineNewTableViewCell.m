//
//  LCMagazineNewTableViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCMagazineNewTableViewCell.h"
#import "LCMacro.h"

@implementation LCMagazineNewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.magNewImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.29, SCREEN_WIDTH * 0.29)];
        _magNewImageView.image = [UIImage imageNamed:@""];
        _magNewImageView.backgroundColor = [UIColor cyanColor];
        UIBlurEffect *blurFirst = [ UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *effectFirstView = [[ UIVisualEffectView alloc] initWithEffect:blurFirst];
        effectFirstView.frame = CGRectMake(0, 0, SCREEN_WIDTH * 0.29, SCREEN_WIDTH * 0.29);
        effectFirstView.alpha = 0.4f;
        
        [_magNewImageView addSubview:effectFirstView];
        [self addSubview:_magNewImageView];
        
        
        self.topMagNewLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.33, SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.48, SCREEN_WIDTH * 0.08)];
        _topMagNewLabel.numberOfLines = 1;
        _topMagNewLabel.textColor = [UIColor colorWithRed:0.373 green:0.494 blue:0.639 alpha:1.000];
        _topMagNewLabel.text = @"  ";
        _topMagNewLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        //        _topMagNewLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        [self addSubview:_topMagNewLabel];
        
        
        self.desLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.33, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.64, SCREEN_WIDTH * 0.11)];
        _desLabel.numberOfLines = 2;
        _desLabel.font = [UIFont systemFontOfSize:15];
        _desLabel.textColor = [UIColor grayColor];
        _desLabel.text = @"";
        //        _desLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.749 blue:0.261 alpha:1.000];
        [self addSubview:_desLabel];
        
        self.articleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.33, SCREEN_WIDTH * 0.27, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.06)];
        _articleLabel.numberOfLines = 1;
        _articleLabel.font = [UIFont systemFontOfSize:13];
        _articleLabel.textColor = [UIColor grayColor];
        _articleLabel.text = @"";
        //        _articleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_articleLabel];
        
        self.subscribeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.46, SCREEN_WIDTH * 0.27, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.06)];
        _subscribeLabel.numberOfLines = 1;
        _subscribeLabel.font = [UIFont systemFontOfSize:13];
        _subscribeLabel.textColor = [UIColor grayColor];
        _subscribeLabel.text = @"";
        //        _subscribeLabel.backgroundColor = [UIColor colorWithRed:0.763 green:0.406 blue:1.000 alpha:1.000];
        [self addSubview:_subscribeLabel];
        
    }
    return self;
}

- (void)setMagNewImage:(UIImage *)magNewImage {
    if (_magNewImage != magNewImage) {
        _magNewImage = magNewImage;
        _magNewImageView.image = magNewImage;
    }
}


- (void)setTopText:(NSString *)topText {
    if (_topText != topText) {
        _topText = topText;
        _topMagNewLabel.text = topText;
    }
}

- (void)setDesText:(NSString *)desText {
    if (_desText != desText) {
        _desText = desText;
        _desLabel.text = desText;
    }
}

- (void)setArticleText:(NSString *)articleText {
    if (_articleText != articleText) {
        _articleText = articleText;
        _articleLabel.text = _articleText;
    }
}

- (void)setSubscribeText:(NSString *)subscribeText {
    if (_subscribeText != subscribeText) {
        _subscribeText = subscribeText;
        _subscribeLabel.text = subscribeText;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
