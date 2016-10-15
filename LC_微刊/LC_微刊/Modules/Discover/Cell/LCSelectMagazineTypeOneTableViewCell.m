//
//  LCSelectMagazineTypeOneTableViewCell.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/9.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSelectMagazineTypeOneTableViewCell.h"
#import "LCMacro.h"

@implementation LCSelectMagazineTypeOneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.04, SCREEN_WIDTH * 0.94, SCREEN_WIDTH * 0.1)];
        _titleLabel.text = @"";
        [self addSubview:_titleLabel];
        
        
        self.viewLbel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.165, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.08)];
        _viewLbel.text = @"";
        _viewLbel.font = [UIFont systemFontOfSize:12];
        _viewLbel.textColor = [UIColor lightGrayColor];
        [self addSubview:_viewLbel];
        
        
        self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.19, SCREEN_WIDTH * 0.165, SCREEN_WIDTH * 0.15  , SCREEN_WIDTH * 0.08)];
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
