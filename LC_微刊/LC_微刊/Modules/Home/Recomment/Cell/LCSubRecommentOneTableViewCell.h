//
//  LCSubRecommentOneTableViewCell.h
//  LC_微刊
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSubRecommentOneTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *recommentTypeOneImageView;

@property (nonatomic, strong)UIImage *recommentTypeOneImage;

@property (nonatomic, strong)UILabel *recommentTypeOneLabel;

@property (nonatomic, copy)NSString *recommentTitleText;

@property (nonatomic, strong)UILabel *authorLabel;

@property (nonatomic, copy)NSString *authorText;

@end
