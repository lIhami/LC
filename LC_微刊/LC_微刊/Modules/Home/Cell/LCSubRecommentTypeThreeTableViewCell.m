//
//  LCSubRecommentTypeThreeTableViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/24.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSubRecommentTypeThreeTableViewCell.h"
#import "LCMacro.h"

@implementation LCSubRecommentTypeThreeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.typeThreeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.14)];
        _typeThreeLabel.text = @"";
        _typeThreeLabel.backgroundColor = [UIColor cyanColor];
        [self addSubview:_typeThreeLabel];
        
        self.mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH * 0.14, SCREEN_WIDTH, SCREEN_WIDTH * 0.5)];
        _mainImageView.image = [UIImage imageNamed:@""];
        _mainImageView.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        [self addSubview:_mainImageView];
        
        self.browseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 0.365, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.07)];
        _browseLabel.backgroundColor = [UIColor colorWithRed:0.450 green:1.000 blue:0.478 alpha:1.000];
        _browseLabel.text = @"";
        [self addSubview:_browseLabel];
        
        self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.15, SCREEN_HEIGHT * 0.365, SCREEN_WIDTH * 0.12, SCREEN_WIDTH * 0.07)];
        _commentLabel.backgroundColor = [UIColor colorWithRed:0.754 green:0.314 blue:1.000 alpha:1.000];
        _commentLabel.text = @"";
        [self addSubview:_commentLabel];
        
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.27, SCREEN_HEIGHT * 0.365, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.07)];
        _authorLabel.backgroundColor = [UIColor colorWithRed:1.000 green:0.195 blue:0.261 alpha:1.000];
        [self addSubview:_authorLabel];

    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
