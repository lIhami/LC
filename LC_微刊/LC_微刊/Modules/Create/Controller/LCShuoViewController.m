//
//  LCShuoViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/11.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCShuoViewController.h"
#import "LCMacro.h"

@interface LCShuoViewController ()

@end

@implementation LCShuoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *imageArray = [NSMutableArray array];
    
    
    // 顶部导航view
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    
    // 顶部标题label
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.6, SCREEN_WIDTH * 0.08)];
    topLabel.text = _titleText;
    topLabel.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:topLabel];
    
    
    // 顶部返回button
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.05, SCREEN_WIDTH * 0.1);
    [backButton setTitle:@"ㄑ" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    // 向数组里添加数组
    for (int i = 0; i <= 7; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [imageArray addObject:image];
        
    }
    
    
    // 底部scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    
    
    // 添加图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imageView.image = imageArray[_number];
    [scrollView addSubview:imageView];
    
    scrollView.contentSize = CGSizeMake(0, imageView.image.size.height - SCREEN_HEIGHT + 64);
    
}


// 点击button返回页面
- (void)backButtonAction:(UIButton *)backButton {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
