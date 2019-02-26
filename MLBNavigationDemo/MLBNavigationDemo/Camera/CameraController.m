//
//  CameraController.m
//  TestNavi
//
//  Created by Mac on 2019/1/14.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "CameraController.h"

@interface CameraController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CameraController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.naviBgColor = RGB(20, 182, 200, 1);
    
    [self.tableView reloadData];
    
}

- (UITableView *)tableView
{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNaviHeight, kScreenW, kScreenH-kNaviHeight-kTabbarHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark - creatUI lazy


#pragma mark - layout
- (void)addConstraintsAndActions
{
    
}

#pragma mark - delegateMethod
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //    [self presentViewController:[Camera2Controller new] animated:YES completion:nil];
//    [self.navigationController pushViewController:[Camera2Controller new] animated:YES];
    
}
#pragma mark - setter

#pragma mark - buttonAction


#pragma mark - data

@end
