//
//  ViewController.m
//  HTTextField
//
//  Created by 一米阳光 on 17/3/3.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
    
}

//创建文本输入框
- (void)setupSubviews {
    //创建文本输入框的对象,并设置显示位置
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 60, 300, 40)];
    //设置背景颜色
    textField.backgroundColor = [UIColor cyanColor];
    //设置提示语句(水印效果)
    textField.placeholder = @"请输入hello world!";
    //设置文本输入框的边框样式
    textField.borderStyle = UITextBorderStyleRoundedRect;
    //设置键盘样式
    textField.keyboardType = UIKeyboardTypeDefault;
    //设置字体样式
    textField.font = [UIFont boldSystemFontOfSize:17];
    //*****私密模式 加密效果
    textField.secureTextEntry = NO;
    //添加清除按钮
    textField.clearButtonMode = UITextFieldViewModeAlways;
    //添加标记
    textField.tag = 101;
    //设置键盘上return按钮的样式
    textField.returnKeyType = UIReturnKeyDone;
    //遵从协议 设置代理
    textField.delegate = self;
    //设置第一响应者 只要视图显示出来 同时键盘也显示出来
    [textField becomeFirstResponder];
    [self.view addSubview:textField];
}

//触摸方法取消第一响应者
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITextField * textField = (UITextField *)[self.view viewWithTag:101];
    [textField resignFirstResponder];
}


#pragma mark - UITextFieldDelegate
//点击return按钮
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
