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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 自定义CALayer
    
    [self selfCreatLayer];
    
}

- (void)selfCreatLayer
{
    UIView *view1 = [UIView new];
    view1.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view1];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(30, 30, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.contents = (id)[UIImage imageNamed:@"bgimg"].CGImage;
    layer.cornerRadius = 3;
    [view1.layer addSublayer:layer];
    
    // 注:  CALayer定义在QuartzCore框架中的. CGImageRef、CGColorRef两种数据类型定义在CoreGraphics框架中, .UIColor、UIImage定义在UIKit框架中.QuartzCore框架和CoreGraphics框架是可以跨平台使用的，在iOS和Mac OSX上都能使用.但是UIKit框架只能在iOS中使用.所以为了保证可移植性，QuartzCore不能使用UIImage、UIColor，只能使用CGImageRef、CGColorRef.
    
}

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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
