//
//  DefaultView.m
//  TestApp
//
//  Created by liuzhu on 2020/1/11.
//  Copyright © 2020 liuzhu. All rights reserved.
//

#import "LZDefaultView.h"
#import "Masonry.h"

#define MainWidth [UIScreen mainScreen].bounds.size.width
#define MainHeigth [UIScreen mainScreen].bounds.size.height

@interface LZDefaultView ()

@property(nonatomic,weak)UIImageView * imageView;
@property(nonatomic,weak)UILabel * firstLabel;
@property(nonatomic,weak)UILabel * secondLabel;

@end

@implementation LZDefaultView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, MainWidth, MainHeigth)];
    if (self)
    {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction:(UIGestureRecognizer *)ges
{
    [self removeFromSuperview];
}

- (void)setImageName:(NSString *)ImageName
         firstString:(NSString *)firstString
        secondString:(NSString *)secondString
{
    if (!ImageName)
    {
        assert("imageName is nil");
    }
    else if(!firstString)
    {
        assert("firstString is nil");
    }
    else if (!secondString)
    {
        assert("firstString is nil");
    }
    else
    {
        self.imageView.image = [self getImageFromRelateBundle:ImageName];
        
        self.firstLabel.text = firstString;
        self.firstLabel.textAlignment = NSTextAlignmentCenter;
        
        self.secondLabel.text = secondString;
        self.secondLabel.textAlignment = NSTextAlignmentCenter;
        
        [self setUpConstraints];
    }
}

- (void)setUpConstraints
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(300);
        make.centerX.mas_equalTo(self);
        make.centerY.mas_lessThanOrEqualTo(self);
    }];
    
    [self.firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(10);
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).mas_offset(50);
    }];
    
    [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(self.firstLabel.mas_bottom).mas_offset(10);
    }];
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView * imageView = [UIImageView new];
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (UILabel *)firstLabel
{
    if (!_firstLabel)
    {
        UILabel * firstLabel = [UILabel new];
        [self addSubview:firstLabel];
        _firstLabel = firstLabel;
    }
    return _firstLabel;
}

- (UILabel *)secondLabel
{
    if (!_secondLabel)
    {
        UILabel * secondLabel = [UILabel new];
        [self addSubview:secondLabel];
        _secondLabel = secondLabel;
    }
    return _secondLabel;
}

- (UIImage *)getImageFromRelateBundle:(NSString *)imageName
{
    NSString * className = [NSString stringWithFormat:@"%@",[self class]];
    NSBundle * myBundle = [NSBundle bundleForClass:[self class]];
    NSString * path = [NSString stringWithFormat:@"%@/%@.bundle/%@",[myBundle resourcePath],className,imageName];
    UIImage * image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end
