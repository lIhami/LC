//
//  LCSpecialNewTableViewCell.h
//  LC_微刊
//
//  Created by dllo on 16/9/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSpecialNewTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *specialNewImageView;

@property (nonatomic, strong)UIImage *specialNewImage;

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, copy)NSString *titleText;

@property (nonatomic, strong)UILabel *artLabel;

@property (nonatomic, copy)NSString *artText;

@property (nonatomic, strong)UILabel *lineLabel;

@property (nonatomic, strong)UILabel *subscribeLabel;

@property (nonatomic, copy)NSString *subscribeText;


@end
