//
//  LCSubRecommentOneTableViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSubRecommentOneTableViewCell.h"
#import "LCMacro.h"

@implementation LCSubRecommentOneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.recommentTypeOneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.65, SCREEN_HEIGHT * 0.015, SCREEN_WIDTH * 0.31, SCREEN_WIDTH * 0.24)];
        _recommentTypeOneImageView.image = [UIImage imageNamed:@""];
//        _recommentTypeOneImageView.backgroundColor = [UIColor cyanColor];
        [self addSubview:_recommentTypeOneImageView];
        
        
        self.recommentTypeOneLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.04, SCREEN_HEIGHT * 0.015, SCREEN_WIDTH * 0.61, SCREEN_WIDTH * 0.17)];
//        _recommentTypeOneLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        _recommentTypeOneLabel.text = @"";
        _recommentTypeOneLabel.numberOfLines = 2;
//        _recommentTypeOneLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_recommentTypeOneLabel];
        
        
        self.browseLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.04, SCREEN_HEIGHT * 0.11, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.07)];
//        _browseLabel.backgroundColor = [UIColor colorWithRed:0.450 green:1.000 blue:0.478 alpha:1.000];
        _browseLabel.text = @"";
        [self addSubview:_browseLabel];
        
        self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.19, SCREEN_HEIGHT * 0.11, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.07)];
//        _commentLabel.backgroundColor = [UIColor colorWithRed:0.754 green:0.314 blue:1.000 alpha:1.000];
        _commentLabel.text = @"";
        [self addSubview:_commentLabel];
        
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.31, SCREEN_HEIGHT * 0.11, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.07)];
//        _authorLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.195 blue:0.261 alpha:1.000];
        [self addSubview:_authorLabel];
        
    }
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//    CGSize size = _recommentTypeOneImageView.image.size;
//    CGFloat scale = self.contentView.frame.size.width / size.width;
//    CGFloat height = size.height *scale;
//    
//   _recommentTypeOneImageView.frame = CGRectMake(SCREEN_WIDTH * 0.6,SCREEN_HEIGHT * 0.05, _recommentTypeOneImageView.frame.size.width, height);
//   _recommentTypeOneLabel.frame = CGRectMake(_recommentTypeOneImageView.frame.size.width * 0.07, height * 0.05, _recommentTypeOneImageView.frame.size.width * 2, height * 0.8);
//   _browseLabel.frame = CGRectMake(_recommentTypeOneImageView.frame.size.width * 0.07, height * 0.8, _recommentTypeOneImageView.frame.size.width * 0.5, height * 0.2);
//   _commentLabel.frame = CGRectMake(_recommentTypeOneImageView.frame.size.width * 0.5, height * 0.8, _recommentTypeOneImageView.frame.size.width * 0.5, height * 0.2);
//   _authorLabel.frame = CGRectMake(_recommentTypeOneImageView.frame.size.width, height * 0.8, _recommentTypeOneImageView.frame.size.width * 0.5, height * 0.2);
//    [_recommentTypeOneLabel sizeToFit];
//    [_browseLabel sizeToFit];
//    [_commentLabel sizeToFit];
//    [_authorLabel sizeToFit];
//    
//}

#pragma mark - set方法传值
- (void)setRecommentTypeOneImage:(UIImage *)recommentTypeOneImage {
    if (_recommentTypeOneImage != recommentTypeOneImage) {
        _recommentTypeOneImageView.image = recommentTypeOneImage;
    }
}

- (void)setRecommentTitleText:(NSString *)recommentTitleText {
    if (_recommentTitleText != recommentTitleText) {
        _recommentTypeOneLabel.text = recommentTitleText;
    }
}

- (void)setBrowseText:(NSString *)browseText {
    if (_browseText != browseText) {
        _browseLabel.text = browseText;
    }
}

- (void)setCommentText:(NSString *)commentText {
    if (_commentText != commentText) {
        _commentLabel.text = commentText;
    }
}

- (void)setAuthorText:(NSString *)authorText {
    if (_authorText != authorText) {
        _authorLabel.text = authorText;
    }
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
