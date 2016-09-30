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
#import "LCMagazineRecomment.h"
#import "UIImageView+WebCache.h"

static NSString *const subMagRecomCell = @"cell";

@interface LCMagazineTwoTableViewCell ()

<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@property (nonatomic, strong)NSMutableArray *magazineRecArray;

@property (nonatomic, strong)UICollectionView *subMagRecom;

@end

@implementation LCMagazineTwoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.magazineRecArray = [NSMutableArray array];
        
        UICollectionViewFlowLayout *subTaikFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        subTaikFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH * 0.4, SCREEN_HEIGHT * 0.27);
        subTaikFlowLayout.minimumInteritemSpacing = 10;
        subTaikFlowLayout.minimumLineSpacing = 10;
        subTaikFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.subMagRecom = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.3) collectionViewLayout:subTaikFlowLayout];
        _subMagRecom.backgroundColor = [UIColor colorWithRed:0.906 green:0.925 blue:0.937 alpha:1.000];
        _subMagRecom.delegate = self;
        _subMagRecom.dataSource = self;
        _subMagRecom.showsHorizontalScrollIndicator = NO;
        [self addSubview:_subMagRecom];
        
        [_subMagRecom registerClass:[LCSubMagRecomCollectionViewCell class] forCellWithReuseIdentifier:subMagRecomCell];
        
        [self getDataFromJson];
        
    }
    return self;
}

#pragma mark - 网络请求
- (void)getDataFromJson {
    
    NSString *url = @"http://v20.tp.wkread.com/index.php/v20/Discovery";
    
    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
                                @"Token": @"CQBLBTDFEQ0UDECA"};
    
    [BHNetTool GET:url Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        NSDictionary *data = [dic objectForKey:@"data"];
        
        NSArray *magazine_recommend = [data objectForKey:@"magazine_recommend"];
        
        
        // magazine_recomment 请求
        for (NSDictionary *magRecDic in magazine_recommend) {
            LCMagazineRecomment *magazineRec = [LCMagazineRecomment magazineRecWithMagazineRecDic:magRecDic];
            [_magazineRecArray addObject:magazineRec];
        }
        
        [_subMagRecom reloadData];
    } Failure:^(NSError *error) {
        
    }];
    
}


#pragma mark - collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _magazineRecArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LCSubMagRecomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:subMagRecomCell forIndexPath:indexPath];
    
    
    
    LCMagazineRecomment *magRec = _magazineRecArray[indexPath.item];
    cell.topText = [NSString stringWithFormat:@"『%@』", magRec.title];
    cell.artText = [NSString stringWithFormat:@"%ld文章", magRec.article_count];
    cell.subscribeText = [NSString stringWithFormat:@"%ld订阅", magRec.subscribe_count];
    cell.nameText = [magRec.user objectForKey:@"nickname"];
    
    NSString *imageURL = [magRec.img_info objectForKey:@"src"];
    [cell.magRecomImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    
    NSString *userURL = [[magRec.user objectForKey:@"img_info"] objectForKey:@"src"];
    [cell.userImageView sd_setImageWithURL:[NSURL URLWithString:userURL]];
    
    cell.cornerRadius = 11;
    
    return cell;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
