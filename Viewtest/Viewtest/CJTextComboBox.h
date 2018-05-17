//
//  CJTextComboBox.h
//  Viewtest
//
//  Created by CJL on 2018/5/15.
//  Copyright © 2018年 cj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define COMBOBOX_HEIGHT  150

@interface CJTextComboBox :UIView
//ComboBox
@property(nonatomic,strong) UITableView                *ComboBoxTableview;

@property(nonatomic,strong) UITextField                 *textField;

@property(nonatomic,strong) NSArray                      *exampleInfo;

-(instancetype)initWithFrame:(CGRect)frame;

- (void)addArrayInfo:(NSArray *)infoArray;

@end
