//
//  LCQuestionArticileViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/11.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCQuestionArticileViewController.h"
#import "LCQuestionTableViewCell.h"
#import "LCMacro.h"
#import "LCShuoViewController.h"

static NSString *const string = @"cell";


@interface LCQuestionArticileViewController ()

<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSArray *titleArray;


@end

@implementation LCQuestionArticileViewController

- (void)viewWillAppear:(BOOL)animated {

    [self.navigationController setNavigationBarHidden:YES animated:NO];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建数组
    self.titleArray = [NSArray array];
    _titleArray = @[@"从Safari怎么发文", @"从微信怎么发文", @"从知乎怎么发文", @"从腾讯新闻怎么发文", @"从搜狐新闻怎么发文", @"从网易新闻怎么发文", @"从今日头条怎么发文", @"从豆瓣怎么发文"];
    
    // 顶部导航view
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    
    // 顶部标题label
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.6, SCREEN_WIDTH * 0.08)];
    topLabel.text = @"如何发表文章";
    topLabel.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:topLabel];
    
    
    // 顶部返回button
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, SCREEN_WIDTH * 0.06, SCREEN_WIDTH * 0.05, SCREEN_WIDTH * 0.1);
    [backButton setTitle:@"ㄑ" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    // 创建tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.rowHeight = 60.f;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    
    [_tableView registerClass:[LCQuestionTableViewCell class] forCellReuseIdentifier:string];
    
    
}


#pragma mark - tableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _titleArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LCQuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    
    cell.titleLabel.text = _titleArray[indexPath.row];
    
    return cell;
    
}

#pragma mark - button点击返回页面
- (void)backButtonAction:(UIButton *)backButton {

    [self.navigationController popToRootViewControllerAnimated:YES];

}


#pragma mark - tableView Cellc 点击跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    LCShuoViewController *shuoVC = [[LCShuoViewController alloc] init];
    
    shuoVC.number = indexPath.row;
    shuoVC.titleText = _titleArray[indexPath.row];
    
    shuoVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:shuoVC animated:YES];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
