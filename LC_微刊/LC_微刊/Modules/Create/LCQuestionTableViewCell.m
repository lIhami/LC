//
//  LCQuestionTableViewCell.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/11.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCQuestionTableViewCell.h"
#import "LCMacro.h"

@implementation LCQuestionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 标题
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, 0, SCREEN_WIDTH * 0.8, 60)];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.text = @"";
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_titleLabel];
        
        
        // 右边符号
        self.rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.95, 0, SCREEN_WIDTH * 0.05, 60)];
        _rightLabel.text = @"〉";
        _rightLabel.textColor = [UIColor grayColor];
        [self addSubview:_rightLabel];
    }
    return self;
}


#pragma mark - set传值方法
- (void)setTitleText:(NSString *)titleText {

    if (_titleText != titleText) {
        _titleText = titleText;
        _titleLabel.text = titleText;
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
