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
    /** 
     *  设置表格行分割线的样式：
     *      UITableViewCellSeparatorStyleSingleLine:单行分割线
     *      UITableViewCellSeparatorStyleSingleLineEtched：仅分组模式下可用
     *      UITableViewCellSeparatorStyleNone:没有分割线
     */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    // 设置表格行分割线颜色
    self.tableView.separatorColor = [UIColor redColor];
    // 设置表格背景颜色
    self.tableView.backgroundColor = [UIColor yellowColor];
    // 设置表格背景视图
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_01"]];
    
    // 设置头部视图
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 120)];
    headerView.backgroundColor = [UIColor blueColor];
    self.tableView.tableHeaderView = headerView;
    
    // 设置尾部视图
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
    footerView.backgroundColor = [UIColor greenColor];
    self.tableView.tableFooterView = footerView;
    
    // 设置弹簧效果
//    self.tableView.bounces = NO;
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
    // 1.定义一个可复用的静态标识符
    static NSString *cellIdentifier = @"cellIdentifier";
    
    // 2.让tableView使用可复用的静态标识符去缓存区查找可复用的单元格
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // 3.如果单元格不存在就重新创建一个单元格
    if (nil == tableViewCell) {
        // 3.1.使用静态标识符创建一个单元格
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
        // 3.2.设置单元格的属性
        if (indexPath.row % 2) {
            // 单元格的右侧视图类型
            tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        } else {
            // 设置单元格的右侧视图
            UISwitch *switcher = [[UISwitch alloc] init];
            [switcher addTarget:self action:@selector(switcherClickAction:) forControlEvents:UIControlEventValueChanged];
            
            tableViewCell.accessoryView = switcher;
        }
#if 0
        // UITableViewCell上的所有内容都应当放在contentView上
        tableViewCell.contentView.backgroundColor = [UIColor grayColor];
        // 单元格的背景视图
        tableViewCell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_01"]];
        // 单元格的选中背景视图
        tableViewCell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_02"]];
#endif
    }
    
    // 4.设置单元格的内容
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
    return indexPath.row % 2 ? 44 : 88;
}

/**
 *  表格行选中事件
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *messageString = [NSString stringWithFormat:@"您选择了%d行", (int)indexPath.row];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:messageString preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"hehe");
    }];
    
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - 事件监听处理
/**
 *  滑块视图值改变事件处理
 */
- (void)switcherClickAction:(UISwitch *)switcher {
    NSString *messageString = switcher.on ? @"开了" : @"关了";
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:messageString preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"hehe");
    }];
    
    [alertController addAction:alertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
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
