//
//  LCTitleCollectionViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCTitleCollectionViewCell.h"

@implementation LCTitleCollectionViewCell

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
    if ([_titleLable.text isEqualToString:@"推荐"]) {
        _titleLable.textColor = [UIColor colorWithRed:0.745 green:0.184 blue:0.208 alpha:1.000];
        _lineLabel.backgroundColor = [UIColor colorWithRed:0.745 green:0.184 blue:0.208 alpha:1.000];
    } else {
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.font = [UIFont systemFontOfSize:17];
        _lineLabel.backgroundColor = [UIColor clearColor];
    }
}

#pragma mark - 切换标题的判断
- (void)setDidSelected:(BOOL)didSelected {
    
    if (didSelected == YES) {
        _titleLable.textColor = [UIColor colorWithRed:0.745 green:0.184 blue:0.208 alpha:1.000];
        _lineLabel.backgroundColor = [UIColor colorWithRed:0.788 green:0.157 blue:0.212 alpha:1.000];
    } else {
        _titleLable.textColor = [UIColor blackColor];
        _titleLable.font = [UIFont systemFontOfSize:17];
        _lineLabel.backgroundColor = [UIColor clearColor];
    }
}



@end
