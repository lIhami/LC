//
//  LCTaikCollectionViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCTaikCollectionViewCell.h"
#import "LCMacro.h"
#import "LCSubTaikCollectionViewCell.h"
#import "TaikModel.h"
#import "UIImageView+WebCache.h"

// tableView重用池
static NSString *const taikCell = @"cell";
// collectionView重用池
static NSString *const subTaikCell = @"cellaction";

@interface LCTaikCollectionViewCell ()

<
UIScrollViewDelegate,
//UITableViewDataSource,
//UITableViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegate
>

@property (nonatomic, retain)NSArray *arrHot_list;

@property (nonatomic, strong)UICollectionView *subTaikCollectionView;

@end

@implementation LCTaikCollectionViewCell

#pragma mark - 话题页布局
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 最底层scrollView
        UIScrollView *taikScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        taikScrollView.contentSize = CGSizeMake(SCREEN_WIDTH , SCREEN_HEIGHT);
        taikScrollView.delegate = self;
        [self addSubview:taikScrollView];
        
        // 上部分collectionView
        UICollectionViewFlowLayout *subTaikFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        subTaikFlowLayout.itemSize = CGSizeMake(SCREEN_WIDTH * 0.4, SCREEN_HEIGHT * 0.27);
        subTaikFlowLayout.minimumInteritemSpacing = 15;
        subTaikFlowLayout.minimumLineSpacing = 15;
        subTaikFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.subTaikCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * 0.3) collectionViewLayout:subTaikFlowLayout];
        _subTaikCollectionView.backgroundColor = [UIColor colorWithRed:0.906 green:0.925 blue:0.937 alpha:1.000];
        _subTaikCollectionView.delegate = self;
        _subTaikCollectionView.dataSource = self;
        _subTaikCollectionView.showsHorizontalScrollIndicator = NO;
        [taikScrollView addSubview:_subTaikCollectionView];
        
        [_subTaikCollectionView registerClass:[LCSubTaikCollectionViewCell class] forCellWithReuseIdentifier:subTaikCell];
        
        
        
        [self getDataFromJson1];
        
        
    }
    return self;
}


#pragma mark - 网络请求
- (void)getDataFromJson1 {
    
    
    NSDictionary *headerDic = @{@"Token": @"CQBLBTDFEQ0UDECA"};
    
    NSString *url = @"http://v20.wkread.com/api.php/home/special";
    
    
    [BHNetTool GET:url Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
        
        
        self.arrHot_list = [NSArray array];
        
        NSDictionary *dic = (NSDictionary *)result;
        
        NSDictionary *arrData = [dic objectForKey:@"data"];
        _arrHot_list = [arrData objectForKey:@"hot_list"];
        

        [_subTaikCollectionView reloadData];
 
    } Failure:^(NSError *error) {
        NSLog(@"%@", error);
        
    }];
    
    [self reloadInputViews];

}



#pragma mark - collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrHot_list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     LCSubTaikCollectionViewCell *subCell = [collectionView dequeueReusableCellWithReuseIdentifier:subTaikCell forIndexPath:indexPath];
    
    subCell.titleTailLabel.text = [NSString stringWithFormat:@"%@", [_arrHot_list[indexPath.row] objectForKey:@"name"]];
    subCell.articleTailLabel.text = [NSString stringWithFormat:@"%@文章",[_arrHot_list[indexPath.row] objectForKey:@"article_count"]];
    subCell.attentionTailLabel.text = [NSString stringWithFormat:@"%@关注", [_arrHot_list[indexPath.row] objectForKey:@"subscribe_count"]];
    
    NSString *imageURL = [[_arrHot_list[indexPath.row] objectForKey:@"img_info"] objectForKey:@"src"];
    [subCell.taikImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    
    subCell.backgroundColor = [UIColor whiteColor];
    
    return subCell;
    
}



@end
