//
//  LCAllMagazineTableViewCell.m
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCAllMagazineTableViewCell.h"
#import "LCMacro.h"

@implementation LCAllMagazineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.82, SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.15, SCREEN_WIDTH * 0.06)];
        _rightLabel.text = @"+订阅";
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel.textColor = [UIColor colorWithRed:0.745 green:0.184 blue:0.208 alpha:1.000];
        
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){0.745,0.184,0.208,1});
        [ _rightLabel.layer setBorderColor:color];
        CGColorRelease(color) ;
        _rightLabel.font = [UIFont systemFontOfSize:15];
        _rightLabel.layer.cornerRadius = 5.0f;
        _rightLabel.layer.borderWidth = 2.0f;
        [self addSubview:_rightLabel];
        
    }
    return self;
}


@end
