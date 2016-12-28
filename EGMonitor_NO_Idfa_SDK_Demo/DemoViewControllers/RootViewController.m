//
//  RootViewController.m
//  AppMonitorDemo
//
//  Created by MQL on 15/9/14.
//  Copyright (c) 2015年 MQL. All rights reserved.
//

#import "RootViewController.h"
#import "FirstPageViewController.h"
#import "WebViewController.h"
#import "EGMonitor.h"

@interface RootViewController ()

-(IBAction)firstPageBtn:(id)sender;
-(IBAction)eventBtn1:(id)sender;
-(IBAction)eventBtn2:(id)sender;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"首页";
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [EGMonitor beginLogPageView:@"RootViewController" contentTag:self.title];

}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [EGMonitor endLogPageView:@"RootViewController" contentTag:self.title];
    
}

-(IBAction)firstPageBtn:(id)sender{
    
    FirstPageViewController *firstVC = [[FirstPageViewController alloc]initWithNibName:@"FirstPageViewController" bundle:nil];
    [self.navigationController pushViewController:firstVC animated:YES];
    
}

-(IBAction)eventBtn1:(id)sender{
    
    NSString *eventId = @"事件Id1";
    NSString *eventName = @"事件名称1";
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"obj1", @"key1", nil];
    
    [EGMonitor eventID:eventId eventName:eventName eventPropertyDictionary:dic];
}

-(IBAction)eventBtn2:(id)sender{
    
    NSString *eventId = @"事件Id2";
    NSString *eventName = @"事件名称2";
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"obj2", @"key2", nil];
    
    [EGMonitor eventID:eventId eventName:eventName eventPropertyDictionary:dic];
}

@end
