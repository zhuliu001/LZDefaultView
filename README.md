# LZDefaultView

[![CI Status](https://img.shields.io/travis/630775508@qq.com/LZDefaultView.svg?style=flat)](https://travis-ci.org/630775508@qq.com/LZDefaultView)
[![Version](https://img.shields.io/cocoapods/v/LZDefaultView.svg?style=flat)](https://cocoapods.org/pods/LZDefaultView)
[![License](https://img.shields.io/cocoapods/l/LZDefaultView.svg?style=flat)](https://cocoapods.org/pods/LZDefaultView)
[![Platform](https://img.shields.io/cocoapods/p/LZDefaultView.svg?style=flat)](https://cocoapods.org/pods/LZDefaultView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

#import <LZDefaultView/LZDefaultView.h>

@property(nonatomic,weak)LZDefaultView * defaultView;

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

## Requirements

## Installation

LZDefaultView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LZDefaultView'
```

## Author

630775508@qq.com, zhuliu001@users.noreply.github.com

## License

LZDefaultView is available under the MIT license. See the LICENSE file for more info.
