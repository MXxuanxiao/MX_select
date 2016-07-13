//
//  SelectText.m
//  SelectText
//
//  Created by maguanxiao on 16/7/8.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "SelectText.h"

@implementation SelectText

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createViewWithFrame:frame];
    }
    return self;
}
/**
 *  UI
 */
- (void)createViewWithFrame:(CGRect)frame {
    self.backgroundColor = [UIColor clearColor];
    self.allData = [NSMutableArray array];
    self.selectText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
    self.selectText.textAlignment = 1;
    self.selectText.backgroundColor = [UIColor whiteColor];
    self.selectText.layer.borderColor = [UIColor blackColor].CGColor;
    self.selectText.layer.borderWidth = 1.0f;
    self.selectText.layer.masksToBounds = YES;
    self.selectText.layer.cornerRadius = 5.0;
    [self addSubview:self.selectText];
    self.selectTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, frame.size.width, frame.size.height - 30) style:UITableViewStylePlain];
    self.selectTableView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.selectTableView];
    self.selectTableView.delegate = self;
    self.selectTableView.dataSource = self;
    self.selectTableView.rowHeight = 20;
    self.selectTableView.tableFooterView = [UIView new];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
}

- (void)setAllData:(NSMutableArray *)allData {
    if (_allData != allData) {
        _allData = allData;
        [self.selectTableView reloadData];
    }
    
}
#pragma tableView 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.selectData) {
        return _selectData.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * str = @"cellUse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.selectionStyle = NO;
    if (self.selectData) {
        cell.textLabel.text = [self.selectData objectAtIndex:indexPath.row];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:12.f];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = [self.selectData objectAtIndex:indexPath.row];
    self.selectText.text = str;
    self.selectTableView.hidden = YES;
    [self.selectText resignFirstResponder];
}
- (void)valueChange:(id)sender {
    self.selectTableView.hidden = NO;
    NSLog(@"%@",[self.selectText.text uppercaseString]);
    NSString *string = [self.selectText.text uppercaseString];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@",string];
    NSLog(@"%@",[self.allData filteredArrayUsingPredicate:pred]);
    self.selectData = [NSMutableArray arrayWithArray:[self.allData filteredArrayUsingPredicate:pred]];
    [self.selectTableView reloadData];
}

@end
