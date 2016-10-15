//
//  LCArticleViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/10.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCArticleViewController.h"
#import "LCMacro.h"
#import "LCMyViewController.h"
#import "LCMoViewController.h"


@interface LCArticleViewController ()

<
UIWebViewDelegate
>

@property (nonatomic, strong)UIImageView *myImageView;

@end

@implementation LCArticleViewController


- (void)viewWillAppear:(BOOL)animated {
    

    // 加载动画
    self.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.3, SCREEN_HEIGHT * 0.5, SCREEN_WIDTH * 0.4, SCREEN_WIDTH * 0.3)];
    [self.view addSubview:_myImageView];
    _myImageView.tag = 1111;
    
    
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 1; i <=6; i++) {
        NSString *imageName = [NSString stringWithFormat: @"updateLoading_%d.png", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [imageArray addObject:image];
    }
    _myImageView.animationImages = imageArray;
    _myImageView.animationDuration = 0.05 * imageArray.count;
    [_myImageView startAnimating];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 加载内容
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [self.view addSubview:webView];
    webView.delegate = self;
    [webView loadRequest:request];
    
    
    UIImageView *imgageView = [self.view viewWithTag:1111];
    [imgageView removeFromSuperview];
    
    
    // 顶部导航view
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    
    // 返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(SCREEN_WIDTH * 0.05, 8, SCREEN_WIDTH * 0.05, SCREEN_WIDTH * 0.1);
    [backButton setTitle:@"ㄑ" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:backButton];
    
    
    // 评论按钮
    UIButton *pingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pingButton.frame = CGRectMake(SCREEN_WIDTH * 0.25, 10, SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.08);
    [pingButton setImage:[UIImage imageNamed:@"点评.png"] forState:UIControlStateNormal];
    [bottomView addSubview:pingButton];
    
    
    // 下载按钮
    UIButton *downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake(SCREEN_WIDTH * 0.46, 10, SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.08);
    [downButton setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    [downButton addTarget:self action:@selector(downButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:downButton];
    
    
    // 模式按钮
    UIButton *tiaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tiaoButton.frame = CGRectMake(SCREEN_WIDTH * 0.66, 10, SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.08);
    [tiaoButton setImage:[UIImage imageNamed:@"调节器.png"] forState:UIControlStateNormal];
    [tiaoButton addTarget:self action:@selector(tiaoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:tiaoButton];
    
    
    // 更多按钮
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame = CGRectMake(SCREEN_WIDTH * 0.85, 10, SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.08);
    [moreButton setImage:[UIImage imageNamed:@"更多.png"] forState:UIControlStateNormal];
    [bottomView addSubview:moreButton];
    
    
}


// 返回按钮点击跳转
- (void)backButtonAction:(UIButton *)backButton {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


// 下载按钮点击跳转
- (void)downButtonAction:(UIButton *)downButton {
    
    LCMyViewController *myVC = [[LCMyViewController alloc] init];

    [self presentViewController:myVC animated:YES completion:nil];

}


// 调试按钮点击跳转
- (void)tiaoButtonAction:(UIButton *)tiaoButton {
    
    LCMoViewController *moVC = [[LCMoViewController alloc] init];
    moVC.read_mode_url = _read_mode_url;
    
    [self presentViewController:moVC animated:YES completion:nil];
    
}


// webView加载完成移除动画
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"加载完成");
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:1111];
    [imageView removeFromSuperview];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
