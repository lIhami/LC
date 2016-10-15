//
//  LCSpecialNewTableViewCell.m
//  LC_微刊
//
//  Created by dllo on 16/9/27.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSpecialNewTableViewCell.h"
#import "LCMacro.h"
#import "XLImagePageView.h"
#import "LCNewSpecial.h"

@interface LCSpecialNewTableViewCell ()

<
XLImagePageViewDelegate
>

@property (nonatomic, strong)NSMutableArray *specialNewArray;

@property (nonatomic, strong)NSMutableArray *myImageArray;

@property (nonatomic, strong)NSMutableArray *titleArray;

@property (nonatomic, strong)NSMutableArray *articleArray;

@property (nonatomic, strong)NSMutableArray *subArray;

@property (nonatomic, strong)XLImagePageView *specialNewPageView;

@end


@implementation LCSpecialNewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        
        self.specialNewImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 0, SCREEN_WIDTH, 144)];
        _specialNewImageView.image = [UIImage imageNamed:@"background.png"];
        _specialNewImageView.backgroundColor = [UIColor cyanColor];
        [self addSubview:_specialNewImageView];
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.6, SCREEN_WIDTH * 0.06)];
        _titleLabel.text = @"";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 1;
        [self addSubview:_titleLabel];
        
        
        self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.38, SCREEN_WIDTH * 0.2, SCREEN_WIDTH * 0.24, 1)];
        _lineLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_lineLabel];
        
        
        self.artLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.37, SCREEN_WIDTH * 0.22, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.05)];
        _artLabel.numberOfLines = 1;
        _artLabel.textColor = [UIColor whiteColor];
        _artLabel.font = [UIFont systemFontOfSize:12];
        _artLabel.text = @"";
        [self addSubview:_artLabel];
        
        
        self.subscribeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.51, SCREEN_WIDTH * 0.22, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.05)];
        _subscribeLabel.numberOfLines = 1;
        _subscribeLabel.textColor = [UIColor whiteColor];
        _subscribeLabel.font = [UIFont systemFontOfSize:12];
        _subscribeLabel.text = @"";
        [self addSubview:_subscribeLabel];
        
    }
    return self;
}


#pragma mark - set方法传值
- (void)setSpecialNewImage:(UIImage *)specialNewImage {
    if (_specialNewImage != specialNewImage) {
        _specialNewImage = specialNewImage;
        _specialNewImageView.image = specialNewImage;
    }
}

- (void)setTitleText:(NSString *)titleText {
    if (_titleText != titleText) {
        _titleText = titleText;
        _titleLabel.text = titleText;
    }
}

- (void)setArtText:(NSString *)artText {
    if (_artText != artText) {
        _artText = artText;
        _artLabel.text = artText;
    }
}

- (void)setSubscribeText:(NSString *)subscribeText {
    if (_subscribeText != subscribeText) {
        _subscribeText = subscribeText;
        _subscribeLabel.text = subscribeText;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
