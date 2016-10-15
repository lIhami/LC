//
//  LCSelectMagazineTypeThreeTableViewCell.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/9.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSelectMagazineTypeThreeTableViewCell.h"
#import "LCMacro.h"

@implementation LCSelectMagazineTypeThreeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.01, SCREEN_WIDTH * 0.94, SCREEN_WIDTH * 0.12)];
        _titleLabel.numberOfLines = 2;
        _titleLabel.text = @"";
        [self addSubview:_titleLabel];
        
        
        self.imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.33, SCREEN_WIDTH * 0.25)];
        _imageViewOne.image = [UIImage imageNamed:@"background.png"];
        [self addSubview:_imageViewOne];

        
        self.imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.335, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.33, SCREEN_WIDTH * 0.25)];
        _imageViewTwo.image = [UIImage imageNamed:@"background.png"];
        [self addSubview:_imageViewTwo];
        
        
        self.imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.67, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.33, SCREEN_WIDTH * 0.25)];
        _imageViewThree.image = [UIImage imageNamed:@"background.png"];
        [self addSubview:_imageViewThree];
        
        
        self.viewLbel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.385, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.08)];
        _viewLbel.text = @"";
        _viewLbel.font = [UIFont systemFontOfSize:12];
        _viewLbel.textColor = [UIColor lightGrayColor];
        [self addSubview:_viewLbel];
        
        
        self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.19, SCREEN_WIDTH * 0.385, SCREEN_WIDTH * 0.15  , SCREEN_WIDTH * 0.08)];
        _commentLabel.text = @"";
        _commentLabel.font = [UIFont systemFontOfSize:12];
        _commentLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_commentLabel];
        
        
    }
    return self;
}


#pragma mark - set方法传值
- (void)setTitleText:(NSString *)titleText {
    if (_titleText != titleText) {
        _titleText = titleText;
        _titleLabel.text = _titleText;
    }
}

- (void)setViewText:(NSString *)viewText {
    if (_viewText != viewText) {
        _viewText = viewText;
        _viewLbel.text = viewText;
    }
}

- (void)setCommentText:(NSString *)commentText {
    if (_commentText != commentText) {
        _commentText = commentText;
        _commentLabel.text = commentText;
    }
}


- (void)setImageOne:(UIImage *)imageOne {
    if (_imageOne != imageOne) {
        _imageOne = imageOne;
        _imageViewOne.image = imageOne;
    }
}

- (void)setImageTwo:(UIImage *)imageTwo {
    if (_imageTwo != imageTwo) {
        _imageTwo = imageTwo;
        _imageViewTwo.image = imageTwo;
    }
}

- (void)setImageThree:(UIImage *)imageThree {
    if (_imageThree != imageThree) {
        _imageThree = imageThree;
        _imageViewThree.image = imageThree;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
