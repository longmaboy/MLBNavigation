# MLBNavigation

[![Version](https://img.shields.io/cocoapods/v/MLBNavigation.svg?style=flat)](https://cocoapods.org/pods/MLBNavigation)
[![License](https://img.shields.io/cocoapods/l/MLBNavigation.svg?style=flat)](https://cocoapods.org/pods/MLBNavigation)
[![Platform](https://img.shields.io/cocoapods/p/MLBNavigation.svg?style=flat)](https://cocoapods.org/pods/MLBNavigation)  

为什么要做这个？  
平时使用原生导航栏，处理返回手势的时候，自己做不到像QQ那样处理的很完美，虽然有很多大大写的有不错的框架，个人感觉有些框架太繁重，并且还是不能满足一些要求，所以做这个，很简单，需要的参考，大神绕道。

## 示例

![Image text](https://github.com/longmaboy/MLBNavigation/blob/master/Example/111.gif)

## 安装

下载demo，将MLBNavigation拖入项目中即可，或者cocopods安装。  
pod search MLBNavigation 搜索不到，请先更新pod setup

```ruby
pod 'MLBNavigation'
```

## 使用方法

支持StoryBoard和纯代码使用  
创建UIViewController的时候，直接继承MLBBaseController.h即可，详情可看demo  
最好是自己创建一个BaseController继承我的的MLBBaseController，然后BaseController还可以做你想做的事情  
若是你的导航栏很复杂，那直接隐藏导航栏，自己做一个导航栏就好。

需要做一些基础配置，不配置就使用我默认的  
在AppDelegate.h中导入#import "MLBNavigation.h"设置初始化配置

```ruby

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    MLBConfig *config = [[MLBConfig alloc] init];

    config.leftItemImg = @"MBack";
    config.titleFontSize = [UIFont systemFontOfSize:18];
    config.itemLeftSpace = 10;
    config.itemRightSpace = 20;

    [MLBConfigSingle single].config = config;

    return YES;
}

MLBConfig.h预览

@interface MLBConfig : NSObject

//左边返回item字体大小
@property (nonatomic, strong) UIFont *leftFontSize;

//控制器标题字体大小
@property (nonatomic, strong) UIFont *titleFontSize;

//右边item字体大小
@property (nonatomic, strong) UIFont *rightFontSize;

@property (nonatomic,   copy) NSString *leftItemImg;

@property (nonatomic, assign) CGFloat itemLeftSpace;

//最右边item右边距离
@property (nonatomic, assign) CGFloat itemRightSpace;

@property (nonatomic, strong) UIColor *naviBgColor;

@property (nonatomic,   copy) NSString *naviBgImg;

@property (nonatomic, assign) BOOL lineHidden;

@end
```

## 注意事项
因为原生导航栏被隐藏了，所以原生导航栏上的功能不能再使用，需要自己去实现  
1、prefersLargeTitles大标题功能没法使用  
2、UISearchController没法在导航栏上使用
 
## Author

使用过程中有任何问题，请issue我或者给我发邮件  
751824643@qq.com

## License

MLBNavigation is available under the MIT license. See the LICENSE file for more info.
