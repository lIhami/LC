//
//  LCMyViewController.m
//  LC_微刊
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCMyViewController.h"
#import "LCMacro.h"
#import "LCMyTitleCollectionViewCell.h"
#import "LCSignInCollectionViewCell.h"
#import "LCRegisterCollectionViewCell.h"

static NSString *const string = @"cell";
// 登录重用池
static NSString *const recommendString = @"recommendCell";
// 注册重用池
static NSString *const taikString = @"taikCell";


@interface LCMyViewController ()

<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@property (nonatomic, strong)NSArray *menuArray;

@property (nonatomic, strong)UICollectionView *myCollectionView;

@property (nonatomic, strong)UIImageView *topImageView;

@property (nonatomic, strong)UICollectionView *changeCollectionView;

@property (nonatomic, assign)NSInteger numIndexPath;

@end

@implementation LCMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 隐藏顶部navigation
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    
    // tabBar颜色
    self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
    
    
    // 顶部图片
    self.topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.4)];
    _topImageView.backgroundColor = [UIColor yellowColor];
    _topImageView.image = [UIImage imageNamed:@"Mytop.jpg"];
    [self.view addSubview:_topImageView];
    
    
    [self createTitleCollectionView];
    [self createChangeCollectionView];
    
    
    UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.4, SCREEN_HEIGHT * 0.73, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.08)];
    bottomLabel.text = @"合作登录方式";
    bottomLabel.textColor = [UIColor lightGrayColor];
    bottomLabel.alpha = 0.8;
    bottomLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:bottomLabel];
    
    
    UIImageView *weixinImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.15, SCREEN_HEIGHT * 0.8, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1)];
    weixinImageView.image = [UIImage imageNamed:@"微信.png"];
    [self.view addSubview:weixinImageView];
    
    
    UIImageView *qqImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.45, SCREEN_HEIGHT * 0.8, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1)];
    qqImageView.image = [UIImage imageNamed:@"QQ.png"];
    [self.view addSubview:qqImageView];
    
    
    UIImageView *weiboImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.75, SCREEN_HEIGHT * 0.8, SCREEN_WIDTH * 0.1, SCREEN_WIDTH * 0.1)];
    weiboImageView.image = [UIImage imageNamed:@"微博.png"];
    [self.view addSubview:weiboImageView];
    
}

// 顶部标题
- (void)createTitleCollectionView {
    
    self.menuArray = @[@"登录", @"注册"];
    
    UICollectionViewFlowLayout *myFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    myFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 2, SCREEN_WIDTH * 0.15);
    myFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    myFlowLayout.minimumInteritemSpacing = 0;
    myFlowLayout.minimumLineSpacing = 0;
    
    self.myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH * 0.25, SCREEN_WIDTH, SCREEN_WIDTH * 0.15) collectionViewLayout:myFlowLayout];
    _myCollectionView.backgroundColor = [UIColor clearColor];
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    [self.view addSubview:_myCollectionView];
    
    [_myCollectionView registerClass:[LCMyTitleCollectionViewCell class] forCellWithReuseIdentifier:string];
    
    
}


#pragma mark - 切换视图CollectionView
- (void)createChangeCollectionView {
    
    UICollectionViewFlowLayout *myFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    myFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 0.4);
    myFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    myFlowLayout.minimumInteritemSpacing = 0;
    myFlowLayout.minimumLineSpacing = 0;
    myFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    self.changeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH * 0.4, SCREEN_WIDTH, SCREEN_HEIGHT * 0.5) collectionViewLayout:myFlowLayout];
    _changeCollectionView.backgroundColor = [UIColor whiteColor];
    _changeCollectionView.delegate = self;
    _changeCollectionView.dataSource = self;
    _changeCollectionView.showsHorizontalScrollIndicator = NO;
    
    
    [_changeCollectionView registerClass:[LCSignInCollectionViewCell class] forCellWithReuseIdentifier:recommendString];
    [_changeCollectionView registerClass:[LCRegisterCollectionViewCell class] forCellWithReuseIdentifier:taikString];
    
    _changeCollectionView.pagingEnabled = YES;
    [self.view addSubview:_changeCollectionView];
    
    
}


#pragma mark - UICollectionView协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _menuArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == _myCollectionView) {
        
        LCMyTitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:string forIndexPath:indexPath];
        cell.titleLable.text = _menuArray[indexPath.item];
        
        return cell;
    }
    if (indexPath.item == 0) {
        LCSignInCollectionViewCell *recommendCell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendString forIndexPath:indexPath];
        return recommendCell;
    } else {
        LCRegisterCollectionViewCell *taikCell = [collectionView dequeueReusableCellWithReuseIdentifier:taikString forIndexPath:indexPath];
        return taikCell;
    }
    
}


#pragma mark - 切换视图
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == _myCollectionView) {
        
        LCMyTitleCollectionViewCell *cell = (LCMyTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_numIndexPath inSection:0]];
        
        [cell setDidSelected:NO];
        
        LCMyTitleCollectionViewCell *secondcell = (LCMyTitleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [secondcell setDidSelected:YES];
        _numIndexPath = indexPath.item;
        
        _changeCollectionView.contentOffset = CGPointMake(SCREEN_WIDTH * _numIndexPath, 0);
        
    }
    
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _changeCollectionView) {
        
        [self.myCollectionView setContentOffset:CGPointMake(scrollView.contentOffset.x / SCREEN_WIDTH, 0)];
        
        NSIndexPath *inin = [NSIndexPath indexPathForItem:scrollView.contentOffset.x / SCREEN_WIDTH inSection:0];
        LCMyTitleCollectionViewCell *cell = (LCMyTitleCollectionViewCell *)[_myCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_numIndexPath inSection:0]];
        [cell setDidSelected:NO];
        
        LCMyTitleCollectionViewCell *secondcell = (LCMyTitleCollectionViewCell *)[_myCollectionView cellForItemAtIndexPath:inin];
        [secondcell setDidSelected:YES];
        _numIndexPath = inin.item;
        
        _changeCollectionView.contentOffset = CGPointMake(SCREEN_WIDTH * _numIndexPath, 0);
        
        
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
