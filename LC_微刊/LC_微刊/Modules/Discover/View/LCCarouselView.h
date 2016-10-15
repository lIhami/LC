//
//  LCCarouselView.h
//  LC_微刊
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LCDiscoverCarouselViewDelegate <NSObject>

- (void)deceleratingScrollViewWithPageNumber:(NSInteger)pageNumber;

@end


@interface LCCarouselView : UIView

@property (nonatomic, assign)id<LCDiscoverCarouselViewDelegate>delegate;

@property (nonatomic, strong)NSMutableArray *imageArray;



@end
