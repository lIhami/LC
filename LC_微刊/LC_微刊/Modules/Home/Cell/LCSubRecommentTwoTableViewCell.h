//
//  LCSubRecommentTwoTableViewCell.h
//  LC_微刊
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSubRecommentTwoTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *imageViewOne;

@property (nonatomic, strong)UIImage *imageOne;

@property (nonatomic, strong)UIImageView *imageViewTwo;

@property (nonatomic, strong)UIImage *imageTwo;

@property (nonatomic, strong)UIImageView *imageViewThree;

@property (nonatomic, strong)UIImage *imageThree;

@property (nonatomic, strong)UILabel *recommentTypeTwoLabel;

@property (nonatomic, copy)NSString *typeTwoText;

@property (nonatomic, strong)UILabel *browseLabel;

@property (nonatomic, copy)NSString *browseText;

@property (nonatomic, strong)UILabel *commentLabel;

@property (nonatomic, copy)NSString *commentText;

@property (nonatomic, strong)UILabel *authorLabel;

@property (nonatomic, copy)NSString *authorText;


@end
