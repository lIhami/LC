//
//  LCSpecialRecommendCarouselView.h
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LCSpecialRecommendCarouselViewDelegate <NSObject>

- (void)deceleratingScrollViewWithPageNumber:(NSInteger)pageNumber;

@end

@interface LCSpecialRecommendCarouselView : UIView

@property (nonatomic, assign)id<LCSpecialRecommendCarouselViewDelegate>delegate;

@property (nonatomic, strong)NSMutableArray *imageArray;

@property (nonatomic, assign)NSInteger pageNumber;

@end

