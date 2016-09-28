//
//  LCMagazineTwoTableViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCMagazineTwoTableViewCell.h"
#import "LCMacro.h"
#import "LCSubMagRecomCollectionViewCell.h"

static NSString *const subMagRecomCell = @"cell";

@interface LCMagazineTwoTableViewCell ()

<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@end

@implementation LCMagazineTwoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 上部分collectionView
        UICollectionViewFlowLayout *subTaikFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        subTaikFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH * 0.4, SCREEN_HEIGHT * 0.27);
        subTaikFlowLayout.minimumInteritemSpacing = 10;
        subTaikFlowLayout.minimumLineSpacing = 10;
        subTaikFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView *subMagRecom = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.3) collectionViewLayout:subTaikFlowLayout];
        subMagRecom.backgroundColor = [UIColor colorWithRed:0.906 green:0.925 blue:0.937 alpha:1.000];
        subMagRecom.delegate = self;
        subMagRecom.dataSource = self;
        subMagRecom.showsHorizontalScrollIndicator = NO;
        [self addSubview:subMagRecom];
        
        [subMagRecom registerClass:[LCSubMagRecomCollectionViewCell class] forCellWithReuseIdentifier:subMagRecomCell];

    }
    return self;
}

#pragma mark - collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 26;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LCSubMagRecomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:subMagRecomCell forIndexPath:indexPath];
    
    return cell;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
