//
//  ViewController.m
//  HTProgressView
//
//  Created by 一米阳光 on 17/3/3.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupStepper];
    [self setupProgressView];
    
}

//创建计步器
- (void)setupStepper {
    //创建对象
    UIStepper * stepper = [[UIStepper alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    //设置边框颜色   默认为蓝色
    stepper.tintColor = [UIColor redColor];
    //设置计步器的最小值
    stepper.minimumValue = 0;
    //设置计步器的最大值
    stepper.maximumValue = 99;
    //设置计步器的步长(点击+ -时候value的变化)
    stepper.stepValue = 10;
    //开启关闭长按功能
    stepper.autorepeat = NO;
    //给计步器添加点击方法
    [stepper addTarget:self action:@selector(stepperClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
}

//创建进度条
- (void)setupProgressView {
    //创建对象
    UIProgressView * progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    //设置进度条当前显示位置,progress的值 取值范围是(0-1),如果大于1 那么进度一直处于充满状态
    progressView.progress = 0;
    [progressView setProgressTintColor:[UIColor redColor]];
    [progressView setTrackTintColor:[UIColor yellowColor]];
    progressView.frame = CGRectMake(10, 300, 300, 10);
    progressView.tag = 101;
    [self.view addSubview:progressView];
}

- (void)stepperClick:(id)sender {
    //id表示所有类型的对象指针 所以所有控件都可以使用这种机制来传递参数
    UIStepper * stepper = (UIStepper *)sender;
    UIProgressView * progressView = (UIProgressView *)[self.view viewWithTag:101];
    //点击stepper修改progressView控件的progress值
    progressView.progress = stepper.value/stepper.maximumValue;
    NSLog(@"%f",stepper.value);
    if (progressView.progress >= 1) {
        NSLog(@"加载完成");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
