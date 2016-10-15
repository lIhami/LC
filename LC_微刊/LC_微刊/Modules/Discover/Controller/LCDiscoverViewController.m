//
//  LCDiscoverViewController.m
//  LC_微刊
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCDiscoverViewController.h"
#import "LCMacro.h"
#import "LCDiscoverCollectionViewCell.h"

// 底层视图重用池
static NSString *const discoverCell = @"cellaction";

@interface LCDiscoverViewController ()

<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@property (nonatomic, strong)UICollectionView *discoverCollectionView;

@end

@implementation LCDiscoverViewController

- (void)viewWillAppear:(BOOL)animated {

    [_discoverCollectionView reloadData];

}


#pragma mark - 创建底层CollectionView
- (void)createConllectionView {
    
    UICollectionViewFlowLayout *discoverFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    discoverFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    discoverFlowLayout.minimumInteritemSpacing = 0;
    discoverFlowLayout.minimumLineSpacing = 0;
    discoverFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    discoverFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    self.discoverCollectionView = [[UICollectionView alloc] initWithFrame:SCREEN_RECT collectionViewLayout:discoverFlowLayout];
    _discoverCollectionView.backgroundColor = [UIColor whiteColor];
    _discoverCollectionView.delegate = self;
    _discoverCollectionView.dataSource = self;
    [self.view addSubview:_discoverCollectionView];
    
    [_discoverCollectionView registerClass:[LCDiscoverCollectionViewCell class] forCellWithReuseIdentifier:discoverCell];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 隐藏navigationBar
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    [self createConllectionView];
    
   }


#pragma mark - collectionView协议方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    LCDiscoverCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:discoverCell forIndexPath:indexPath];
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
