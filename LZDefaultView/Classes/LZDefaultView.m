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
        UITapGestureRecognizer * bgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgTapAction:)];
        [self addGestureRecognizer:bgTap];
    }
    return self;
}

- (void)bgTapAction:(UIGestureRecognizer *)ges
{
    if (self.bgViewBlock)
    {
        self.bgViewBlock(self);
    }
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
        UITapGestureRecognizer * imageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageTapAction:)];
        [self.imageView addGestureRecognizer:imageTap];
        self.imageView.userInteractionEnabled = YES;
        
        self.firstLabel.text = firstString;
        self.firstLabel.textAlignment = NSTextAlignmentCenter;
        UITapGestureRecognizer * firstTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(firstTapAction:)];
        [self.firstLabel addGestureRecognizer:firstTap];
        self.firstLabel.userInteractionEnabled = YES;
        
        self.secondLabel.text = secondString;
        self.secondLabel.textAlignment = NSTextAlignmentCenter;
        UITapGestureRecognizer * secondTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(secondTapAction:)];
        [self.secondLabel addGestureRecognizer:secondTap];
        self.secondLabel.userInteractionEnabled = YES;
        
        [self setUpConstraints];
    }
}

- (void)secondTapAction:(UIGestureRecognizer *)tap
{
    if (self.secondLabelBlock)
    {
        self.secondLabelBlock(self.secondLabel);
    }
}

- (void)firstTapAction:(UIGestureRecognizer *)tap
{
    if (self.firstLabelBlok)
    {
        self.firstLabelBlok(self.firstLabel);
    }
}

- (void)imageTapAction:(UIGestureRecognizer *)tap
{
    if (self.imageBlock)
    {
        self.imageBlock(self.imageView);
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
    if (!image)
    {
        assert("image in bundle is nil");
    }
    return image;
}

@end
