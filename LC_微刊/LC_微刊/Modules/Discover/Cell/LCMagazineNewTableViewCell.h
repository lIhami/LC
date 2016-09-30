//
//  LCMagazineNewTableViewCell.h
//  LC_微刊
//
//  Created by dllo on 16/9/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCMagazineNewTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *magNewImageView;

@property (nonatomic, strong)UIImage *magNewImage;

@property (nonatomic, strong)UILabel *topMagNewLabel;

@property (nonatomic, copy)NSString *topText;

@property (nonatomic, strong)UILabel *desLabel;

@property (nonatomic, copy)NSString *desText;

@property (nonatomic, strong)UILabel *articleLabel;

@property (nonatomic, copy)NSString *articleText;

@property (nonatomic, strong)UILabel *subscribeLabel;

@property (nonatomic, copy)NSString *subscribeText;
@end
