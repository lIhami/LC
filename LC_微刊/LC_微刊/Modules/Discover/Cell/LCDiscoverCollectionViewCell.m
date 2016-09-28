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
#import "LCMagazineNewTableViewCell.h"
#import "LCMagazineTwoTableViewCell.h"
#import "LCSpecialNewTableViewCell.h"

static NSString *const reusableIdentifier = @"cell";
static NSString *const magazineRecom = @"magCell";
static NSString *const speCell = @"cellOfSpe";

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

@property (nonatomic, assign)CGFloat beginDragY;

@end

@implementation LCDiscoverCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.topImageArray = [NSMutableArray array];
        self.data = [NSMutableDictionary dictionary];
        self.magazineArray = [NSMutableArray array];
        
        // 网络请求
        [self getDataFromJson];
        
#pragma mark - 创建底层tableView

        self.groupTableView = [[UITableView alloc] initWithFrame:SCREEN_RECT];
        _groupTableView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
        _groupTableView.backgroundColor = [UIColor colorWithRed:1.000 green:0.385 blue:0.532 alpha:1.000];
        _groupTableView.rowHeight = 145;
        _groupTableView.delegate = self;
        _groupTableView.dataSource = self;
        [self addSubview:_groupTableView];
        
       // 注册
        [_groupTableView registerClass:[LCMagazineNewTableViewCell class] forCellReuseIdentifier:reusableIdentifier];
        [_groupTableView registerClass:[LCMagazineTwoTableViewCell class] forCellReuseIdentifier:magazineRecom];
        [_groupTableView registerClass:[LCSpecialNewTableViewCell class] forCellReuseIdentifier:speCell];
        
        [_groupTableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"header"];
        [_groupTableView dequeueReusableCellWithIdentifier:@"header"];
        
        // 创建头视图
        [self createHeaderView];
        
    }
    return self;
}


#pragma mark - 头视图

- (void)createHeaderView {
    
    self.discoverScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.46)];
    
#pragma mark - 创建顶部轮播图
    self.carouselView = [[LCCarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.27)];
    
    [_discoverScrollView addSubview:_carouselView];
    
    
#pragma mark - 创建搜索栏
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.searchBar.frame = CGRectMake(0, SCREEN_HEIGHT * 0.27, SCREEN_WIDTH, 45);
    [_discoverScrollView addSubview:_searchController.searchBar];
    
    
    
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
    
    _groupTableView.tableHeaderView = _discoverScrollView;
    


}

#pragma mark - 网络请求
- (void)getDataFromJson {

    NSString *url = @"http://v20.tp.wkread.com/index.php/v20/Discovery";
    
    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
                                                    @"Token": @"CQBLBTDFEQ0UDECA"};

    [BHNetTool GET:url Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        self.data = [dic objectForKey:@"data"];
        
        NSArray *ad_list = [_data objectForKey:@"ad_list"];
        NSArray *magazine_new = [_data objectForKey:@"magazine_new"];
        
        
        // ad_list 请求
        for (NSDictionary *topDic in ad_list) {
            NSString *urlOfString = [NSString stringWithFormat:@"%@", [[topDic objectForKey:@"img_info"] objectForKey:@"src"]];
            NSURL *imageUrl = [NSURL URLWithString: urlOfString];
            UIImage *topImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            [_topImageArray addObject:topImage];
        }
        _carouselView.imageArray = _topImageArray;


        // magazine_new 请求
        for (NSDictionary *magazineDic in magazine_new) {
            LCMagazineNew *magazine = [LCMagazineNew magazineWithMagazineDic:magazineDic];
            [_magazineArray addObject:magazine];
        }
        
        [_groupTableView reloadData];
        
        NSLog(@"---------%ld", _magazineArray.count);
   
    } Failure:^(NSError *error) {
        
    }];
    
}


#pragma mark - tableView分区
// 分区cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (0 == indexPath.section) {
        tableView.rowHeight = 145;
    } else if (1 == indexPath.section) {
        tableView.rowHeight = 200;
    } else if (2 == indexPath.section) {
        tableView.rowHeight = 145;
    } else if (3 == indexPath.section) {
        tableView.rowHeight = 200;
    } else if (4 == indexPath.section) {
        tableView.rowHeight = 145;
    }
    
    
    return tableView.rowHeight;
}

// 分区头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.f;
}

// 分区的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *headerTitleArray = @[@"最新微刊", @"编辑精选", @"最新话题", @"精选话题", @"全部微刊"];
    NSLog(@"%ld", section);
    return headerTitleArray[section];
    
}

// 改变分区
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, 10, 2, 20)];
    label.backgroundColor = [UIColor colorWithRed:0.922 green:0.443 blue:0.443 alpha:1.000];
    [view.contentView addSubview:label];
    
    if (0 == section || 2 == section) {
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.85, 10, SCREEN_WIDTH * 0.15, 20)];
        rightLabel.text = @"全部>";
        rightLabel.textColor = [UIColor lightGrayColor];
        [view.contentView addSubview:rightLabel];
    }
    
    
   
    return view;
}


// 不同分区cell数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (0 == section) {
        return 4;
    } else if (1 == section) {
        return 1;
    } else if (2 == section) {
        return 5;
    } else if (3 == section) {
        return 1;
    }
    return 30;
}



#pragma mark - tableView协议方法
// 分区数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
       return 5;
}

// tableView的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 == indexPath.section) {
        LCMagazineNewTableViewCell *magazineNewCell = [tableView dequeueReusableCellWithIdentifier:reusableIdentifier];
        
//        LCMagazineNew *magazine = _magazineArray[indexPath.row];
//        magazineNewCell.topText = magazine.title;
        
        
        return  magazineNewCell;
    } else if (1 == indexPath.section) {
        LCMagazineTwoTableViewCell *magazineRecomment = [tableView dequeueReusableCellWithIdentifier:magazineRecom];
        
        
        
        return magazineRecomment;
    } else if (2 == indexPath.section) {
        LCSpecialNewTableViewCell *specialNewCell = [tableView dequeueReusableCellWithIdentifier:speCell];
        return specialNewCell;
    }

    static NSString *reusableIndentifier1 = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableIndentifier1];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableIndentifier1] ;
    }
    return cell;
}




@end
