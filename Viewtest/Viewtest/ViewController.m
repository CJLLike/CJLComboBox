//
//  ViewController.m
//  Viewtest
//
//  Created by CJL on 2018/5/14.
//  Copyright © 2018年 cj. All rights reserved.
//

#import "ViewController.h"
#import "CJTextComboBox.h"

@interface ViewController ()
@property(nonatomic,strong) NSArray                *exampleInfo;
@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    self.exampleInfo = @[@"2123412341",@"134123412",@"3153566786",@"454576732545",@"2222222222"] ;
    CJTextComboBox *texts = [[CJTextComboBox alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    [self.view addSubview:texts];
    texts.textField.text = @"hello";
    texts.exampleInfo = _exampleInfo;
    [texts addArrayInfo:_exampleInfo];
    [super viewDidLoad];
}
@end
