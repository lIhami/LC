//
//  LCMyTitleCollectionViewCell.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCMyTitleCollectionViewCell.h"

@implementation LCMyTitleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLable = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        _titleLable.text = @"";
        _titleLable.textColor = [UIColor lightGrayColor];
        [self addSubview:_titleLable];
        
        self.lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = [UIColor colorWithRed:0.737 green:0.188 blue:0.212 alpha:1.000];
        [self addSubview:_lineLabel];
        
        
    }
    return self;
}

- (void)setText:(NSString *)text {
    if (_text != text) {
        _titleLable.text = text;
    }
    if ([_titleLable.text isEqualToString:@"登录"]) {
        _titleLable.textColor = [UIColor whiteColor];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    } else {
        _titleLable.textColor = [UIColor lightGrayColor];
        _titleLable.font = [UIFont systemFontOfSize:17];
        _lineLabel.backgroundColor = [UIColor clearColor];
    }
}

#pragma mark - 切换标题的判断
- (void)setDidSelected:(BOOL)didSelected {
    
    if (didSelected == YES) {
        _titleLable.textColor = [UIColor whiteColor];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    } else {
        _titleLable.textColor = [UIColor lightGrayColor];
        _titleLable.font = [UIFont systemFontOfSize:17];
        _lineLabel.backgroundColor = [UIColor clearColor];
    }
}


@end
