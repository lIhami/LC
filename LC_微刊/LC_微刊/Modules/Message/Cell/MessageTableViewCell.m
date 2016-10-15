//
//  MessageTableViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "LCMacro.h"

@interface MessageTableViewCell ()


@end

@implementation MessageTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.messageImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.04, SCREEN_HEIGHT * 0.015, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.13)];
        _messageImageView.image = [UIImage imageNamed:@""];
        [self addSubview:_messageImageView];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.2, SCREEN_HEIGHT * 0.02, SCREEN_WIDTH * 0.3, self.bounds.size.height)];
        _messageLabel.text = @"";
        [self addSubview:_messageLabel];
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
       _rightButton.frame = CGRectMake(SCREEN_WIDTH * 0.89, 0, SCREEN_WIDTH * 0.1, 90);
        [_rightButton setTitle:@"〉" forState:UIControlStateNormal];
        _rightButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self addSubview:_rightButton];

        
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
