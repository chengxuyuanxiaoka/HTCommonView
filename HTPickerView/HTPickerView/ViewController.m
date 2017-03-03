//
//  ViewController.m
//  HTPickerView
//
//  Created by 一米阳光 on 17/3/3.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<
UIPickerViewDataSource,
UIPickerViewDelegate>

@end

@implementation ViewController {
    NSMutableArray * _arrayData1;
    NSMutableArray * _arrayData2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self setupPicker];
    [self setupButton];
    
}

- (void)setupData {
    //必须使用一个数组存放控件上显示的内容
    _arrayData1 = [[NSMutableArray alloc] initWithObjects:@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月", nil];
    _arrayData2 = [[NSMutableArray alloc] initWithObjects:@"2017年",@"2018年",@"2019年",@"2020年",@"2021年",@"2022年",@"2023年",@"2024年",@"2025年",@"2026年",@"2027年",@"2028年", nil];
}

//创建选择器控件
- (void)setupPicker {
    UIPickerView * pkView = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 200, 300, 330)];
    pkView.backgroundColor = [UIColor greenColor];
    //设置代理
    pkView.delegate = self;
    pkView.dataSource = self;
    pkView.tag = 101;
    [self.view addSubview:pkView];
}

- (void)setupButton {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button setTitle:@"结果" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick:(UIButton *)button {
    UIPickerView * pkView = (UIPickerView *)[self.view viewWithTag:101];
    //获取选中的列中行号
    NSInteger num = [pkView selectedRowInComponent:1];
    //获取行号对应的元素的内容
    NSString * info = [NSString stringWithFormat:@"您选中的内容是：%@ %@",[_arrayData2 objectAtIndex:num],[_arrayData1 objectAtIndex:num]];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:info preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"警告" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UIPickerViewDataSource
//调用协议中的方法,设置选择器控件显示列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

//设置选择器每列显示的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [_arrayData1 count];
    }else {
        return [_arrayData2 count];
    }
}

//设置每一行显示的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [_arrayData1 objectAtIndex:row];
    }else {
        return _arrayData2[row];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
