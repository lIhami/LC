//
//  LCSubRecommentTypeThreeTableViewCell.h
//  LC_微刊
//
//  Created by dllo on 16/9/24.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSubRecommentTypeThreeTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *mainImageView;

@property (nonatomic, strong)UILabel *typeThreeLabel;

@property (nonatomic, copy)NSString *typeThreeText;

@property (nonatomic, strong)UILabel *browseLabel;

@property (nonatomic, copy)NSString *browseText;

@property (nonatomic, strong)UILabel *commentLabel;

@property (nonatomic, copy)NSString *commentText;

@property (nonatomic, strong)UILabel *authorLabel;

@property (nonatomic, copy)NSString *authorText;

@end
