//
//  Mybutton.m
//  LC_微刊
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Mybutton.h"
#import "LCMacro.h"

@interface Mybutton ()

@property (nonatomic, strong)UIView *createView;

@end

@implementation Mybutton

- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(self.bounds.size.width / 2 - 25, 10, 50, 35);
    
}

+ (instancetype)publishButton {
    
    Mybutton *button = [[Mybutton alloc] init];
    button.tag = 1001;
    [button setImage:[UIImage imageNamed:@"create.png"] forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return button;

}

- (void)buttonAction {
    
       NSLog(@"疼疼疼");

    // 创建临时View
    self.createView = [[UIView alloc] initWithFrame:SCREEN_RECT];
    // 模糊效果
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    effectView.frame = _createView.frame;
    [_createView addSubview:effectView];
    [self.window addSubview:_createView];
    
    // 创建分割线
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 0.939, SCREEN_WIDTH, SCREEN_HEIGHT * 0.001)];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    [effectView addSubview:lineLabel];
    
    // 创建取消键
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(0, SCREEN_HEIGHT * 0.94, SCREEN_WIDTH, SCREEN_HEIGHT * 0.05);
    [nextButton setTitle:@"取 消" forState:UIControlStateNormal];
    nextButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    [nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [effectView addSubview:nextButton];
    [nextButton addTarget:self action:@selector(nextButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 动画
    
}

// button点击view消失
- (void)nextButtonAction {
    
    _createView.hidden = YES;
    
}


@end
