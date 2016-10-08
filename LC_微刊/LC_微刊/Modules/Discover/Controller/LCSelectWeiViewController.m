//
//  LCSelectWeiViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSelectWeiViewController.h"
#import "LCMacro.h"

@interface LCSelectWeiViewController ()

@end

@implementation LCSelectWeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self createHeaderView];
    
    
}

#pragma mark - 创建头视图
- (void)createHeaderView {

    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.6)];
    topImageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:topImageView];

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
