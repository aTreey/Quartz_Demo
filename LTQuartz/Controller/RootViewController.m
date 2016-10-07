//
//  RootViewController.m
//  LTQuartz
//
//  Created by LaoTao on 15/9/22.
//  Copyright © 2015年 LaoTao. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "SixthViewController.h"

#import "LTQuartz-Swift.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *vcArray = @[
                         @"FirstViewController",
                         @"SecondViewController",
                         @"ThirdViewController",
                         @"FourthViewController",
                         @"FifthViewController",
                         @"SixthViewController",
                         @"SevenViewController",
                         ];
    
    if (indexPath.row == 4) {   //Swift 的类，这个方法好像无用
        FifthViewController *fifth = [[FifthViewController alloc] init];
        [self.navigationController pushViewController:fifth animated:YES];
    }else {
        UIViewController *controller = [[NSClassFromString(vcArray[indexPath.row]) alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIde = @"cellIde";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIde];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"未完成图表";
            break;
        case 1:
            cell.textLabel.text = @"动态折线图";
            break;
        case 2:
            cell.textLabel.text = @"最简单画线功能";
            break;
        case 3:
            cell.textLabel.text = @"进度条";
            break;
        case 4:
            cell.textLabel.text = @"动态折线图-Swift";
            break;
        case 5:
            cell.textLabel.text = @"手环图表";
            break;
        case 6:
            cell.textLabel.text = @"详情页";
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
