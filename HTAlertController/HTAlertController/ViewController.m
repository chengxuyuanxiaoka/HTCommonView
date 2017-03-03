//
//  ViewController.m
//  HTAlertController
//
//  Created by 一米阳光 on 17/3/3.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLabel];

    [self createNormalActionController];
    
    [self createActionSheetController];
    
    [self createActionInputTextController];
    
}

- (void)createNormalActionController {
    UIButton *butotn = [UIButton buttonWithType:UIButtonTypeCustom];
    butotn.frame = CGRectMake(10, 100, CGRectGetWidth(self.view.bounds)-20, 50);
    [butotn setTitle:@"普通弹框" forState:UIControlStateNormal];
    [butotn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [butotn addTarget:self action:@selector(setupNormalAlertController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butotn];
}

- (void)createActionSheetController {
    UIButton *butotn = [UIButton buttonWithType:UIButtonTypeCustom];
    butotn.frame = CGRectMake(10, 200, CGRectGetWidth(self.view.bounds)-20, 50);
    [butotn setTitle:@"上拉弹框" forState:UIControlStateNormal];
    [butotn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [butotn addTarget:self action:@selector(setupSheetAlertController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butotn];
}

- (void)createActionInputTextController {
    UIButton *butotn = [UIButton buttonWithType:UIButtonTypeCustom];
    butotn.frame = CGRectMake(10, 300, CGRectGetWidth(self.view.bounds)-20, 50);
    [butotn setTitle:@"文本弹框" forState:UIControlStateNormal];
    [butotn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [butotn addTarget:self action:@selector(setupInputTextAlertController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butotn];
}

- (void)setupLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, CGRectGetWidth(self.view.bounds)-20, 50)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor redColor];
    [self.view addSubview:self.label];
}

- (void)setupNormalAlertController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"商品名称" message:@"马尔代夫七日游" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"取消购买商品";
    }];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"确认购买商品";
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)setupSheetAlertController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"购买水果" message:@"火龙果" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"取消";
    }];
    UIAlertAction *thinkAction = [UIAlertAction actionWithTitle:@"考虑" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"考虑";
    }];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.label.text = @"确认";
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:thinkAction];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)setupInputTextAlertController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请输入登陆密码" message:@"HT" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入密码";
    }];
    
    // 添加 action，再其回调中可以处理输入内容
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 获取上面的输入框
        UITextField *textField = [alertController.textFields firstObject];
        self.label.text = textField.text;
    }];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
