//
//  LCSystemViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSystemViewController.h"
#import "LCMacro.h"

@interface LCSystemViewController ()

@end

@implementation LCSystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIImageView *sysImageView = [[UIImageView alloc] initWithFrame:SCREEN_RECT];
    sysImageView.image = [UIImage imageNamed:@"system.png"];
    [self.view addSubview:sysImageView];
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
