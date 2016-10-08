//
//  LCLabraryViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCLabraryViewController.h"
#import "LCMacro.h"

@interface LCLabraryViewController ()

@end

@implementation LCLabraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tabBarHidden" object:@"hide"];
    
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://vkimg.wkread.com/zhiku/zhiku2.html"]];
    [self.view addSubview:webView];
    [webView loadRequest:request];
    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(SCREEN_WIDTH * 0.05, 8, SCREEN_WIDTH * 0.05, SCREEN_WIDTH * 0.1);
    [backButton setTitle:@"ㄑ" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:backButton];
    
    
    UIButton *pingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pingButton.frame = CGRectMake(SCREEN_WIDTH * 0.25, 10, SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.08);
    [pingButton setImage:[UIImage imageNamed:@"点评.png"] forState:UIControlStateNormal];
//    [pingButton addTarget:self action:@selector(pingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:pingButton];

    
    UIButton *downButton = [UIButton buttonWithType:UIButtonTypeCustom];
    downButton.frame = CGRectMake(SCREEN_WIDTH * 0.46, 10, SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.08);
    [downButton setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    //    [downButton addTarget:self action:@selector(downButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:downButton];
    
    
    UIButton *tiaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    tiaoButton.frame = CGRectMake(SCREEN_WIDTH * 0.66, 10, SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.08);
    [tiaoButton setImage:[UIImage imageNamed:@"调节器.png"] forState:UIControlStateNormal];
    //    [tiaoButton addTarget:self action:@selector(tiaoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:tiaoButton];
    
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame = CGRectMake(SCREEN_WIDTH * 0.85, 10, SCREEN_WIDTH * 0.08, SCREEN_WIDTH * 0.08);
    [moreButton setImage:[UIImage imageNamed:@"更多.png"] forState:UIControlStateNormal];
    //    [tiaoButton addTarget:self action:@selector(moreButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:moreButton];

    
}

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
