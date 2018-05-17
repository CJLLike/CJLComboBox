//
//  CJTextComboBox.m
//  Viewtest
//
//  Created by CJL on 2018/5/15.
//  Copyright © 2018年 cj. All rights reserved.
//

#import "CJTextComboBox.h"
#import "Masonry.h"

@interface CJTextComboBox ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray                *chooseArr;

@end

@implementation CJTextComboBox
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.exampleInfo  = [[NSArray alloc] init];
        self.chooseArr = [[NSMutableArray alloc] init];
        [self addTextFieldByWidth:frame.size.width andHeight:frame.size.height];
        [self addComboBoxByWidth:frame.size.width andHeight:frame.size.height];
        [self.ComboBoxTableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"infoTableViewCell"];
    }
    return self;
}

- (void)addTextFieldByWidth:(CGFloat)width andHeight:(CGFloat)height
{
    self.textField = [[UITextField alloc] init];
    self.textField.delegate = self;
    self.textField.frame = CGRectMake(0, 0, width, height);
    [self addSubview:self.textField];
}
- (void)addComboBoxByWidth:(CGFloat)width andHeight:(CGFloat)height
{
    UIButton *infoButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [infoButton addTarget:self action:@selector(touchInfoButton) forControlEvents:(UIControlEventTouchUpInside)];
    [infoButton setBackgroundImage:[UIImage imageNamed:@"info.png"] forState:(UIControlStateNormal)];
    self.textField.rightView = infoButton;
    [infoButton setFrame:CGRectMake(0, 0, height- 5.0 , height- 5.0)];

    self.ComboBoxTableview = [[UITableView alloc] init];
    self.ComboBoxTableview.layer.borderWidth = 1.0;
    self.ComboBoxTableview.layer.borderColor = [[UIColor blackColor] CGColor];
    self.ComboBoxTableview.frame = CGRectMake(0, height, width, COMBOBOX_HEIGHT);
    self.ComboBoxTableview.delegate = self;
    self.ComboBoxTableview.dataSource = self;
    [self.textField addSubview:self.ComboBoxTableview];
    [self.textField  bringSubviewToFront:self.ComboBoxTableview];
}
- (void)addArrayInfo:(NSArray *)infoArray
{
    self.exampleInfo = infoArray;
    [self.ComboBoxTableview reloadData];
}
- (void)touchInfoButton
{
    CGRect oldrect = self.ComboBoxTableview.frame;
    CGFloat exampleHeight = 0.0;
    if (oldrect.size.height == COMBOBOX_HEIGHT) {
        exampleHeight = 0.0;
    }
    else
    {
        exampleHeight = COMBOBOX_HEIGHT;
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.ComboBoxTableview.frame = CGRectMake(oldrect.origin.x, oldrect.origin.y, oldrect.size.width, exampleHeight);
    } completion:^(BOOL finished) {
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.chooseArr.count + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"infoTableViewCell"];
    if (indexPath.row ==self. chooseArr.count)
    {
        cell.textLabel.text = @"清除历史记录";
    }
    else
    {
        cell.contentView.layer.borderWidth = 1.0;
        cell.contentView.layer.borderColor = [[UIColor blackColor] CGColor];
        NSString *tableViewCellInfo = (NSString *)self.chooseArr[indexPath.row];
        cell.textLabel.text = tableViewCellInfo;
    }
    return cell;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
{
    NSMutableString *changstring1 = [NSMutableString stringWithString: textField.text];
    [changstring1  replaceCharactersInRange:range withString:string];
    NSMutableArray *qqqq = [NSMutableArray array];
    for (NSString *exstring in self.exampleInfo) {
        BOOL isok = YES;
        if(exstring.length < changstring1.length)
        {
            isok = NO;
        }
        NSString *ssss = [exstring substringToIndex:changstring1.length];
        if(! [ssss isEqualToString:changstring1] ){
            isok = NO;
        }
        if (isok == YES) {
            [qqqq  addObject:exstring];
        }
    }
    self.chooseArr = qqqq;
    [self.ComboBoxTableview reloadData];
    
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect oldrect = self.ComboBoxTableview.frame;
    CGFloat exampleHeight = 0.0;
    [UIView animateWithDuration:0.2 animations:^{
        self.ComboBoxTableview.frame = CGRectMake(oldrect.origin.x, oldrect.origin.y, oldrect.size.width, exampleHeight);
    } completion:^(BOOL finished) {
    }];
}
@end
