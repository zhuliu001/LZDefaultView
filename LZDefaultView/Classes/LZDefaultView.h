//
//  DefaultView.h
//  TestApp
//
//  Created by liuzhu on 2020/1/11.
//  Copyright © 2020 liuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BgViewBlock)(UIView * bgView);
typedef void(^ImageBlock)(UIImageView * imageView);
typedef void(^FirstLabelBlok)(UILabel * firstLabel);
typedef void(^SecondLabelBlock)(UILabel * secondLabel);

@interface LZDefaultView : UIView

@property(nonatomic,copy)BgViewBlock bgViewBlock;
@property(nonatomic,copy)ImageBlock imageBlock;
@property(nonatomic,copy)FirstLabelBlok firstLabelBlok;
@property(nonatomic,copy)SecondLabelBlock secondLabelBlock;

- (void)setImageName:(NSString *)ImageName
         firstString:(NSString *)firstString
        secondString:(NSString *)secondString;

@end

NS_ASSUME_NONNULL_END
