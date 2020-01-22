//
//  LZViewController.m
//  LZDefaultView
//
//  Created by 630775508@qq.com on 01/12/2020.
//  Copyright (c) 2020 630775508@qq.com. All rights reserved.
//

#import "LZViewController.h"
#import <LZDefaultView/LZDefaultView.h>
#import <Masonry/Masonry.h>

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

//事件响应者链
- (void)eventLinks
{
    UIButton * testButton1 = [UIButton buttonWithType:UIButtonTypeSystem];
    testButton1.backgroundColor = [UIColor redColor];
    [testButton1 addTarget:self action:@selector(testButton1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton1];
    [testButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.width.height.mas_equalTo(50);
    }];
    
    UIButton * testButton2 = [UIButton buttonWithType:UIButtonTypeSystem];
    testButton2.backgroundColor = [UIColor yellowColor];
    [testButton2 addTarget:self action:@selector(testButton2Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton2];
    [testButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.width.height.mas_equalTo(50);
    }];
    testButton2.userInteractionEnabled = NO;
    
    UIImageView * testImageView = [[UIImageView alloc]init];
    testImageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:testImageView];
    [testImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(100);
        make.width.height.mas_equalTo(50);
    }];
}

- (void)testButton1Action:(UIButton *)button
{
    NSLog(@"button1Action");
}

- (void)testButton2Action:(UIButton *)button
{
    NSLog(@"button2Action");
}

@end
