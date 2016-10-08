//
//  LCMyTitleCollectionViewCell.h
//  LC_微刊
//
//  Created by Omaiga on 16/10/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCMyTitleCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)UILabel *titleLable;

@property (nonatomic, copy)NSString *text;

@property (nonatomic, strong)UILabel *lineLabel;

@property (nonatomic , assign) BOOL didSelected;

@end
