//
//  LCSpecialNewTableViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSpecialNewTableViewCell.h"
#import "LCMacro.h"


@implementation LCSpecialNewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.specialNewImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 0, SCREEN_WIDTH, 144)];
        _specialNewImageView.image = [UIImage imageNamed:@""];
        _specialNewImageView.backgroundColor = [UIColor cyanColor];
        [self addSubview:_specialNewImageView];
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.3, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.4, SCREEN_WIDTH * 0.06)];
        _titleLabel.text = @"";
        _titleLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        _titleLabel.numberOfLines = 1;
        [self addSubview:_titleLabel];
        
        self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.38, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.24, 1)];
        _lineLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_lineLabel];
        
        
        self.artLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.38, SCREEN_WIDTH * 0.22, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.05)];
        _artLabel.numberOfLines = 1;
        _artLabel.textColor = [UIColor whiteColor];
        _artLabel.text = @"";
        _artLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.490 blue:0.434 alpha:1.000];
        [self addSubview:_artLabel];
        
        self.subscribeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.5, SCREEN_WIDTH * 0.22, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.05)];
        _subscribeLabel.numberOfLines = 1;
        _subscribeLabel.textColor = [UIColor whiteColor];
        _subscribeLabel.text = @"";
        _subscribeLabel.backgroundColor = [UIColor colorWithRed:0.763 green:0.406 blue:1.000 alpha:1.000];
        [self addSubview:_subscribeLabel];

    }
    return self;
}

- (void)setSpecialNewImage:(UIImage *)specialNewImage {
    if (_specialNewImage != specialNewImage) {
        _specialNewImageView.image = specialNewImage;
    }
}

- (void)setTitleText:(NSString *)titleText {
    if (_titleText != titleText) {
        _titleLabel.text = titleText;
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
