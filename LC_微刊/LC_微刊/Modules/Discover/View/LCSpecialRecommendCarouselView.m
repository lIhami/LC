//
//  LCSpecialRecommendCarouselView.m
//  LC_微刊
//
//  Created by Omaiga on 16/9/30.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCSpecialRecommendCarouselView.h"
#import "LCMacro.h"
#import "LCSpecialRecommendZoomScrollView.h"
#import "LCSpecialRecommendTableViewCell.h"
#import "LCSpecialRecommend.h"


@interface LCSpecialRecommendCarouselView ()

<
UIScrollViewDelegate
>

@property (nonatomic, strong)UIScrollView *scrollView;

@property (nonatomic, strong)UIPageControl *pageControl;

@property (nonatomic, strong)NSMutableArray *currentImageArray;


@end


@implementation LCSpecialRecommendCarouselView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.currentImageArray = [NSMutableArray array];
        self.imageArray = [NSMutableArray array];
        
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.directionalLockEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        
    }
    return self;
}



// pageControl方法
- (void)pageControlAction:(UIPageControl *)pageControl {
    [_scrollView setContentOffset:CGPointMake((pageControl.currentPage + 1) * SCREEN_WIDTH, 0)animated:YES];
    
}


- (void)setImageArray:(NSMutableArray *)imageArray {
    if (_imageArray != imageArray) {
        _imageArray = imageArray;
        
        
        
        if (imageArray.count > 0) {
            [_currentImageArray removeAllObjects];
            [_currentImageArray addObject:[_imageArray lastObject]];
            [_currentImageArray addObjectsFromArray:_imageArray];
            [_currentImageArray addObject:[_imageArray firstObject]];
            _scrollView.contentSize = CGSizeMake( SCREEN_WIDTH * _currentImageArray.count, SCREEN_HEIGHT * 0.4);
            _scrollView.pagingEnabled = YES;
            
            
            self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
            _pageControl.backgroundColor = [UIColor whiteColor];
            _pageControl.hidesForSinglePage = YES;
            _pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
            _pageControl.pageIndicatorTintColor = [UIColor clearColor];
            [_pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventEditingChanged];
            
            CGSize pageControlSize = [_pageControl sizeForNumberOfPages:_imageArray.count];
            CGPoint pageControlOrign = {(SCREEN_WIDTH - pageControlSize.width) / 2, SCREEN_HEIGHT * 0.27 - pageControlSize.height - 5};
            CGRect pageControlFrame = {pageControlOrign, pageControlSize};
            
            _pageControl.frame = pageControlFrame;
            _pageControl.backgroundColor = [UIColor clearColor];
            _pageControl.numberOfPages = _imageArray.count;
            _pageControl.currentPage = 0;
            
            
            for (int i = 0; i < _currentImageArray.count; i++) {
                // 设置小scrollView的尺寸(分三步1 : 第一步求size  2 : 求origin  3 : 求frame)
                CGSize zoomScrollSize = self.bounds.size;
                CGPoint zoomScrollOrign = {self.bounds.size.width * i, 0};
                CGRect zoomScrollFrame = {zoomScrollOrign, zoomScrollSize};
                
                LCSpecialRecommendZoomScrollView *zoomScrollView = [[LCSpecialRecommendZoomScrollView alloc] initWithFrame:zoomScrollFrame];
                
                zoomScrollView.image = _currentImageArray[i];
                
                zoomScrollView.delegate = self;
                
                zoomScrollView.maximumZoomScale = 2.0f;
                zoomScrollView.minimumZoomScale = 0.5f;
                [_scrollView addSubview:zoomScrollView];
                
            }
            
            _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
            
            
        }
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:_scrollView]) {
        self.pageNumber = scrollView.contentOffset.x / SCREEN_WIDTH;
        if (0 == _pageNumber) {
            _pageNumber = _imageArray.count;
        } else if (_imageArray.count + 1 == _pageNumber) {
            _pageNumber = 1;
        }
        _pageControl.currentPage = _pageNumber - 1;
        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width * _pageNumber, 0);
        
        for (UIView *subview in scrollView.subviews) {
            if ([subview isKindOfClass:[LCSpecialRecommendZoomScrollView class]]) {
                UIScrollView *subScrollView = (UIScrollView *)subview;
                subScrollView.zoomScale = 1.0f;
            }
        }
    }
    
    [self.delegate deceleratingScrollViewWithPageNumber:_pageControl.currentPage];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [scrollView.subviews firstObject];
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if (scrollView.contentSize.width <= scrollView.bounds.size.width) {
        UIImageView *imageView = [scrollView.subviews firstObject];
        imageView.center = CGPointMake(scrollView.bounds.size.width / 2, scrollView.bounds.size.height / 2);
    }
}


@end

