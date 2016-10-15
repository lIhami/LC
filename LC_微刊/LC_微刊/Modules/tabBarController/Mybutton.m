//
//  Mybutton.m
//  LC_微刊
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Mybutton.h"
#import "LCMacro.h"
#import "LCMyViewController.h"
#import "LCQuestionArticileViewController.h"
#import "AppDelegate.h"

@interface Mybutton ()

@property (nonatomic, strong)UIView *createView;

@property (nonatomic, strong)UIButton *createTaikButton;

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
    self.createTaikButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _createTaikButton.frame = CGRectMake(SCREEN_WIDTH * 0.2, SCREEN_HEIGHT, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1);
    [_createTaikButton setImage:[UIImage imageNamed:@"chuangjianhuati.png"] forState:UIControlStateNormal];
    [_createTaikButton addTarget:self action:@selector(createTaikButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_createView addSubview:_createTaikButton];
    
    UILabel *createTaikLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.21, SCREEN_HEIGHT, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.05)];
    createTaikLabel.text = @"创建话题";
    createTaikLabel.alpha = 0.5;
    createTaikLabel.textAlignment = NSTextAlignmentCenter;
    createTaikLabel.font = [UIFont systemFontOfSize:12];
    [_createView addSubview:createTaikLabel];
    
    
    
    UIButton *createMagazineButton = [UIButton buttonWithType:UIButtonTypeCustom];
    createMagazineButton.frame = CGRectMake(SCREEN_WIDTH * 0.6, SCREEN_HEIGHT, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1);
    [createMagazineButton setImage:[UIImage imageNamed:@"chuangjianweikan.png"] forState:UIControlStateNormal];
    [createMagazineButton addTarget:self action:@selector(createTaikButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_createView addSubview:createMagazineButton];
    
    UILabel *createMagazineLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.56, SCREEN_HEIGHT, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.05)];
    createMagazineLabel.text = @"创建微刊";
    createMagazineLabel.alpha = 0.5;
    createMagazineLabel.textAlignment = NSTextAlignmentCenter;
    createMagazineLabel.font = [UIFont systemFontOfSize:12];
    [_createView addSubview:createMagazineLabel];
    
    
    
    UIButton *questionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    questionButton.frame = CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT + SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1);
    [questionButton setImage:[UIImage imageNamed:@"ruhefawen.png"] forState:UIControlStateNormal];
    [questionButton addTarget:self action:@selector(questionAction:) forControlEvents:UIControlEventTouchUpInside];
    [_createView addSubview:questionButton];
    
    UILabel *questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.05)];
    questionLabel.text = @"如何发文";
    questionLabel.alpha = 0.5;
    questionLabel.textAlignment = NSTextAlignmentCenter;
    questionLabel.font = [UIFont systemFontOfSize:12];
    [_createView addSubview:questionLabel];
    
    
    
    UIButton *articleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    articleButton.frame = CGRectMake(SCREEN_WIDTH * 0.4, SCREEN_HEIGHT + SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1);
    [articleButton setImage:[UIImage imageNamed:@"fabuwenzhang.png"] forState:UIControlStateNormal];
    [articleButton addTarget:self action:@selector(createTaikButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_createView addSubview:articleButton];
    
    UILabel *articleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.4, SCREEN_HEIGHT, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.05)];
    articleLabel.text = @"发布文章";
    articleLabel.alpha = 0.5;
    articleLabel.textAlignment = NSTextAlignmentCenter;
    articleLabel.font = [UIFont systemFontOfSize:12];
    [_createView addSubview:articleLabel];
    
    
    
    UIButton *scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    scanButton.frame = CGRectMake(SCREEN_WIDTH * 0.7, SCREEN_HEIGHT + SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1);
    [scanButton setImage:[UIImage imageNamed:@"shaoyishao.png"] forState:UIControlStateNormal];
    [scanButton addTarget:self action:@selector(createTaikButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_createView addSubview:scanButton];
    
    UILabel *scanLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.7, SCREEN_HEIGHT, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.05)];
    scanLabel.text = @"扫一扫";
    scanLabel.alpha = 0.5;
    scanLabel.textAlignment = NSTextAlignmentCenter;
    scanLabel.font = [UIFont systemFontOfSize:12];
    [_createView addSubview:scanLabel];
    
    
    
    
    [UIView animateWithDuration: 0.2 delay: 0.35 options: UIViewAnimationOptionTransitionNone  animations: ^{
        _createTaikButton.frame = CGRectMake(SCREEN_WIDTH * 0.25, SCREEN_HEIGHT * 0.4, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.2);
        createTaikLabel.frame = CGRectMake(SCREEN_WIDTH * 0.26, SCREEN_HEIGHT * 0.52, SCREEN_WIDTH * 0.18, SCREEN_WIDTH * 0.05);
        
    } completion:nil];
    
    
    
    [UIView animateWithDuration: 0.2 delay: 0.4 options: UIViewAnimationOptionTransitionNone  animations: ^{
        createMagazineButton.frame = CGRectMake(SCREEN_WIDTH * 0.55, SCREEN_HEIGHT * 0.4, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.2);
        createMagazineLabel.frame = CGRectMake(SCREEN_WIDTH * 0.56, SCREEN_HEIGHT * 0.52, SCREEN_WIDTH * 0.18, SCREEN_WIDTH * 0.05);
        
    } completion:nil];
    
    
    [UIView animateWithDuration: 0.2 delay: 0.45 options: UIViewAnimationOptionTransitionNone  animations: ^{
        questionButton.frame = CGRectMake(SCREEN_WIDTH * 0.1, SCREEN_HEIGHT * 0.6, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.2);
        questionLabel.frame = CGRectMake(SCREEN_WIDTH * 0.11, SCREEN_HEIGHT * 0.72, SCREEN_WIDTH * 0.18, SCREEN_WIDTH * 0.05);
        
    } completion:nil];

    
    [UIView animateWithDuration: 0.2 delay: 0.5 options: UIViewAnimationOptionTransitionNone  animations: ^{
        articleButton.frame = CGRectMake(SCREEN_WIDTH * 0.4, SCREEN_HEIGHT * 0.6, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.2);
        articleLabel.frame = CGRectMake(SCREEN_WIDTH * 0.41, SCREEN_HEIGHT * 0.72, SCREEN_WIDTH * 0.18, SCREEN_WIDTH * 0.05);
        
    } completion:nil];

    
    [UIView animateWithDuration: 0.2 delay: 0.55 options: UIViewAnimationOptionTransitionNone  animations: ^{
        scanButton.frame = CGRectMake(SCREEN_WIDTH * 0.7, SCREEN_HEIGHT * 0.6, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.2);
        scanLabel.frame = CGRectMake(SCREEN_WIDTH * 0.71, SCREEN_HEIGHT * 0.72, SCREEN_WIDTH * 0.18, SCREEN_WIDTH * 0.05);
        
    } completion:nil];
    

    
}


- (UIViewController *)ml_viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


#pragma mark - 当前控制器的导航控制器
- (UINavigationController *)naviController {
        
    AppDelegate *appDeleagete = [UIApplication sharedApplication].delegate;
    UITabBarController *tabBarController = (UITabBarController *)appDeleagete.window.rootViewController;
    UINavigationController *navigation = tabBarController.selectedViewController;
    NSLog(@"%@", navigation);
    if ([navigation isKindOfClass:[UINavigationController class]]) {
        return navigation;
    }
    
    return nil;
}

- (void)questionAction:(UIButton *)question {
    
    _createView.hidden = YES;

    LCQuestionArticileViewController *quesVC = [[LCQuestionArticileViewController alloc] init];
    
    [[self naviController] pushViewController:quesVC animated:YES];

}

- (void)createTaikButtonAction:(UIButton *)creatrTaikButton {
    
    
    _createView.hidden = YES;
    
    LCMyViewController *myVC = [[LCMyViewController alloc] init];
    
    [[self ml_viewController] presentViewController:myVC animated:YES completion:nil];
    
    myVC.hidesBottomBarWhenPushed = NO;
    
    
}

// button点击view消失
- (void)nextButtonAction {
    
    _createView.hidden = YES;
    
}




@end
