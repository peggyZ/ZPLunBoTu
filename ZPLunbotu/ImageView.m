//
//  ImageView.m
//  ZPLunbotu
//
//  Created by kaifa001 on 16/7/25.
//  Copyright © 2016年 Peggy. All rights reserved.
//

#import "ImageView.h"
#define kWidth self.frame.size.width
@implementation ImageView
-(instancetype)initWithFrame:(CGRect)frame andNumberOfImage:(NSInteger)numberOfImage andFrameOfPagecontrol:(CGRect)frameOfPagecontrol{
    self = [super initWithFrame:frame];
    if (self) {
        self.num = numberOfImage;
        _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(kWidth*numberOfImage,200.0);
        _scrollView.backgroundColor = [UIColor redColor];
//        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;

        [self addSubview:_scrollView];
        [self create:frameOfPagecontrol];


        for (int i = 0; i < numberOfImage; i++) {
            _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * kWidth, 0, kWidth, self.frame.size.height)];
            _imageView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
            [_scrollView addSubview:_imageView];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(doWithTimer) userInfo:nil repeats:YES];
    }
    return self;
}
- (void)doWithTimer{
    if (_pageControl.currentPage == self.num-1) {
        _pageControl.currentPage = 0;
        _scrollView.contentOffset = CGPointMake(0, 0);
    }else{
    _pageControl.currentPage ++;
        _scrollView.contentOffset = CGPointMake(_pageControl.currentPage *kWidth, 0);}
}

- (void)startTimer{
    // 移除原来的
    [self removeTimer];
    // 开启新的
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(doWithTimer) userInfo:nil repeats:YES];
}

- (void)removeTimer{
    if (!self.timer) {
        return;
    }
    [self.timer invalidate];
    self.timer = nil;
}
// 创建pageControl
- (void)create:(CGRect)frameOfPagecontrol{
    _pageControl = [[UIPageControl alloc]initWithFrame:frameOfPagecontrol];
    _pageControl.numberOfPages = _num;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];

    [_pageControl addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_pageControl];
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self startTimer];
    scrollView = _scrollView;
    if (scrollView.contentOffset.x > 0) {
        _pageControl.currentPage = scrollView.contentOffset.x / kWidth;
    }
    if (scrollView.contentOffset.x <= 0) {
        _pageControl.currentPage = -scrollView.contentOffset.x / kWidth;
    }
}
- (void)click:(UIPageControl *)con{
    [self.timer invalidate];
    _pageControl.currentPage = con.currentPage;
    _scrollView.contentOffset = CGPointMake(_pageControl.currentPage *kWidth, 0) ;
}
@end
