//
//  MyTabBar.m
//  LC_微刊
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "MyTabBar.h"
#import "Mybutton.h"

@interface MyTabBar ()

@property (nonatomic, retain)Mybutton *myButton;

@end

@implementation MyTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.myButton = [Mybutton publishButton];
        self.myButton.frame = CGRectMake(0, 0, 70, 70);
        [self addSubview:_myButton];
    }
    return self;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    CGFloat barWidth = self.bounds.size.width;
    CGFloat barHeight = self.bounds.size.height;
    
    self.myButton.center = CGPointMake(barWidth * 0.5, barHeight * 0.68);
    
    CGFloat buttonW = barWidth / 5;
    CGFloat buttonH = barHeight - 2;
    
    CGFloat buttonY = 1;
    
    NSInteger index = 0;
    
    for (UIView *view in self.subviews) {
        NSString *viewClass = NSStringFromClass([view class]);
        if (![viewClass isEqualToString:@"UITabBarButton"]) {
            continue;
        }
        CGFloat buttonX = buttonW *index ;
        
        if (index >= 2) {
            buttonX += buttonW;
        }
        view.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        
        index ++;
    }
    
}


@end
