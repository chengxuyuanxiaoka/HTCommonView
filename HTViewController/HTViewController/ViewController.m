//
//  ViewController.m
//  HTViewController
//
//  Created by 一米阳光 on 17/3/3.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/**
 * loadView和viewDidLoad这两个方法都是在视图首次加载的时候调用
 * 区别:
   ①loadView方法，是在视图控制器加载视图，并将视图显示给用户的时候调用，当视图控制器上的视图因为某些原因没有加载出来，编译器会自动调用该方法 实例化
   ②ViewDidLoad方法，是在视图加载之后，在视图上添加各类控件
 */
- (void)loadView {
    [super loadView];
    NSLog(@"loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
}

//视图将要显示的时候调用该方法,一般的时候我们会在该方法中对当前视图控制器上的视图内容进行重构(控件的显示位置 控件上显示的内容)
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

//视图已经出现的时候调用该方法
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

//视图将要消失的时候会调用该方法,当视图消失之前,可以对视图上的数据信息进行持久化存储 也可以对视图上数据占用的内存空间进行清空操作
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    
}

//视图已经消失
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
