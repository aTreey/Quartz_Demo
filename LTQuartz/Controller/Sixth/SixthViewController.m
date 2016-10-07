//
//  SixthViewController.m
//  LTQuartz
//
//  Created by LaoTao on 16/7/25.
//  Copyright © 2016年 LaoTao. All rights reserved.
//

#import "SixthViewController.h"
#import "SixthView.h"

@interface SixthViewController ()
{
    SixthView *_quartzView;
}
@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"手环";
    
    self.view.backgroundColor = [UIColor whiteColor];
    _quartzView = [[SixthView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
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
