//
//  ViewController.m
//  HTWebView
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
    
    [self setupWebView];
    
}

//创建网页控件
- (void)setupWebView {
    //创建对象
    UIWebView * webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //添加显示数据的网址
    NSString * path = @"http://www.baidu.com";
    //将字符串网址转化成NSURL
    NSURL * url = [NSURL URLWithString:path];
    //将URL封装成NSURLRequest对象
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    //将请求对象添加在webView视图上
    [webView loadRequest:request];
    //将webView添加到当前视图上
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
