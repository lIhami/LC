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

@end

@implementation LCDiscoverViewController

#pragma mark - 创建底层CollectionView
- (void)createConllectionView {
    
    UICollectionViewFlowLayout *discoverFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    discoverFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    discoverFlowLayout.minimumInteritemSpacing = 0;
    discoverFlowLayout.minimumLineSpacing = 0;
    discoverFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    discoverFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    UICollectionView *discoverCollectionView = [[UICollectionView alloc] initWithFrame:SCREEN_RECT collectionViewLayout:discoverFlowLayout];
    discoverCollectionView.backgroundColor = [UIColor whiteColor];
    discoverCollectionView.delegate = self;
    discoverCollectionView.dataSource = self;
    [self.view addSubview:discoverCollectionView];
    
    [discoverCollectionView registerClass:[LCDiscoverCollectionViewCell class] forCellWithReuseIdentifier:discoverCell];
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
//    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
    
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
