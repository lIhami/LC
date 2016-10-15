//
//  MyCollectionViewCell.h
//  Animation
//
//  Created by Eiwodetianna on 15/6/19.
//  Copyright © 2015年 jinxinliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XLImagePageDetailCellDelegate <NSObject>

- (void)XLImagePageDetailCellDidSelectedWithIndex:(NSInteger)cellIndex;

@end


@interface XLImagePageDetailCell : UICollectionViewCell

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, weak) id<XLImagePageDetailCellDelegate>delegate;


@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, copy)NSString *titleText;

@property (nonatomic, strong)UILabel *artLabel;

@property (nonatomic, copy)NSString *artText;

@property (nonatomic, strong)UILabel *lineLabel;

@property (nonatomic, strong)UILabel *subscribeLabel;

@property (nonatomic, copy)NSString *subscribeText;


@end
