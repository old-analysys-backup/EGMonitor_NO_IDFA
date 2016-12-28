//
//  FirstPageViewController.m
//  AppMonitorDemo
//
//  Created by MQL on 15/9/14.
//  Copyright (c) 2015年 MQL. All rights reserved.
//

#import "FirstPageViewController.h"
#import "WebViewController.h"
#import "EGMonitor.h"

@interface FirstPageViewController ()

-(IBAction)secondPageBtn:(id)sender;

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"web页面";

}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [EGMonitor beginLogPageView:@"FirstPageViewController" contentTag:self.title];

}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [EGMonitor endLogPageView:@"FirstPageViewController" contentTag:self.title];
    
}

-(IBAction)secondPageBtn:(id)sender{
    
    WebViewController *vc = [[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
