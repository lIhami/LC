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
        self.recommentTypeOneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.6, SCREEN_HEIGHT * 0.015, SCREEN_WIDTH * 0.36, SCREEN_WIDTH * 0.295)];
        _recommentTypeOneImageView.image = [UIImage imageNamed:@""];
        _recommentTypeOneImageView.backgroundColor = [UIColor cyanColor];
        [self addSubview:_recommentTypeOneImageView];
        
        
        self.recommentTypeOneLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.04, SCREEN_HEIGHT * 0.015, SCREEN_WIDTH * 0.54, SCREEN_WIDTH * 0.17)];
        //        _recommentTypeOneLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        _recommentTypeOneLabel.text = @"";
        _recommentTypeOneLabel.numberOfLines = 2;
        _recommentTypeOneLabel.font = [UIFont systemFontOfSize:18];
        //        _recommentTypeOneLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_recommentTypeOneLabel];
        
        
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.04, SCREEN_HEIGHT * 0.14, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.07)];
        _authorLabel.text = @"";
        _authorLabel.font = [UIFont systemFontOfSize:15];
        _authorLabel.textColor = [UIColor lightGrayColor];
        //        _authorLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.195 blue:0.261 alpha:1.000];
        [self addSubview:_authorLabel];
        
    }
    return self;
}


#pragma mark - set方法传值
- (void)setRecommentTypeOneImage:(UIImage *)recommentTypeOneImage {
    if (_recommentTypeOneImage != recommentTypeOneImage) {
        _recommentTypeOneImage = recommentTypeOneImage;
        _recommentTypeOneImageView.image = recommentTypeOneImage;
    }
}

- (void)setRecommentTitleText:(NSString *)recommentTitleText {
    if (_recommentTitleText != recommentTitleText) {
        _recommentTitleText = recommentTitleText;
        _recommentTypeOneLabel.text = recommentTitleText;
    }
}


- (void)setAuthorText:(NSString *)authorText {
    if (_authorText != authorText) {
        _authorText = authorText;
        _authorLabel.text = authorText;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
