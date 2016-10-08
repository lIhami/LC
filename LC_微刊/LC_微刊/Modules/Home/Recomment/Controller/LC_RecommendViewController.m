//
//  LC_RecommendViewController.m
//  LC_微刊
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LC_RecommendViewController.h"
#import "LCTitleCollectionViewCell.h"
#import "LCMacro.h"
#import "LCRecommentCollectionViewCell.h"
#import "LCTaikCollectionViewCell.h"
#import "LCRecommendNewsViewController.h"


static NSString *const string = @"cell";
// 推荐重用池
static NSString *const recommendString = @"recommendCell";
// 话题重用池
static NSString *const taikString = @"taikCell";

@interface LC_RecommendViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>

// 顶部标题数组
@property (nonatomic, strong)NSArray *menuArray;
// 切换视图CollectionView
@property (nonatomic, strong)UICollectionView *changeCollectionView;
// 顶部标题CollectionView
@property (nonatomic, strong)UICollectionView *homeCollectionView;

@property (nonatomic, assign)NSInteger numIndexPath;


@end

@implementation LC_RecommendViewController


// 设置顶部navigationbar显示
- (void)viewWillAppear:(BOOL)animated {

[self.navigationController setNavigationBarHidden:NO animated:NO];
    
}


#pragma mark - 创建头部标题
- (void)createTitleCollectionView {

    self.menuArray = @[@"推荐", @"话题"];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *homeFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    homeFlowLayout.itemSize = CGSizeMake(90, 40);
    homeFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    homeFlowLayout.minimumInteritemSpacing = 0;
    homeFlowLayout.minimumLineSpacing = 0;
    
    self.homeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 0.3, 0, self.view.bounds.size.width * 0.7 - self.view.bounds.size.width * 0.3 , 44) collectionViewLayout:homeFlowLayout];
    _homeCollectionView.backgroundColor = [UIColor clearColor];
    _homeCollectionView.delegate = self;
    _homeCollectionView.dataSource = self;
    [self.navigationController.navigationBar addSubview:_homeCollectionView];
    
    [_homeCollectionView registerClass:[LCTitleCollectionViewCell class] forCellWithReuseIdentifier:string];

    
}


#pragma mark - 切换视图CollectionView
- (void)createChangeCollectionView {

    UICollectionViewFlowLayout *homeFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    homeFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    homeFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    homeFlowLayout.minimumInteritemSpacing = 0;
    homeFlowLayout.minimumLineSpacing = 0;
    homeFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.changeCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:homeFlowLayout];
    _changeCollectionView.backgroundColor = [UIColor whiteColor];
    _changeCollectionView.delegate = self;
    _changeCollectionView.dataSource = self;

    
    [_changeCollectionView registerClass:[LCRecommentCollectionViewCell class] forCellWithReuseIdentifier:recommendString];
    [_changeCollectionView registerClass:[LCTaikCollectionViewCell class] forCellWithReuseIdentifier:taikString];
    
    _changeCollectionView.pagingEnabled = YES;
    [self.view addSubview:_changeCollectionView];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTitleCollectionView];
    [self createChangeCollectionView];

//    [self getDataFromJson1];
}


#pragma mark - UICollectionView协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _menuArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == _homeCollectionView) {
        
        LCTitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:string forIndexPath:indexPath];
        cell.titleLable.text = _menuArray[indexPath.row];
        
        return cell;
    }
    if (indexPath.item == 0) {
        LCRecommentCollectionViewCell *recommendCell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendString forIndexPath:indexPath];
        recommendCell.backgroundColor = [UIColor redColor];
        return recommendCell;
    } else {
        LCTaikCollectionViewCell *taikCell = [collectionView dequeueReusableCellWithReuseIdentifier:taikString forIndexPath:indexPath];
        taikCell.backgroundColor = [UIColor colorWithRed:0.886 green:0.906 blue:0.922 alpha:1.000];
        return taikCell;
    }

}


#pragma mark - 切换视图
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == _homeCollectionView) {
        
        LCTitleCollectionViewCell *cell = (LCTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_numIndexPath inSection:0]];
        
        [cell setDidSelected:NO];
        
        LCTitleCollectionViewCell *secondcell = (LCTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [secondcell setDidSelected:YES];
        _numIndexPath = indexPath.item;
        
        _changeCollectionView.contentOffset = CGPointMake(SCREEN_WIDTH * _numIndexPath, 0);
        
    }
    
    
}


#pragma mark - 滑动切换标题
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _changeCollectionView) {
        
        [self.homeCollectionView setContentOffset:CGPointMake(scrollView.contentOffset.x / SCREEN_WIDTH, 0)];
        
        NSIndexPath *inin = [NSIndexPath indexPathForItem:scrollView.contentOffset.x / SCREEN_WIDTH inSection:0];
        LCTitleCollectionViewCell *cell = (LCTitleCollectionViewCell *)[_homeCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_numIndexPath inSection:0]];
        [cell setDidSelected:NO];
        
        LCTitleCollectionViewCell *secondcell = (LCTitleCollectionViewCell *)[_homeCollectionView cellForItemAtIndexPath:inin];
        [secondcell setDidSelected:YES];
        _numIndexPath = inin.item;
        
        _changeCollectionView.contentOffset = CGPointMake(SCREEN_WIDTH * _numIndexPath, 0);
        
        
    }
}





@end
