//
//  LCSubMagRecomCollectionViewCell.h
//  LC_微刊
//
//  Created by dllo on 16/9/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSubMagRecomCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)UIImageView *magRecomImageView;

@property (nonatomic, strong)UIImage *magRecomImage;

@property (nonatomic, strong)UILabel *topMagRecomLabel;

@property (nonatomic, copy)NSString *topText;

@property (nonatomic, strong)UILabel *nameLabel;

@property (nonatomic, copy)NSString *nameText;

@property (nonatomic, strong)UILabel *artLabel;

@property (nonatomic, copy)NSString *artText;

@property (nonatomic, strong)UILabel *subscribeLabel;

@property (nonatomic, copy)NSString *subscribeText;

@property (nonatomic, strong)UIImageView *userImageView;

@property (nonatomic, strong)UIImage *userImage;

@property (nonatomic, assign)float cornerRadius;

@end
