//
//  ViewController.m
//  MultipleRightBtnOnTableView
//
//  Created by 孙云 on 16/5/19.
//  Copyright © 2016年 haidai. All rights reserved.
//
#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [UIFont familyNames];
    [self initTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark  init

- (void)initTableView{

    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
#pragma mark  tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * const ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:ID];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}
#pragma mark multiple method delegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return UITableViewCellEditingStyleDelete;
//}
#pragma mark  core method

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{

    // 设置删除按钮
    UITableViewRowAction *noDeleAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"不删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //事件
        NSLog(@"不删除");
    }];
    
    //收藏
    UITableViewRowAction *noLoveAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"不收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //事件
        NSLog(@"不收藏");
    }];
    //不开心
    UITableViewRowAction *noHappyAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"不开心" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //事件
        NSLog(@"不开心");
    }];
    
    noDeleAction.backgroundColor = [UIColor blueColor];
    noLoveAction.backgroundColor = [UIColor purpleColor];
    return @[noHappyAction,noLoveAction,noDeleAction];
}
@end
