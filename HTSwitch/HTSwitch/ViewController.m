//
//  ViewController.m
//  UISwitch
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
    self.view.backgroundColor = [UIColor purpleColor];
    [self setupSwitch];
    [self setupIndicator];
}

//创建开关按钮
- (void)setupSwitch {
    //创建对象,开关的位置可以变化，但是大小不会变化
    UISwitch * switchView = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, CGRectGetWidth(self.view.bounds)-200, 100)];
    switchView.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2, 100);
    //设置开关状态为关闭状态
    switchView.on = NO;
    //设置开启状态，按钮的背景颜色
    switchView.onTintColor = [UIColor greenColor];
    //设置关闭状态 ，按钮的背景颜色
    switchView.tintColor = [UIColor redColor];
    //设置按钮的颜色
    switchView.thumbTintColor = [UIColor yellowColor];
    [switchView addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchView];
}

//创建活动指示器
- (void)setupIndicator {
    UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activity.frame = CGRectMake(100, 200, CGRectGetWidth(self.view.bounds)-200, 100);
    //设置活动指示器默认状态为隐藏状态
    [activity setHidden:YES];
    //设置动画停止，活动指示器隐藏
    [activity setHidesWhenStopped:YES];
    activity.tag = 1001;
    [self.view addSubview:activity];
}

- (void)switchClick:(UISwitch *)switchView {
    UIActivityIndicatorView * activity = (UIActivityIndicatorView *)[self.view viewWithTag:1001];
    if (switchView.isOn) {
        [activity setHidden:NO];
        [activity startAnimating];
    }else {
        [activity stopAnimating];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
