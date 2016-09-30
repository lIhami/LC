//
//  LCSpecialRecommendTableViewCell.m
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSpecialRecommendTableViewCell.h"
#import "LCSpecialRecommendZoomScrollView.h"
#import "LCSpecialRecommendCarouselView.h"
#import "LCMacro.h"
#import "LCSpecialRecommend.h"

@interface LCSpecialRecommendTableViewCell ()

<
LCSpecialRecommendCarouselViewDelegate
>

@property (nonatomic, strong)LCSpecialRecommendCarouselView *carouselView;

@property (nonatomic, strong)NSMutableArray *specialArray;

@property (nonatomic, strong)NSMutableArray *myImageArray;

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)UILabel *descLabel;

@property (nonatomic, strong)UILabel *artLabel;

@property (nonatomic, strong)UILabel *subLabel;

@end

@implementation LCSpecialRecommendTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.myImageArray = [NSMutableArray array];
        self.specialArray = [NSMutableArray array];
        
        [self getDataFromJson];
        
        self.carouselView = [[LCSpecialRecommendCarouselView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.4)];
        _carouselView.delegate = self;
        [self addSubview:_carouselView];
        
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.41, SCREEN_WIDTH * 0.94, SCREEN_WIDTH * 0.08)];
        _titleLabel.text = @"话题 | #情爱经#";
        [self addSubview:_titleLabel];
        
        self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.49, SCREEN_WIDTH * 0.94, SCREEN_WIDTH * 0.06)];
        _descLabel.textColor = [UIColor grayColor];
        _descLabel.text = @"世间最令人纠结、困惑的男女感情，你想了解的都在...";
        _descLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_descLabel];
        
        self.artLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.03, SCREEN_WIDTH * 0.55, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.05)];
        _artLabel.textColor = [UIColor grayColor];
        _artLabel.text = @"201文章";
        _artLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_artLabel];
        
        self.subLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.16, SCREEN_WIDTH * 0.55, SCREEN_WIDTH * 0.13, SCREEN_WIDTH * 0.05)];
        _subLabel.text = @"289订阅";
        _subLabel.textColor = [UIColor grayColor];
        _subLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_subLabel];
        
        
    }
    return self;
}


- (void)deceleratingScrollViewWithPageNumber:(NSInteger)pageNumber {
    
    NSLog(@"~~~~%ld", pageNumber);
    
    LCSpecialRecommend *special = _specialArray[pageNumber];
    _titleLabel.text = [NSString stringWithFormat:@"话题 | #%@#", special.name];
    _descLabel.text = special.describe;
    _artLabel.text = [NSString stringWithFormat:@"%ld文章", special.article_count];
    _subLabel.text = [NSString stringWithFormat:@"%ld订阅", special.subscribe_count];
    
    
}

#pragma mark - 网络请求
- (void)getDataFromJson {
    
    NSString *url = @"http://v20.tp.wkread.com/index.php/v20/Discovery";
    
    NSDictionary *headerDic = @{@"Host":@"v20.tp.wkread.com",
                                @"Token": @"CQBLBTDFEQ0UDECA"};
    
    [BHNetTool GET:url Body:nil HeaderFile:headerDic Response:BHJSON Success:^(id result) {
        
        NSDictionary *dic = (NSDictionary *)result;
        
        NSDictionary *data = [dic objectForKey:@"data"];
        
        NSArray *special_recommend = [data objectForKey:@"special_recommend"];
        
        
        // special_recomment 请求
        for (NSDictionary *speRecDic in special_recommend) {
            LCSpecialRecommend *specialRec = [LCSpecialRecommend specialWithSpecialDic:speRecDic];
            [_specialArray addObject:specialRec];
        }
        
        for (NSDictionary *topDic in special_recommend) {
            NSString *urlOfString = [NSString stringWithFormat:@"%@", [[topDic objectForKey:@"img_info"] objectForKey:@"src"]];
            NSURL *imageUrl = [NSURL URLWithString: urlOfString];
            UIImage *topImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            [_myImageArray addObject:topImage];
        }
        
        
        _carouselView.imageArray = _myImageArray;
        
        
    } Failure:^(NSError *error) {
        
    }];
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
