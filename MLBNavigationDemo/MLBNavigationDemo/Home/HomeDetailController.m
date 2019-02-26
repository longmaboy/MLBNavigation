//
//  HomeDetailController.m
//  TestNavi
//
//  Created by Mac on 2019/1/14.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "HomeDetailController.h"
#import "NextController.h"

@interface HomeDetailController ()

@end

@implementation HomeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleString = @"客户详情";
    
    self.naviBgColor = UIColor.blueColor;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    button.center = self.view.center;
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [button setTitleColor:UIColor.purpleColor forState:UIControlStateHighlighted];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)buttonAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[NextController new] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
