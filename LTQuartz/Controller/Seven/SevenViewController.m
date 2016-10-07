//
//  SevenViewController.m
//  LTQuartz
//
//  Created by 陶柏同 on 16/8/23.
//  Copyright © 2016年 LaoTao. All rights reserved.
//

#import "SevenViewController.h"
#import "SevenView.h"

@interface SevenViewController ()
{
    SevenView *_quartzView;
}

@end

@implementation SevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详情页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    _quartzView = [[SixthView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
//    _quartzView.backgroundColor = [UIColor colorWithRed:0 green:86/255.0 blue:104/255.0 alpha:1];
//
    
    _quartzView = [[SevenView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    _quartzView.backgroundColor = [UIColor colorWithRed:0 green:86/255.0 blue:104/255.0 alpha:1];
    [self.view addSubview:_quartzView];
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
