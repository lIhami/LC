//
//  TabBarViewController.m
//  LC_微刊
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TabBarViewController.h"
#import "LC_RecommendViewController.h"
#import "LCDiscoverViewController.h"
#import "LCMessageViewController.h"
#import "LCMyViewController.h"
#import "MyTabBar.h"
#import "Mybutton.h"
#import "LCMacro.h"

@interface TabBarViewController ()

@property (nonatomic, retain)MyTabBar *myTabBar;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setValue:[[MyTabBar alloc] init] forKey:@"tabBar"];
    
    LC_RecommendViewController *homeVC = [[LC_RecommendViewController alloc] init];
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeVC];
     //图片
    homeNavigationController.tabBarItem.image = [UIImage imageNamed:@"home.png"];
    // 点击图片
    UIImage *homeImage = [UIImage imageNamed:@"home_change.png"];
    homeImage = [homeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNavigationController.tabBarItem.selectedImage = homeImage;
    // 设置标题
    homeNavigationController.tabBarItem.title = @"首页";
    [homeNavigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.741 green:0.180 blue:0.196 alpha:1.000]} forState:UIControlStateSelected];
    
    [self addChildViewController:homeNavigationController];
    
    
    
    LCDiscoverViewController *discoverVC = [[LCDiscoverViewController alloc] init];
    UINavigationController *discoverNavigationController = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    discoverNavigationController.tabBarItem.image = [UIImage imageNamed:@"discover.png"];
    UIImage *discoverImage = [UIImage imageNamed:@"discover_change.png"];
    discoverImage = [discoverImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    discoverNavigationController.tabBarItem.selectedImage = discoverImage;
    discoverNavigationController.tabBarItem.title = @"发现";
    [discoverNavigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.741 green:0.180 blue:0.196 alpha:1.000]} forState:UIControlStateSelected];
    [self addChildViewController:discoverNavigationController];
    
    
    LCMessageViewController *messageVC = [[LCMessageViewController alloc] init];
    UINavigationController *messageNavigationController = [[UINavigationController alloc] initWithRootViewController:messageVC];
    messageNavigationController.tabBarItem.image = [UIImage imageNamed:@"message.png"];
    UIImage *messageImage = [UIImage imageNamed:@"message_change.png"];
    messageImage = [messageImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    messageNavigationController.tabBarItem.selectedImage = messageImage;
    messageNavigationController.tabBarItem.title = @"消息";
    [messageNavigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.741 green:0.180 blue:0.196 alpha:1.000]} forState:UIControlStateSelected];
    [self addChildViewController:messageNavigationController];
    
    
    LCMyViewController *myVC = [[LCMyViewController alloc] init];
    UINavigationController *myNavigationController = [[UINavigationController alloc] initWithRootViewController:myVC];
    myNavigationController.tabBarItem.image = [UIImage imageNamed:@"my.png"];
    UIImage *myImage = [UIImage imageNamed:@"my_change.png"];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myNavigationController.tabBarItem.selectedImage = myImage;
    myNavigationController.tabBarItem.title = @"我的";
    [myNavigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.741 green:0.180 blue:0.196 alpha:1.000]} forState:UIControlStateSelected];
    [self addChildViewController:myNavigationController];
    
    
    
    // 注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarHidden:) name:@"tabBarHidden" object:nil];
    
    
}

// 通知
- (void)tabBarHidden:(NSNotification *)notification {

    if ([notification.object isEqual:@"hide"]) {
        self.tabBar.hidden = YES;
    } else {
    
        self.tabBar.hidden = NO;
        
    }
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
