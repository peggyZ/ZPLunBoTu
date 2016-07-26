//
//  ImageView.h
//  ZPLunbotu
//
//  Created by kaifa001 on 16/7/25.
//  Copyright © 2016年 Peggy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageView : UIView <UIScrollViewDelegate>
@property (strong,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UIPageControl *pageControl;
@property (assign,nonatomic) NSInteger num;// 轮播图的个数
@property (strong,nonatomic) NSTimer *timer;

-(instancetype)initWithFrame:(CGRect)frame andNumberOfImage:(NSInteger)numberOfImage andFrameOfPagecontrol:(CGRect)frameOfPagecontrol;
@end
