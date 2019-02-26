//
//  MLBBaseController.h
//  MLBNavigation
//
//  Created by Mac on 2019/2/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLBBaseController : UIViewController

/*-------------导航栏-------------*/

//导航栏view，布局的时候要从它开始，注意它不要被覆盖了
@property (nonatomic, strong) UIView *naviView;

//隐藏导航栏
@property (nonatomic, assign) BOOL hiddenNavigation;

//导航栏背景色
@property (nonatomic, strong) UIColor *naviBgColor;

//导航栏的alpha设置
@property (nonatomic, assign) CGFloat naviAlpha;

//隐藏导航栏底部线条
@property (nonatomic, assign) BOOL hiddenNavigationLine;

//设置导航栏图片
@property (nonatomic,   copy) NSString *naviImg;






/*-------------中间-------------*/
//控制器标题设置
@property (nonatomic,   copy) NSString *titleString;

//控制器标题字体大小
@property (nonatomic, strong) UIFont *titleFontSize;

//控制器标题字体颜色
@property (nonatomic, strong) UIColor *titleColor;

//设置titleView，view需要宽度和高度，高度不要超过44
@property (nonatomic, strong) UIView *titleView;





/*-------------左边-------------*/
//item左边距离
@property (nonatomic, assign) CGFloat itemLeftSpace;

//左边item字体大小
@property (nonatomic, strong) UIFont *leftFontSize;

//设置返回按钮文字，需要根据字数设置宽度
- (void)setLeftItemText:(NSString *)leftItemText withTextColor:(UIColor *)color withWidth:(CGFloat)buttonWidth;

//首页设置左边边按钮的时候需要在重写此方法获取点击事件
//其他页面实现此方法需要自己写pop
- (void)leftButtonAction:(UIButton *)sender;







/*-------------右边-------------*/

//最右边item右边距离
@property (nonatomic, assign) CGFloat itemRightSpace;

//右边item字体大小
@property (nonatomic, strong) UIFont *rightFontSize;

@property (nonatomic, strong) UIView *rightView;


//设置右边按钮文字，需要根据字数设置宽度
- (void)setRightItemText:(NSString *)rightItemText withTextColor:(UIColor *)color  withWidth:(CGFloat)buttonWidth;

//设置右边按钮图片，需要根据图片大小设置宽度
- (void)setRightItemImg:(UIImage *)rightImg withWidth:(CGFloat)buttonWidth;

//设置右边按钮的时候需要在重写此方法获取点击事件
- (void)rightButtonAction:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
