//
//  NextController.m
//  TestNavi
//
//  Created by Mac on 2019/1/15.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "NextController.h"
#import "YellowViewController.h"

@interface NextController ()

@end

@implementation NextController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLeftItemText:@"返回" withTextColor:UIColor.blackColor withWidth:60];
    
    self.naviBgColor = UIColor.cyanColor;
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 35)];
    imgView.image = [UIImage imageNamed:@"smallimg"];
    [self setTitleView:imgView];
    
    self.titleString = @"next";
    
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
    [self.navigationController pushViewController:[YellowViewController new] animated:YES];
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
