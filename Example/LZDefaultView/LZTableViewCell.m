//
//  LZTableViewCell.m
//  LZDefaultView_Example
//
//  Created by liuzhu on 2020/1/22.
//  Copyright © 2020 630775508@qq.com. All rights reserved.
//

#import "LZTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation LZTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        UILabel * nameLabel = [[UILabel alloc]init];
        nameLabel.font = [UIFont systemFontOfSize:15];
        nameLabel.textColor = [UIColor redColor];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.numberOfLines = 0;
        nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:nameLabel];
        _nameLabel = nameLabel;
    }
    return _nameLabel;
}

- (void)setUpSubViewsConstrains
{
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(5);
        make.right.bottom.mas_equalTo(-5);
    }];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setUpSubViewsConstrains];
    }
    return self;
}

- (void)setModel:(LZModel *)model
{
    if (_model != model)
    {
        _model = model;
        
        [self setUpSubViewsLayouts];
    }
}

- (void)setUpSubViewsLayouts
{
    self.nameLabel.text = self.model.nameString;
}

@end
