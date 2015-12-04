//
//  ViewController.m
//  20151204002-UITableView-LOLPlain
//
//  Created by Rainer on 15/12/4.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "HeroModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *heroArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置tableView数据源代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // 设置tableView内边距
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    // 设置tableView统一高度:这里如果实现了表格控件的代理方法则不执行
    self.tableView.rowHeight = 80;
}

#pragma mark - 表格数据源代理方法
/**
 *  返回当前组中的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.heroArray.count;
}

/**
 *  返回表格的单元格
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (nil == tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    }
    
    HeroModel *heroModel = self.heroArray[indexPath.row];
    
    tableViewCell.imageView.image = [UIImage imageNamed:heroModel.icon];
    tableViewCell.textLabel.text = heroModel.name;
    tableViewCell.detailTextLabel.text = heroModel.intro;
    
    return tableViewCell;
}

#pragma mark - 表格代理方法
/**
 *  返回当前行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row % 2 ? 44 : 120;
}

#pragma mark - 属性懒加载
/**
 *  懒加载获取数据源
 */
- (NSArray *)heroArray {
    if (nil == _heroArray) {
        _heroArray = [HeroModel heroArray];
    }
    
    return _heroArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
