//
//  LZViewController.m
//  LZDefaultView
//
//  Created by 630775508@qq.com on 01/12/2020.
//  Copyright (c) 2020 630775508@qq.com. All rights reserved.
//

#import "LZViewController.h"
#import <LZDefaultView/LZDefaultView.h>

@interface LZViewController ()

@property(nonatomic,weak)LZDefaultView * defaultView;

@end

@implementation LZViewController

- (LZDefaultView *)defaultView
{
    if (!_defaultView)
    {
        LZDefaultView * defaultView = [LZDefaultView new];
        [self.view addSubview:defaultView];
        _defaultView = defaultView;
    }
    return _defaultView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.defaultView.backgroundColor = [UIColor cyanColor];
    [self.defaultView setImageName:@"LZ_hacker.jpg" firstString:@"你好" secondString:@"世界"];
    self.defaultView.bgViewBlock = ^(UIView * _Nonnull bgView) {
        NSLog(@"%@",bgView);
    };
    self.defaultView.imageBlock = ^(UIImageView * _Nonnull imageView) {
        NSLog(@"%@",imageView);
    };
    self.defaultView.firstLabelBlok = ^(UILabel * _Nonnull firstLabel) {
        NSLog(@"%@",firstLabel);
    };
    self.defaultView.secondLabelBlock = ^(UILabel * _Nonnull secondLabel) {
        NSLog(@"%@",secondLabel);
    };
}

@end
