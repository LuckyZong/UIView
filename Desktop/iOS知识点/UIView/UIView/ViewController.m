//
//  ViewController.m
//  UIView
//
//  Created by lucky zong on 2018/3/14.
//  Copyright © 2018年 lingqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//   CALayer & UIView 区别
//1. UIView是UIKit的(只能iOS使用)，CALayer是QuartzCore的(iOS和mac os通用)
//2. UIView继承UIResponder,CALayer继承NSObject,UIView比CALayer多了一个事件处理的功能，也就是说，CALayer不能处理用户的触摸事件，而UIView可以
//3. UIView来自CALayer，是CALayer的高层实现和封装，UIView的所有特性来源于CALayer支持
//4. CABasicAnimation，CAAnimation，CAKeyframeAnimation等动画类都需要加到CALayer上

//   需要明确的概念
//1. CALayer是定义在QuartzCore框架中的(Core Animation)
//2. CGImageRef、CGColorRef两种数据类型是定义在CoreGraphics框架中的
//3. UIColor、UIImage是定义在UIKit框架中的
//4. QuartzCore框架和CoreGraphics框架是可以跨平台使用的，在iOS和Mac OS X上都能使用, 但是UIKit只能在iOS中使用, 所以为了保证可移植性，QuartzCore不能使用UIImage、UIColor，只能使用CGImageRef、CGColorRef

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    // 自定义CALayer
    
    //[self selfCreatLayer];
    
    // 圆
   // [self creatcircle];
    
    // 上圆角矩形
    //[self creatTopLiftRight];
    
    // 奇特图形
    [self createOtherGraph];
    
}

- (void)selfCreatLayer
{
    UIView *view1 = [UIView new];
    view1.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view1];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(30, 30, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = 3;
    layer.borderWidth = 5;
    [view1.layer addSublayer:layer];
    
    // 注:  CALayer定义在QuartzCore框架中的. CGImageRef、CGColorRef两种数据类型定义在CoreGraphics框架中, .UIColor、UIImage定义在UIKit框架中.QuartzCore框架和CoreGraphics框架是可以跨平台使用的，在iOS和Mac OSX上都能使用.但是UIKit框架只能在iOS中使用.所以为了保证可移植性，QuartzCore不能使用UIImage、UIColor，只能使用CGImageRef、CGColorRef.
    
}

- (void)creatcircle
{
    // 2. 圆形切图
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(140, 50, 100, 100)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor greenColor];
    
    // 2.1 圆角
    view.layer.cornerRadius = 50;
    
    // 2.2 边框
    view.layer.borderWidth = 5;
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    
    // 2.3 内容 寄宿图
    view.layer.contents = (id)[UIImage imageNamed:@"112"].CGImage;
    
    // 2.5 超过子图层的部分裁减掉
    view.layer.masksToBounds = YES;  // 如果设置了该属性, 阴影将消失
    
    // 2.4 设置阴影图片
    view.layer.shadowColor = [UIColor greenColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(10, 10);
    view.layer.shadowOpacity = 0.6;
    
}

- (void)creatTopLiftRight
{

    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(260, 50, 100, 100)];
    [self.view addSubview:view3];
    view3.backgroundColor = [UIColor cyanColor];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view3.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(15, 0)];
    
    CAShapeLayer*maskLayer = [[CAShapeLayer  alloc]  init];
    maskLayer.frame = view3.bounds;
    maskLayer.path = maskPath.CGPath;
    view3.layer.mask = maskLayer;

}

- (void)createOtherGraph
{
    // 4. 奇特图形
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(20, 170, 100, 100)];
    [self.view addSubview:view4];
    view4.backgroundColor = [UIColor greenColor];
    
    // Color Declarations
    UIColor* color5 = [UIColor colorWithRed: 1 green: 0.879 blue: 0 alpha: 1];
    
    // Oval Drawing
    CGRect ovalRect = CGRectMake(0, 0, 100, 100);
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    [ovalPath addArcWithCenter: CGPointMake(0, 0) radius: ovalRect.size.width / 2 startAngle: 180 * M_PI/180 endAngle: 129 * M_PI/180 clockwise: YES];
    [ovalPath addLineToPoint: CGPointMake(0, 0)];
    [ovalPath closePath];
    
    CGAffineTransform ovalTransform = CGAffineTransformMakeTranslation(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect));
    ovalTransform = CGAffineTransformScale(ovalTransform, 1, ovalRect.size.height / ovalRect.size.width);
    [ovalPath applyTransform: ovalTransform];
    
    [color5 setFill];
    [ovalPath fill];
    
    CAShapeLayer *layer3 = [[CAShapeLayer alloc] init];
    layer3.frame = view4.bounds;
    layer3.path = ovalPath.CGPath;
    view4.layer.mask = layer3;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
