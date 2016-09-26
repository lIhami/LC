//
//  LCSubTaikCollectionViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSubTaikCollectionViewCell.h"
#import "LCMacro.h"

@implementation LCSubTaikCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.taikImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.09, SCREEN_HEIGHT * 0.03, SCREEN_WIDTH * 0.22, SCREEN_WIDTH * 0.22)];
        _taikImageView.image = [UIImage imageNamed:@""];
        _taikImageView.backgroundColor = [UIColor cyanColor];
        [self addSubview:_taikImageView];
        
        
        self.titleTailLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.05, SCREEN_HEIGHT * 0.17, SCREEN_WIDTH * 0.3, SCREEN_HEIGHT * 0.04)];
        _titleTailLabel.text = @"";
        _titleTailLabel.textAlignment = NSTextAlignmentCenter;
        _titleTailLabel.font = [ UIFont systemFontOfSize:16];
        _titleTailLabel.textColor = [UIColor colorWithRed:0.298 green:0.431 blue:0.647 alpha:1.000];
        [self addSubview:_titleTailLabel];
        
        
        self.articleTailLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.07, SCREEN_HEIGHT * 0.21, SCREEN_WIDTH * 0.14, SCREEN_HEIGHT * 0.03)];
        _articleTailLabel.text = @"";
        _articleTailLabel.font = [ UIFont systemFontOfSize:12];
        _articleTailLabel.textAlignment = NSTextAlignmentCenter;
        _articleTailLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_articleTailLabel];
        
        
        self.attentionTailLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.2, SCREEN_HEIGHT * 0.21, SCREEN_WIDTH * 0.14, SCREEN_HEIGHT * 0.03)];
        _attentionTailLabel.text = @"";
        _attentionTailLabel.font = [ UIFont systemFontOfSize:12];
        _attentionTailLabel.textAlignment = NSTextAlignmentCenter;
        _attentionTailLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_attentionTailLabel];
        
    }
    return self;
}


#pragma mark - set传值
- (void)setTaikImage:(UIImage *)taikImage {
    if (_taikImage != taikImage) {
        _taikImageView.image = taikImage;
    }
}


- (void)setTitleTailText:(NSString *)titleTailText {
    if (_titleTailText != titleTailText) {
        _titleTailLabel.text = titleTailText;
    }
}

- (void)setArticleTailText:(NSString *)articleTailText {
    if (_articleTailText != articleTailText) {
        _articleTailLabel.text = articleTailText;
    }
}

- (void)setAttentionTailText:(NSString *)attentionTailText {
    if (_attentionTailText != attentionTailText) {
        _attentionTailLabel.text = attentionTailText;
    }
}

@end
