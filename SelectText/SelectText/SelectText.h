//
//  SelectText.h
//  SelectText
//
//  Created by maguanxiao on 16/7/8.
//  Copyright © 2016年 MX. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SelectText : UIView<UITableViewDelegate,UITableViewDataSource>
- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, strong) NSMutableArray *allData;
@property (nonatomic, strong) NSMutableArray *selectData;
@property (nonatomic, strong) UITextField *selectText;
@property (nonatomic, strong) UITableView *selectTableView;

@end
