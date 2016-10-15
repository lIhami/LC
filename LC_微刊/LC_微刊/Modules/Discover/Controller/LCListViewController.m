//
//  LCListViewController.m
//  LC_微刊
//
//  Created by Omaiga on 16/10/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCListViewController.h"
#import "LCMacro.h"
#import "LCAllMagazineTableViewCell.h"
#import "LCDiscoverViewController.h"
#import "LCAllMagazine.h"
#import "UIImageView+WebCache.h"
#import "LCSelectWeiViewController.h"

static NSString *const string = @"cell";

@interface LCListViewController ()

<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong)UITableView *listTableView;

@property (nonatomic, strong)NSMutableArray *allMagazineRankArray;

@property (nonatomic, assign)NSInteger count;

@end

@implementation LCListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    
    self.count = 2;
    self.allMagazineRankArray = [NSMutableArray array];
    
    [self getAllMagazineDataFromJson];
    
    // 创建tableView
    self.listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT)
                          style:UITableViewStylePlain];
    _listTableView.rowHeight = 145;
    _listTableView.tag = 1001;
    _listTableView.dataSource = self;
    _listTableView.delegate = self;
    [self.view addSubview:_listTableView];
    
    [_listTableView registerClass:[LCAllMagazineTableViewCell class] forCellReuseIdentifier:string];
    
    // 顶部导航view
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    
    // 顶部标题
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.4, 20, SCREEN_WIDTH * 0.2, 44)];
    topLabel.text = @"排行榜";
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.textColor = [UIColor blackColor];
    [self.view addSubview:topLabel];
    
    
    // 返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 25, SCREEN_WIDTH * 0.05, SCREEN_WIDTH * 0.1);
    [backButton setTitle:@"ㄑ" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    

}


#pragma mark - 网络请求
- (void)getAllMagazineDataFromJson {
    
    NSString *string = @"http://v20.tp.wkread.com/index.php/v20/Discovery/magazineAllRank";
    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
                                @"Token": @"CQBLBTDFEQ0UDECA"};
    [BHNetTool GET:string Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
        
        //        NSLog(@"%@", result);
        NSDictionary *dic = (NSDictionary *)result;
        
        NSDictionary *data = [dic objectForKey:@"data"];
        
        NSArray *magazine_list = [data objectForKey:@"magazine_list"];
        
        for (NSDictionary *allDic in magazine_list) {
            LCAllMagazine *allMag = [LCAllMagazine allMagazineWithAllDic:allDic];
            [_allMagazineRankArray addObject:allMag];
        }
        
        [_listTableView reloadData];
        
    } Failure:^(NSError *error) {
        
    }];
    
}


#pragma mark - 返回button点击事件
- (void)backButtonAction:(UIButton *)backButton {

//    LCDiscoverViewController *disVC = [[LCDiscoverViewController alloc] init];
    [self.navigationController popToRootViewControllerAnimated:YES];

}



// 滑动加载全部微刊
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    NSLog(@"%ld", _count);
    if (1001 == scrollView.tag) {
        if (scrollView.contentOffset.y < 0) {
            [self getAllMagazineDataFromJson];
        } else if (scrollView.contentOffset.y > (44 + 145 * _allMagazineRankArray.count) - SCREEN_HEIGHT) {
            NSString *str = [NSString stringWithFormat:@"http://v20.tp.wkread.com/index.php/v20/Discovery/magazineWeekRand?page=%ld", _count];
            
            _count++;
            NSDictionary *headerDic1 = @{@"Host":@"v20.tp.wkread.com",
                                         @"Token": @"CQBLBTDFEQ0UDECA"};
            
            [BHNetTool GET:str Body:nil HeaderFile:headerDic1 Response:BHJSON Success:^(id result) {
                
                NSLog(@"%@", result);
                
                NSDictionary *dic = (NSDictionary *)result;
                
                NSDictionary *data = [dic objectForKey:@"data"];
                
                NSArray *magazine_list = [data objectForKey:@"magazine_list"];
                
                for (NSDictionary *allDic in magazine_list) {
                    LCAllMagazine *allMag = [LCAllMagazine allMagazineWithAllDic:allDic];
                    [_allMagazineRankArray addObject:allMag];
                }
                
                [_listTableView reloadData];
                
                
            } Failure:^(NSError *error) {
                
            }];
            
            
        }
    }
}


#pragma mark - tableView协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld", _allMagazineRankArray.count);
    return _allMagazineRankArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LCAllMagazineTableViewCell *allMagazine = [tableView dequeueReusableCellWithIdentifier:string];
    
    LCAllMagazine *magazineAll = _allMagazineRankArray[indexPath.row];
    allMagazine.topText = [NSString stringWithFormat:@"『%@』", magazineAll.title];
    allMagazine.subscribeText = [NSString stringWithFormat:@"%ld订阅", magazineAll.subscribe_count];
    allMagazine.articleText = [NSString stringWithFormat:@"%ld观看", magazineAll.view_count];
    NSString *imageURL = [magazineAll.img_info objectForKey:@"src"];
    [allMagazine.magNewImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    
    return allMagazine;
}


// tableView点击cell跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LCAllMagazine *magazine = _allMagazineRankArray[indexPath.row];
    
    LCSelectWeiViewController *selectWei = [[LCSelectWeiViewController alloc] init];
    selectWei.id = magazine.id;
    
    selectWei.name = [NSString stringWithFormat:@"『%@』", magazine.title];
    selectWei.imgURL = [magazine.img_info objectForKey:@"src"];
    selectWei.userName = [magazine.user objectForKey:@"nickname"];
    selectWei.view_count = [NSString stringWithFormat:@"%ld", magazine.view_count];
    selectWei.scoreNumber = [NSString stringWithFormat:@"%@", magazine.s_score];
    selectWei.subNumber = [NSString stringWithFormat:@"%ld", magazine.subscribe_count];
    
    
    // 隐藏tabbar
    selectWei.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:selectWei animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
