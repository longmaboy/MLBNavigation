//
//  YellowViewController.m
//  TestNavi
//
//  Created by Mac on 2019/1/15.
//  Copyright © 2019年 MLBiMAC. All rights reserved.
//

#import "YellowViewController.h"

@interface YellowViewController ()

@end

@implementation YellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.yellowColor;
    
    self.hiddenNavigation = YES;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 40)];
    label.text = @"导航栏隐藏，滑动返回";
    label.textAlignment = 1;
    label.center = self.view.center;
    [self.view addSubview:label];
    
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
