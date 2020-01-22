//
//  LZTableViewCell.h
//  LZDefaultView_Example
//
//  Created by liuzhu on 2020/1/22.
//  Copyright © 2020 630775508@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LZTableViewCell : UITableViewCell

@property(nonatomic,strong)LZModel * model;

@property(nonatomic,weak)UILabel * nameLabel;

@end

NS_ASSUME_NONNULL_END
