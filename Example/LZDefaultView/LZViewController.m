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
#import "LZTableViewCell.h"

@interface LZViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)LZDefaultView * defaultView;

@property(nonatomic,weak)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * modelArray;

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

- (UITableView *)tableView
{
    if (!_tableView)
    {
        UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.estimatedRowHeight = 44;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray *)modelArray
{
    if (!_modelArray)
    {
        NSMutableArray * modelArray = [NSMutableArray array];
        _modelArray = modelArray;
    }
    return _modelArray;
}

- (void)setUpSubViews
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
    
    NSArray * tempArray = @[
    @"哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或",
    @"哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或",
    @"哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或",
    @"哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或",
    @"哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或",
    ];
    for (int i = 0; i < tempArray.count; i++)
    {
        LZModel * model = [[LZModel alloc]init];
        model.nameString = tempArray[i];
        [self.modelArray addObject:model];
    }
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpSubViews];
}

#pragma mark - tableviewDatasource & delegate
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString * cellReuse = @"cellReuse";
    LZTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellReuse];
    if (!cell)
    {
        cell = [[LZTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuse];
    }
    cell.model = self.modelArray[indexPath.row];
    return cell;
}

//设置默认图
- (void)setUpDefaultView
{
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
