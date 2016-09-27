//
//  LCCarouselView.m
//  LC_微刊
//
//  Created by dllo on 16/9/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "LCCarouselView.h"
#import "LCMacro.h"
#import "LCZoomDisScrollView.h"

@interface LCCarouselView ()
<
UIScrollViewDelegate
>

@property (nonatomic, retain)UIScrollView *scrollView;

@property (nonatomic, retain)UIPageControl *pageControl;

@property (nonatomic, retain)NSMutableArray *currentImageArray;

@property (nonatomic, retain)NSTimer *timer;

@end


@implementation LCCarouselView

// 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.currentImageArray = [NSMutableArray array];
        self.imageArray = [NSMutableArray array];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        
        
        
        
       
        
    }
    return self;
}

// pageControl方法
- (void)pageControlAction:(UIPageControl *)pageControl {
    [_scrollView setContentOffset:CGPointMake((pageControl.currentPage + 1) * SCREEN_WIDTH, 0) animated:YES];
}

// set传值
- (void)setImageArray:(NSMutableArray *)imageArray {
    if (_imageArray != imageArray) {
        _imageArray = imageArray;
    
        
        
        if (imageArray.count > 0) {
            [_currentImageArray removeAllObjects];
            [_currentImageArray addObject:[_imageArray lastObject]];
            [_currentImageArray addObjectsFromArray:_imageArray];
            [_currentImageArray addObject:[_imageArray firstObject]];
            _scrollView.contentSize = CGSizeMake( SCREEN_WIDTH * _currentImageArray.count, SCREEN_HEIGHT * 0.27);
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
                
                LCZoomDisScrollView *zoomScrollView = [[LCZoomDisScrollView alloc] initWithFrame:zoomScrollFrame];
                
                zoomScrollView.image = _currentImageArray[i];
                
                zoomScrollView.delegate = self;
                
                zoomScrollView.maximumZoomScale = 2.0f;
                zoomScrollView.minimumZoomScale = 0.5f;
                [_scrollView addSubview:zoomScrollView];
                
            }
            
            _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
            
            if (_timer) {
                [_timer invalidate];
            }
            self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        }
  }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:_scrollView]) {
        NSInteger pageNumber = scrollView.contentOffset.x / SCREEN_WIDTH;
        if (0 == pageNumber) {
            pageNumber = _imageArray.count;
        } else if (_imageArray.count + 1 == pageNumber) {
            pageNumber = 1;
        }
        _pageControl.currentPage = pageNumber - 1;
        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width * pageNumber, 0);
        
        for (UIView *subview in scrollView.subviews) {
            if ([subview isKindOfClass:[LCZoomDisScrollView class]]) {
                UIScrollView *subScrollView = (UIScrollView *)subview;
                subScrollView.zoomScale = 1.0f;
            }
        }
        if ([scrollView isEqual:_scrollView]) {
            [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:3.0f]];
        }
    }
}


- (void)timerAction:(NSTimer *)timer {
    NSInteger pageNumber = _scrollView.contentOffset.x / SCREEN_WIDTH;
    if (_imageArray.count == pageNumber) {
        pageNumber = 0;
        _scrollView.contentOffset = CGPointMake(pageNumber * _scrollView.bounds.size.width, 0);
    }
    
    [_scrollView setContentOffset:CGPointMake((pageNumber + 1) * _scrollView.bounds.size.width, 0) animated:YES];
    _pageControl.currentPage = pageNumber;
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


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:_scrollView]) {
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

@end
