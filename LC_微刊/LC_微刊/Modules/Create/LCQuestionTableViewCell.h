//
//  LCQuestionTableViewCell.h
//  LC_微刊
//
//  Created by Omaiga on 16/10/11.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCQuestionTableViewCell : UITableViewCell
// 左边标题
@property (nonatomic, strong)UILabel *titleLabel;
// 右边符号
@property (nonatomic, strong)UILabel *rightLabel;

@property (nonatomic, copy)NSString *titleText;

@end
