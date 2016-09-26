//
//  ViewController.m
//  LC_微刊
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "LC_RecommendViewController.h"
#import "AppDelegate.h"
#import "TabBarViewController.h"

#define WIDTH (NSInteger)self.view.bounds.size.width
#define HEIGHT (NSInteger)self.view.bounds.size.height

@interface ViewController ()

<
UIScrollViewDelegate
>
{
    UIPageControl *pageCountrol;
    
    BOOL flag;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建UIScrollView
    UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    for (int i = 0; i <= 3; i++) {
        NSString *imageName = [NSString stringWithFormat:@"引导页%d.jpg", i + 1];
        UIImage *Image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, HEIGHT)];
        if (3 == i) {
            imageView.userInteractionEnabled = YES;
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(WIDTH * 0.19, HEIGHT * 0.80, WIDTH * 0.81 - WIDTH * 0.19, HEIGHT * 0.87 - HEIGHT * 0.80);
            button.backgroundColor =[UIColor clearColor];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
        }
        imageView.image = Image;
        [myScrollView addSubview:imageView];
    }
    myScrollView.bounces = NO;
    myScrollView.pagingEnabled = YES;
    
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.contentSize = CGSizeMake(WIDTH * 4, HEIGHT);
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
    
    
    // 创建
    pageCountrol = [[UIPageControl alloc] initWithFrame:CGRectMake(WIDTH * 0.45, HEIGHT * 0.18, WIDTH * 0.55 - WIDTH * 0.45, HEIGHT / 16)];
    pageCountrol.numberOfPages = 4;
    pageCountrol.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageCountrol.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageCountrol.alpha = 0.3;
    [self.view addSubview:pageCountrol];
    
}

// UIScrollView协议方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    pageCountrol.currentPage = (NSInteger)(scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width);
    
}

// 点击按钮
- (void)buttonAction:(UIButton *)button {

    flag = YES;
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setBool:flag forKey:@"notFirst"];
    [userDef synchronize];
    
    self.view.window.rootViewController = [[TabBarViewController alloc] init];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
