//
//  LCRecommendNewsViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCRecommendNewsViewController.h"
#import "LCMacro.h"

@interface LCRecommendNewsViewController ()

@property (nonatomic, strong)UILabel *textLabel;

@end

@implementation LCRecommendNewsViewController


#pragma mark - 隐藏顶部navigationbar
- (void)viewWillAppear:(BOOL)animated {

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    // 获取网页
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [self.view addSubview:webView];
    [webView loadRequest:request];
    
    webView.scalesPageToFit = YES;
    
    
    // 底部导航栏
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
    bottomView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bottomView];
    
    
    // 返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 8, SCREEN_WIDTH * 0.05, SCREEN_WIDTH * 0.1);
    [backButton setTitle:@"ㄑ" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:backButton];
    
    
    
    
}


#pragma mark - button返回主页面
- (void)backButtonAction:(UIButton *)backButton {

    [self.navigationController popToRootViewControllerAnimated:YES];

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
