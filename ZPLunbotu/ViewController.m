//
//  ViewController.m
//  ZPLunbotu
//
//  Created by kaifa001 on 16/7/25.
//  Copyright © 2016年 Peggy. All rights reserved.
//

#import "ViewController.h"
#import "ImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ImageView *imageView = [[ImageView alloc]initWithFrame:self.view.bounds andNumberOfImage:10 andFrameOfPagecontrol:CGRectMake(20, 180, self.view.bounds.size.width, 30)];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
