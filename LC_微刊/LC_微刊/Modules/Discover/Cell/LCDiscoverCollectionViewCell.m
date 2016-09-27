//
//  LCDiscoverCollectionViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCDiscoverCollectionViewCell.h"
#import "LCMacro.h"
#import "LCCarouselView.h"
#import "LCMagazineNew.h"

static NSString *const reusableIdentifier = @"cell";

@interface LCDiscoverCollectionViewCell ()

<
UISearchResultsUpdating,
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, retain)UISearchController *searchController;

@property (nonatomic, retain)UITableView *discoverTableView;

@property (nonatomic, strong)UITableView *groupTableView;

@property (nonatomic, strong)NSMutableArray *topImageArray;

@property (nonatomic, strong)UIScrollView *discoverScrollView;

@property (nonatomic, strong)LCCarouselView *carouselView;
// 网络请求
@property (nonatomic, strong)NSMutableDictionary *data;

@property (nonatomic, strong)NSMutableArray *magazineArray;

@end

@implementation LCDiscoverCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.topImageArray = [NSMutableArray array];
        self.data = [NSMutableDictionary dictionary];
        self.magazineArray = [NSMutableArray array];
        [self getDataFromJson];

#pragma mark - 创建底层scrollView
        self.discoverScrollView = [[UIScrollView alloc] initWithFrame:SCREEN_RECT];
        _discoverScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 3);
        [self addSubview:_discoverScrollView];
        
#pragma mark - 创建顶部轮播图
        self.carouselView = [[LCCarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.27)];
        
        [_discoverScrollView addSubview:_carouselView];
        
        
#pragma mark - 创建搜索栏
        self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.searchBar.frame = CGRectMake(0, SCREEN_HEIGHT * 0.27, SCREEN_WIDTH, 45);
       
        
        self.discoverTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 0.27, SCREEN_WIDTH, 45)];
        [_discoverScrollView addSubview:_discoverTableView];
        
        
        _discoverTableView.tableHeaderView = _searchController.searchBar;
       
        
#pragma mark - 创建排行与智库按钮
        UIImageView *listImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.02, SCREEN_HEIGHT * 0.34, SCREEN_WIDTH * 0.47, SCREEN_WIDTH * 0.2)];
        listImageView.image = [UIImage imageNamed:@"paihang.png"];
        [_discoverScrollView addSubview:listImageView];
        
        UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
        listButton.backgroundColor = [UIColor clearColor];
        listButton.frame = listImageView.bounds;
        [listImageView addSubview:listButton];
        
        UIImageView *libraryImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.51, SCREEN_HEIGHT * 0.34, SCREEN_WIDTH * 0.47, SCREEN_WIDTH * 0.2)];
        libraryImageView.image = [UIImage imageNamed:@"zhiku.png"];
        [_discoverScrollView addSubview:libraryImageView];
        
        UIButton *libraryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        libraryButton.backgroundColor = [UIColor clearColor];
        libraryButton.frame = libraryImageView.bounds;
        [libraryImageView addSubview:libraryButton];
        
        
#pragma mark - 创建分区tableView
        self.groupTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 0.46, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _groupTableView.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        _groupTableView.delegate = self;
        _groupTableView.dataSource = self;
        [_discoverScrollView addSubview:_groupTableView];
        
       [_groupTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reusableIdentifier];
        
        
        
        
    }
    return self;
}

#pragma mark - 网络请求
- (void)getDataFromJson {

    NSString *url = @"http://v20.tp.wkread.com/index.php/v20/Discovery";
    
    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
                                                    @"Token": @"MMDRAPHUC3UOEB52"};

    [BHNetTool GET:url Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        self.data = [dic objectForKey:@"data"];
        
        NSArray *ad_list = [_data objectForKey:@"ad_list"];
        NSArray *magazine_new = [_data objectForKey:@"magazine_new"];
        
        for (NSDictionary *topDic in ad_list) {
            NSString *urlOfString = [NSString stringWithFormat:@"%@", [[topDic objectForKey:@"img_info"] objectForKey:@"src"]];
            NSURL *imageUrl = [NSURL URLWithString: urlOfString];
            UIImage *topImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            [_topImageArray addObject:topImage];
        }
        _carouselView.imageArray = _topImageArray;


        for (NSDictionary *magazineDic in magazine_new) {
            LCMagazineNew *magazine = [LCMagazineNew magazineWithMagazineDic:magazineDic];
            [_magazineArray addObject:magazine];
        }
        
        [_groupTableView reloadData];
   
    } Failure:^(NSError *error) {
        
    }];
    
}



#pragma mark - tableView协议方法
// 分区数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
       return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (0 == section) {
        return 4;
    } else if (1 == section) {
        return 1;
    } else if (2 == section) {
        return 5;
    }
    return 10;
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *discoverCell = [tableView dequeueReusableCellWithIdentifier:reusableIdentifier];
    
//    discoverCell.backgroundColor = [UIColor yellowColor];
    return  discoverCell;

}


@end
