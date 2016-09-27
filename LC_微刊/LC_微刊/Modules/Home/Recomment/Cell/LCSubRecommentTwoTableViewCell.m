//
//  LCSubRecommentTwoTableViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSubRecommentTwoTableViewCell.h"
#import "LCMacro.h"


@implementation LCSubRecommentTwoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT *0.07, SCREEN_WIDTH * 0.33, SCREEN_WIDTH * 0.27)];
        _imageViewOne.image = [UIImage imageNamed:@""];
        _imageViewOne.backgroundColor = [UIColor cyanColor];
        [self addSubview:_imageViewOne];
        
        self.imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.34, SCREEN_HEIGHT *0.07, SCREEN_WIDTH * 0.33, SCREEN_WIDTH * 0.27)];
        _imageViewTwo.image = [UIImage imageNamed:@""];
        _imageViewTwo.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        [self addSubview:_imageViewTwo];
        
        self.imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.68, SCREEN_HEIGHT *0.07, SCREEN_WIDTH * 0.33, SCREEN_WIDTH * 0.27)];
        _imageViewThree.image = [UIImage imageNamed:@""];
        _imageViewThree.backgroundColor = [UIColor colorWithRed:0.643 green:0.428 blue:1.000 alpha:1.000];
        [self addSubview:_imageViewThree];
        
        self.recommentTypeTwoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.123)];
        _recommentTypeTwoLabel.text = @"";
        _recommentTypeTwoLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.515 blue:0.310 alpha:1.000];
        [self addSubview:_recommentTypeTwoLabel];
        
        self.browseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 0.23, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.07)];
        _browseLabel.backgroundColor = [UIColor colorWithRed:0.450 green:1.000 blue:0.478 alpha:1.000];
        _browseLabel.text = @"";
        [self addSubview:_browseLabel];
        
        self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.15, SCREEN_HEIGHT * 0.23, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.07)];
        _commentLabel.backgroundColor = [UIColor colorWithRed:0.754 green:0.314 blue:1.000 alpha:1.000];
        _commentLabel.text = @"";
        [self addSubview:_commentLabel];
        
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.27, SCREEN_HEIGHT * 0.23, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.07)];
        _authorLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.195 blue:0.261 alpha:1.000];
        [self addSubview:_authorLabel];


    }
    return self;
}


// set传值
- (void)setImageOne:(UIImage *)imageOne {
    if (_imageOne != imageOne) {
        _imageViewOne.image = imageOne;
    }
}

- (void)setImageTwo:(UIImage *)imageTwo {
    if (_imageTwo != imageTwo) {
        _imageViewTwo.image = imageTwo;
    }
}

- (void)setImageThree:(UIImage *)imageThree {
    if (_imageThree != imageThree) {
        _imageViewThree.image = imageThree;
    }
}

- (void)setTypeTwoText:(NSString *)typeTwoText {
    if (_typeTwoText != typeTwoText) {
        _recommentTypeTwoLabel.text = typeTwoText;
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
