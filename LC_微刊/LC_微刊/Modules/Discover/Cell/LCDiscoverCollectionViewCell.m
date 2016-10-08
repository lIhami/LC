//
//  LCDiscoverCollectionViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCDiscoverCollectionViewCell.h"
#import "LCMacro.h"
#import "UIImageView+WebCache.h"
#import "LCCarouselView.h"
#import "LCMagazineNew.h"
#import "LCNewSpecial.h"
#import "LCAllMagazine.h"
#import "LCMagazineNewTableViewCell.h"
#import "LCMagazineTwoTableViewCell.h"
#import "LCSpecialNewTableViewCell.h"
#import "LCSpecialRecommendTableViewCell.h"
#import "LCAllMagazineTableViewCell.h"
#import "LCNewSpecial.h"
#import "LCListViewController.h"
#import "LCLabraryViewController.h"


static NSString *const reusableIdentifier = @"cell";
static NSString *const magazineRecom = @"magCell";
static NSString *const speCell = @"cellOfSpe";
static NSString *const speRecCell = @"cellOfRec";
static NSString *const allCell = @"cellAction";


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

@property (nonatomic, strong)NSMutableArray *specialNewArray;

@property (nonatomic, strong)NSMutableArray *allMagazineArray;

@property (nonatomic, assign)CGFloat beginDragY;

@property (nonatomic, assign)NSInteger count;


@end

@implementation LCDiscoverCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.count = 3;
        self.topImageArray = [NSMutableArray array];
        self.data = [NSMutableDictionary dictionary];
        self.magazineArray = [NSMutableArray array];
        self.specialNewArray = [NSMutableArray array];
        self.allMagazineArray = [NSMutableArray array];
        
        // 网络请求
        [self getDataFromJson];
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"tabBarHidden" object:nil];
    
        
#pragma mark - 创建底层tableView

        self.groupTableView = [[UITableView alloc] initWithFrame:SCREEN_RECT];
        _groupTableView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
        _groupTableView.rowHeight = 145;
        _groupTableView.tag = 1212;
        _groupTableView.delegate = self;
        _groupTableView.dataSource = self;
        [self addSubview:_groupTableView];
        
       // 注册
        [_groupTableView registerClass:[LCMagazineNewTableViewCell class] forCellReuseIdentifier:reusableIdentifier];
        [_groupTableView registerClass:[LCMagazineTwoTableViewCell class] forCellReuseIdentifier:magazineRecom];
        [_groupTableView registerClass:[LCSpecialNewTableViewCell class] forCellReuseIdentifier:speCell];
        [_groupTableView registerClass:[LCSpecialRecommendTableViewCell class] forCellReuseIdentifier:speRecCell];
        [_groupTableView registerClass:[LCAllMagazineTableViewCell class] forCellReuseIdentifier:allCell];
        
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
    
    UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
    listButton.backgroundColor = [UIColor clearColor];
    listButton.frame = CGRectMake(SCREEN_WIDTH * 0.02, SCREEN_HEIGHT * 0.34, SCREEN_WIDTH * 0.47, SCREEN_WIDTH * 0.2);
    [listButton addTarget:self action:@selector(listButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [listButton setImage:[UIImage imageNamed:@"paihang.png"] forState:UIControlStateNormal];
    [_discoverScrollView addSubview:listButton];
    
    
    UIButton *libraryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    libraryButton.backgroundColor = [UIColor clearColor];
    libraryButton.frame = CGRectMake(SCREEN_WIDTH * 0.51, SCREEN_HEIGHT * 0.34, SCREEN_WIDTH * 0.47, SCREEN_WIDTH * 0.2);
    [libraryButton setImage:[UIImage imageNamed:@"zhiku.png"] forState:UIControlStateNormal];
    [libraryButton addTarget:self action:@selector(libraryButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_discoverScrollView addSubview:libraryButton];
    
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
        NSArray *special_new = [_data objectForKey:@"special_new"];
        
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
        
        
        // special_new 请求
        for (NSDictionary *speNewDic in special_new) {
            LCNewSpecial *specialNew = [LCNewSpecial specialNewWithSpeNewDic:speNewDic];
            [_specialNewArray addObject:specialNew];
        }

        
        [_groupTableView reloadData];
        
   
    } Failure:^(NSError *error) {
        
    }];
    
}

// 网络请求
- (void)getAllMagazineDataFromJson {
    
    NSString *string = @"http://v20.tp.wkread.com/index.php/v20/Discovery/magazine";
    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
                                @"Token": @"CQBLBTDFEQ0UDECA"};
    [BHNetTool GET:string Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
        
        //        NSLog(@"%@", result);
        NSDictionary *dic = (NSDictionary *)result;
        
        self.data = [dic objectForKey:@"data"];
        
        NSArray *magazine_list = [_data objectForKey:@"magazine_list"];
        
        for (NSDictionary *allDic in magazine_list) {
            LCAllMagazine *allMag = [LCAllMagazine allMagazineWithAllDic:allDic];
            [_allMagazineArray addObject:allMag];
        }
        
        [_groupTableView reloadData];
        
    } Failure:^(NSError *error) {
        
    }];
    
}

// 滑动加载全部微刊
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    
    if (1212 == scrollView.tag) {
        if (scrollView.contentOffset.y < 800) {
            [self getAllMagazineDataFromJson];
        } else if (scrollView.contentOffset.y > 800 + 145 * _allMagazineArray.count ) {
            NSString *str = [NSString stringWithFormat:@"http://v20.tp.wkread.com/index.php/v20/Discovery/magazine?page=%ld", _count];
            
            _count++;
            NSDictionary *headerDic1 = @{@"Host":@"v20.tp.wkread.com",
                                         @"Token": @"CQBLBTDFEQ0UDECA"};
            
            [BHNetTool GET:str Body:nil HeaderFile:headerDic1 Response:BHJSON Success:^(id result) {
                
                NSDictionary *dic = (NSDictionary *)result;
                
                self.data = [dic objectForKey:@"data"];
                
                NSArray *magazine_list = [_data objectForKey:@"magazine_list"];
                
                for (NSDictionary *allDic in magazine_list) {
                    LCAllMagazine *allMag = [LCAllMagazine allMagazineWithAllDic:allDic];
                    [_allMagazineArray addObject:allMag];
                }
                
                [_groupTableView reloadData];
                
                
            } Failure:^(NSError *error) {
                
            }];
            
            
        }
    }
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
        tableView.rowHeight = 250;
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
        return _magazineArray.count;
    } else if (1 == section) {
        return 1;
    } else if (2 == section) {
        return _specialNewArray.count;
    } else if (3 == section) {
        return 1;
    }
    return _allMagazineArray.count;
}



#pragma mark - tableView协议方法
// 分区数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
       return 5;
}

// tableView的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 第一个分区cell
    if (0 == indexPath.section) {
        LCMagazineNewTableViewCell *magazineNewCell = [tableView dequeueReusableCellWithIdentifier:reusableIdentifier];
        LCMagazineNew *magazine = _magazineArray[indexPath.row];
        magazineNewCell.topText = [NSString stringWithFormat:@"『%@』", magazine.title];
        magazineNewCell.subscribeText = [NSString stringWithFormat:@"%ld订阅", magazine.subscribe_count];
        magazineNewCell.articleText = [NSString stringWithFormat:@"%ld文章", magazine.article_count];
        if (magazine.myDescription == nil) {
            magazineNewCell.desText = @"作者没有对本微刊进行描述哦, 可以点进去看看有些什么!";
        } else {
            magazineNewCell.desText = [NSString stringWithFormat:@"%@", magazine.myDescription];
        }
        
        NSString *imageURL = [magazine.img_info objectForKey:@"src"];
        [magazineNewCell.magNewImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
        
        return  magazineNewCell;
        
        // 第二个分区cell
    } else if (1 == indexPath.section) {
        LCMagazineTwoTableViewCell *magazineRecomment = [tableView dequeueReusableCellWithIdentifier:magazineRecom];
        
        return magazineRecomment;
        
        // 第三个分区cell
    } else if (2 == indexPath.section) {
        LCSpecialNewTableViewCell *specialNewCell = [tableView dequeueReusableCellWithIdentifier:speCell];
        
        
        LCNewSpecial *specialNew = _specialNewArray[indexPath.row];
        specialNewCell.titleText = [NSString stringWithFormat:@"#%@#", specialNew.name];
        specialNewCell.artText = [NSString stringWithFormat:@"%@ 文章", specialNew.article_count];
        specialNewCell.subscribeText = [NSString stringWithFormat:@"%@ 订阅", specialNew.subscribe_count];
        
        
        
        NSString *imageURL = [specialNew.img_info objectForKey:@"src"];
        [specialNewCell.specialNewImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
        
        return specialNewCell;
        
        // 第四个分区cell
    } else if (3 == indexPath.section) {
        LCSpecialRecommendTableViewCell *specialRecomment = [tableView dequeueReusableCellWithIdentifier:speRecCell];
        
        return specialRecomment;
        
        // 第五个分区cell
    } else if (4 == indexPath.section) {
        LCAllMagazineTableViewCell *allMagazine = [tableView dequeueReusableCellWithIdentifier:allCell];
        
        LCAllMagazine *magazineAll = _allMagazineArray[indexPath.row];
        allMagazine.topText = [NSString stringWithFormat:@"『%@』", magazineAll.title];
        allMagazine.subscribeText = [NSString stringWithFormat:@"%ld订阅", magazineAll.subscribe_count];
        allMagazine.articleText = [NSString stringWithFormat:@"%ld文章", magazineAll.article_count];
        NSString *imageURL = [magazineAll.img_info objectForKey:@"src"];
        [allMagazine.magNewImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
        
        return allMagazine;
        
    }
    
    static NSString *reusableIndentifier1 = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusableIndentifier1];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableIndentifier1] ;
    }
    return cell;
}


#pragma mark - 当前控制器的导航控制器
- (UINavigationController *)naviController {
    
    for (UIView *next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            
            return (UINavigationController*)nextResponder;
        }
    }
    return nil;
}


// 排行榜点击跳转
- (void)listButtonAction:(UIButton *)listButton {
    

    LCListViewController *listVC = [[LCListViewController alloc] init];
    
    listVC.hidesBottomBarWhenPushed = YES;
    
    [[self naviController] pushViewController:listVC animated:YES];

    
}

// 智库点击跳转
- (void)libraryButtonAction:(UIButton *)libraryButton {

    LCLabraryViewController * labraryVC = [[LCLabraryViewController alloc] init];
    
    labraryVC.hidesBottomBarWhenPushed = YES;
    
    [self.naviController pushViewController:labraryVC animated:YES];

}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {


    
}


@end
