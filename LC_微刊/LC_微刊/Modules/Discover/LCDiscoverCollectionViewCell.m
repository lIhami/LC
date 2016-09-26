//
//  LCDiscoverCollectionViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCDiscoverCollectionViewCell.h"
#import "LCMacro.h"

static NSString *const reusableIdentifier = @"cell";

@interface LCDiscoverCollectionViewCell ()

<
UISearchResultsUpdating,
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, retain)UISearchController *searchController;

@property (nonatomic, retain)UITableView *discoverTableView;

@end

@implementation LCDiscoverCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 创建底层scrollView
        UIScrollView *discoverScrollView = [[UIScrollView alloc] initWithFrame:SCREEN_RECT];
        discoverScrollView.backgroundColor = [UIColor cyanColor];
        discoverScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 3);
        [self addSubview:discoverScrollView];
        
        // 创建顶部轮播图
        UIScrollView *topDisScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.27)];
        topDisScrollView.backgroundColor = [UIColor orangeColor];
        [discoverScrollView addSubview:topDisScrollView];
        
        // 创建搜索栏
        self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        
        self.discoverTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 0.27, SCREEN_WIDTH, 45)];
        _discoverTableView.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        [discoverScrollView addSubview:_discoverTableView];
        
        
        _discoverTableView.tableHeaderView = _searchController.searchBar;
       
        
        // 创建排行与智库按钮
        UIImageView *listImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.02, SCREEN_HEIGHT * 0.34, SCREEN_WIDTH * 0.47, SCREEN_WIDTH * 0.2)];
        listImageView.image = [UIImage imageNamed:@"paihang.png"];
        [discoverScrollView addSubview:listImageView];
        
        UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
        listButton.backgroundColor = [UIColor clearColor];
        listButton.frame = listImageView.bounds;
        [listImageView addSubview:listButton];
        
        UIImageView *libraryImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.51, SCREEN_HEIGHT * 0.34, SCREEN_WIDTH * 0.47, SCREEN_WIDTH * 0.2)];
        libraryImageView.image = [UIImage imageNamed:@"zhiku.png"];
        [discoverScrollView addSubview:libraryImageView];
        
        UIButton *libraryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        libraryButton.backgroundColor = [UIColor clearColor];
        libraryButton.frame = libraryImageView.bounds;
        [libraryImageView addSubview:libraryButton];
        
        
        // 创建分区tableView
        UITableView *groupTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 0.46, SCREEN_WIDTH, SCREEN_HEIGHT)];
        groupTableView.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        groupTableView.delegate = self;
        groupTableView.dataSource = self;
        [discoverScrollView addSubview:groupTableView];
        
       [groupTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reusableIdentifier];
        
        
        
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *discoverCell = [tableView dequeueReusableCellWithIdentifier:reusableIdentifier];
    
    discoverCell.backgroundColor = [UIColor yellowColor];
    return  discoverCell;

}


@end
