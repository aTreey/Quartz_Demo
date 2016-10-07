//
//  SecondViewController.m
//  LTQuartz
//
//  Created by LaoTao on 15/9/29.
//  Copyright © 2015年 LaoTao. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondQuartzView.h"

@interface SecondViewController ()
{
    SecondQuartzView *_quartzView;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    _quartzView = [[SecondQuartzView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    _quartzView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_quartzView];
    
    [self setNeedsDisplay];
}

- (void)setNeedsDisplay {
    [_quartzView setNeedsDisplay];
    [self performSelector:@selector(setNeedsDisplay) withObject:nil afterDelay:1];
    
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
