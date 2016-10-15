//
//  LCSelectMagazineTypeFourTableViewCell.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/9.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSelectMagazineTypeFourTableViewCell.h"
#import "LCMacro.h"

@implementation LCSelectMagazineTypeFourTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.01, SCREEN_WIDTH * 0.94, SCREEN_WIDTH * 0.1)];
        _titleLabel.numberOfLines = 2;
        _titleLabel.text = @"";
        [self addSubview:_titleLabel];
        
        
        self.imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH * 0.11, SCREEN_WIDTH, SCREEN_WIDTH * 0.45)];
        _imageViewOne.image = [UIImage imageNamed:@"background.png"];
        [self addSubview:_imageViewOne];
        
        
        self.viewLbel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.565, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.08)];
        _viewLbel.text = @"";
        _viewLbel.font = [UIFont systemFontOfSize:12];
        _viewLbel.textColor = [UIColor lightGrayColor];
        [self addSubview:_viewLbel];
        
        
        self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.19, SCREEN_WIDTH * 0.565, SCREEN_WIDTH * 0.15  , SCREEN_WIDTH * 0.08)];
        _commentLabel.text = @"";
        _commentLabel.font = [UIFont systemFontOfSize:12];
        _commentLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_commentLabel];
        
        
        
    }
    return self;
}


#pragma mark - set传值方法
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
