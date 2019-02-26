//
//  MLBBaseController.m
//  MLBNavigation
//
//  Created by Mac on 2019/2/26.
//

#import "MLBBaseController.h"
#import "MLBConfigSingle.h"
#import "MLBConfig.h"
#import "UIView+MLBLayout.h"

/** 屏幕宽高 */
#define kScreenW_m    [UIScreen mainScreen].bounds.size.width
#define kScreenH_m    [UIScreen mainScreen].bounds.size.height

/** 导航栏高度和导航栏、tab变化值 */
#define kTabbarIncrease_m  (kScreenH >= 812 ? 34 : 0)
#define kNaviIncrease_m    (kScreenH >= 812 ? 24 : 0)
#define kStatusHeight_m    [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNaviHeight_m      (kStatusHeight+44)
#define kTabbarHeight_m    (kTabbarIncrease+49)

@interface MLBBaseController ()

@property (nonatomic, strong) MLBConfig *config;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIButton *leftButton;

@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UILabel *mtitleLabel;

@property (nonatomic, strong) UIImageView *naviImgView;

@end

@implementation MLBBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    //存在导航栏才添加
    if (self.navigationController) {
        
        [self.navigationController.navigationBar setHidden:YES];
        
        self.config = [MLBConfigSingle single].config;
        
        self.titleString = self.navigationItem.title;
        
        if (@available(iOS 11.0, *)) {
            
            self.additionalSafeAreaInsets = UIEdgeInsetsMake(44, 0, 0, 0);
            
        }
        
        [self.view addSubview:self.naviView];
        
    }
    
}

#pragma mark - creatUI lazy
//导航栏
- (UIView *)naviView
{
    if (!_naviView) {
        _naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW_m, kStatusHeight_m+44)];
        _naviView.backgroundColor = self.config.naviBgColor ? self.config.naviBgColor : UIColor.whiteColor;
        
        [_naviView addSubview:self.naviImgView];
        [_naviView addSubview:self.lineView];
        
        //除了首页的控制器才有返回按钮
        if (self.navigationController.childViewControllers.count > 1) {
            
            [_naviView addSubview:self.leftButton];
            
        }
    }
    return _naviView;
}

//导航栏上的Img
- (UIImageView *)naviImgView
{
    if (!_naviImgView) {
        _naviImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenW_m, kStatusHeight_m+44)];
        //设置默认图片
        _naviImgView.image = self.config.naviBgImg? [UIImage imageNamed:self.config.naviBgImg] : nil;
        _naviImgView.hidden = self.config.naviBgImg? NO : YES;
    }
    return _naviImgView;
}

//导航栏的横线
- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _naviView.m_height-0.5, kScreenW_m, 0.5)];
        _lineView.backgroundColor = UIColor.grayColor;
        _lineView.alpha = 0.5;
        _lineView.hidden = self.config.lineHidden;
    }
    return _lineView;
}

//导航栏上的返回按钮
- (UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(self.config.itemLeftSpace? self.config.itemLeftSpace:4, kStatusHeight_m+2, 40, 40)];
        [_leftButton setImage:[UIImage imageNamed:self.config.leftItemImg ? self.config.leftItemImg : @"MBack"] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.titleLabel.font = self.config.leftFontSize? self.config.leftFontSize : [UIFont systemFontOfSize:17];
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, kStatusHeight_m+2, 50, 40)];
        _rightButton.m_right = kScreenW_m - (self.config.itemRightSpace? self.config.itemRightSpace:4);
        [_rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.titleLabel.font = self.config.rightFontSize? self.config.rightFontSize : [UIFont systemFontOfSize:17];
        [self.naviView addSubview:_rightButton];
    }
    return _rightButton;
}

//导航栏上控制器的标题
- (UILabel *)mtitleLabel
{
    if (!_mtitleLabel) {
        _mtitleLabel = [[UILabel alloc] init];
        _mtitleLabel.textAlignment = NSTextAlignmentCenter;
        _mtitleLabel.font = self.config.titleFontSize? self.config.titleFontSize : [UIFont systemFontOfSize:17];
    }
    return _mtitleLabel;
}

- (void)setRightView:(UIView *)rightView
{
    
    if (_rightView) {
        return;
    }
    
    _rightView = rightView;
    
    if (_rightButton) {
        
        [_rightButton removeFromSuperview];
        
    }
    
    _rightView.m_centerY = self.mtitleLabel.m_centerY;
    
    _rightView.m_right = kScreenW_m - (self.config.itemRightSpace? self.config.itemRightSpace:4);
    
    [self.naviView addSubview:_rightView];
    
}

#pragma mark - layout

#pragma mark - delegateMethod

#pragma mark - setter
//设置导航栏的透明度
- (void)setNaviAlpha:(CGFloat)naviAlpha
{
    if (!self.navigationController) {
        return;//不存在导航栏，设置也没用
    }
    
    if (naviAlpha < 0 || naviAlpha > 1) {
        return;
    }
    
    _naviAlpha = naviAlpha;
    
    if (naviAlpha == 0) {
        
        self.naviView.hidden = YES;
        
    }else{
        
        self.naviView.hidden = NO;
        
    }
    
    self.naviView.alpha = naviAlpha;
    
}
//导航栏隐藏
- (void)setHiddenNavigation:(BOOL)hiddenNavigation
{
    if (!self.navigationController) {
        return;//不存在导航栏，设置也没用
    }
    
    _hiddenNavigation = hiddenNavigation;
    
    self.naviView.hidden = hiddenNavigation;
}

//导航栏背景色
- (void)setNaviBgColor:(UIColor *)naviBgColor
{
    if (!self.navigationController) {
        return;
    }
    
    _naviBgColor = naviBgColor;
    
    self.naviView.backgroundColor = naviBgColor;
}

//导航栏底部线条隐藏
- (void)setHiddenNavigationLine:(BOOL)hiddenNavigationLine
{
    if (!self.navigationController) {
        return;
    }
    
    _hiddenNavigationLine = hiddenNavigationLine;
    
    self.lineView.hidden = hiddenNavigationLine;
}
//导航栏背景图片
- (void)setNaviImg:(NSString *)naviImg
{
    if (!self.navigationController) {
        return;
    }
    
    _naviImg = naviImg;
    
    if (naviImg.length > 0) {
        
        self.naviImgView.hidden = NO;
        self.naviImgView.image = [UIImage imageNamed:naviImg];
        
    }else{
        
        self.naviImgView.hidden = YES;
        
    }
    
}

//设置titleView
- (void)setTitleView:(UIView *)titleView
{
    if (!self.navigationController) {
        return;
    }
    
    [self.naviView addSubview:titleView];
    titleView.m_centerY = self.leftButton.m_centerY;
    titleView.m_centerX = self.naviView.m_centerX;
}
//设置控制器title
- (void)setTitleString:(NSString *)titleString
{
    if (!self.navigationController) {
        return;
    }
    
    if (titleString.length < 1) {
        return;
    }
    
    _titleString = titleString;
    
    self.mtitleLabel.text = titleString;
    
    CGSize maximumLabelSize = CGSizeMake(100, 9999);
    
    CGSize expectSize = [self.mtitleLabel sizeThatFits:maximumLabelSize];
    
    if (_leftButton) {
        
        if (expectSize.width > kScreenW_m-4-_leftButton.m_right) {
            
            self.mtitleLabel.frame = CGRectMake(0, 0, kScreenW_m-4-_leftButton.m_right, 30);
            
        }else{
            
            self.mtitleLabel.frame = CGRectMake(0, 0, expectSize.width, 30);
            
        }
        
    }else{
        
        self.mtitleLabel.frame = CGRectMake(0, 0, kScreenW_m-8, 30);
        
    }
    
    self.mtitleLabel.m_centerX = self.naviView.m_centerX;
    
    if (_leftButton) {
        
        if (self.mtitleLabel.m_x < _leftButton.m_right) {
            
            self.mtitleLabel.m_x = _leftButton.m_right;
            
        }
        
    }
    
    self.mtitleLabel.m_centerY = self.leftButton.m_centerY;
    
    [self.naviView addSubview:self.mtitleLabel];
    
}

//控制器标题字体大小
- (void)setTitleFontSize:(UIFont *)titleFontSize
{
    if (!self.navigationController) {
        return;
    }
    
    if (titleFontSize) {
        
        _titleFontSize = titleFontSize;
        
        self.mtitleLabel.font = titleFontSize;
        
    }
}

- (void)setTitleColor:(UIColor *)titleColor
{
    if (!self.navigationController) {
        return;
    }
    
    if (titleColor) {
        
        _titleColor = titleColor;
        
        self.mtitleLabel.textColor = titleColor;
        
    }
}

//设置返回按钮文字，需要根据字数设置宽度
- (void)setLeftItemText:(NSString *)leftItemText withTextColor:(UIColor *)color withWidth:(CGFloat)buttonWidth
{
    if (!self.navigationController) {
        return;
    }
    
    if (self.navigationController.childViewControllers.count <= 1) {
        
        [self.leftButton setImage:nil forState:UIControlStateNormal];
        [self.leftButton setTitle:nil forState:UIControlStateNormal];
        
        [_naviView addSubview:self.leftButton];
    }
    
    
    
    if (leftItemText.length > 0) {
        
        [self.leftButton setTitle:leftItemText forState:UIControlStateNormal];
        
    }
    
    if (color) {
        
        [self.leftButton setTitleColor:color forState:UIControlStateNormal];
        
    }
    
    if (buttonWidth > 0) {
        
        self.leftButton.m_width = buttonWidth;
        
    }
    
    
}

//设置右边按钮文字，需要根据字数设置宽度
- (void)setRightItemText:(NSString *)rightItemText withTextColor:(UIColor *)color  withWidth:(CGFloat)buttonWidth
{
    if (!self.navigationController) {
        return;
    }
    
    [self.rightButton setImage:nil forState:UIControlStateNormal];
    
    if (rightItemText.length > 0) {
        
        [self.rightButton setTitle:rightItemText forState:UIControlStateNormal];
        
    }
    
    if (color) {
        
        [self.rightButton setTitleColor:color forState:UIControlStateNormal];
        
    }
    
    if (buttonWidth > 0) {
        
        self.rightButton.m_width = buttonWidth;
        
    }
}

//设置右边按钮图片，需要根据字数设置宽度
- (void)setRightItemImg:(UIImage *)rightImg withWidth:(CGFloat)buttonWidth
{
    if (!self.navigationController) {
        return;
    }
    
    [self.rightButton setTitle:@"" forState:UIControlStateNormal];
    
    if (rightImg) {
        
        [self.rightButton setImage:rightImg forState:UIControlStateNormal];
        
    }
    
    if (buttonWidth > 0) {
        
        self.rightButton.m_width = buttonWidth;
        
    }
}

//item左边距离
- (void)setItemLeftSpace:(CGFloat)itemLeftSpace
{
    if (!self.navigationController) {
        return;
    }
    
    if (itemLeftSpace > 0) {
        
        _itemLeftSpace = itemLeftSpace;
        
        self.leftButton.m_left = itemLeftSpace;
    }
}

//左边item字体大小
- (void)setLeftFontSize:(UIFont *)leftFontSize
{
    if (!self.navigationController) {
        return;
    }
    
    if (leftFontSize) {
        
        _leftFontSize = leftFontSize;
        
        self.leftButton.titleLabel.font = leftFontSize;
    }
}

//右边item字体大小
- (void)setRightFontSize:(UIFont *)rightFontSize
{
    if (!self.navigationController) {
        return;
    }
    
    if (rightFontSize && _rightButton) {
        
        _rightFontSize = rightFontSize;
        
        _rightButton.titleLabel.font = rightFontSize;
    }
}

//最右边item右边距离
- (void)setItemRightSpace:(CGFloat)itemRightSpace
{
    if (!self.navigationController) {
        return;
    }
    
    if (itemRightSpace > 0) {
        
        _itemRightSpace = itemRightSpace;
        
    }
    
}

#pragma mark - buttonAction
//pop
- (void)leftButtonAction:(UIButton *)sender
{
    if (self.navigationController.childViewControllers.count > 1) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}
//right
- (void)rightButtonAction:(UIButton *)sender
{
    
}


#pragma mark - data

@end
