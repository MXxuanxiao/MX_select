//
//  ViewController.m
//  SelectText
//
//  Created by maguanxiao on 16/7/8.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "ViewController.h"
#import "SelectText.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    SelectText *selectText = [[SelectText alloc] initWithFrame:CGRectMake(50, 50, 200, 600)];
    selectText.allData = [@[@"天津/TIANJIN", @"青岛/QINGDAO", @"上海/SHANGHAI", @"大连/DALIAN", @"宁波/NINGBO", @"广州/GUANGZHOU", @"香港/XIANGGANG"] mutableCopy];
    [self.view addSubview:selectText];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
