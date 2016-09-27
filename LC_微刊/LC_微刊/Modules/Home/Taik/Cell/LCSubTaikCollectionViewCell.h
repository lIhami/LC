//
//  LCSubTaikCollectionViewCell.h
//  LC_微刊
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSubTaikCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)UIImageView *taikImageView;

@property (nonatomic, strong)UIImage *taikImage;

@property (nonatomic, strong)UILabel *titleTailLabel;

@property (nonatomic, strong)UILabel *articleTailLabel;

@property (nonatomic, strong)UILabel *attentionTailLabel;

@property (nonatomic, copy)NSString *titleTailText;

@property (nonatomic, copy)NSString *articleTailText;

@property (nonatomic, copy)NSString *attentionTailText;

@end
