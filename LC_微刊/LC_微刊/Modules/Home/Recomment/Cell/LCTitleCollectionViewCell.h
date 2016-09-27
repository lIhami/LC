//
//  LCTitleCollectionViewCell.h
//  LC_微刊
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCTitleCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)UILabel *titleLable;

@property (nonatomic, copy)NSString *text;

@property (nonatomic, strong)UILabel *lineLabel;

@property (nonatomic , assign) BOOL didSelected;

@end
