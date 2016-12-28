//
//  WebViewController.m
//  IOS应用监测2.0.1类封装
//
//  Created by MQL on 16/4/18.
//  Copyright © 2016年 MQL. All rights reserved.
//

#import "WebViewController.h"
#import "EGMonitor.h"

#define kWebViewStr @"http://192.168.0.178/H5-JS-SDK-Demo/index_App.html"
/**
 H5 SDK集成地址：http://dev.analysys.cn/static/html/frontView/doc/sdk.html#h5-h
 */

@interface WebViewController ()<UIWebViewDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSURL *url = [NSURL URLWithString:kWebViewStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@", request.URL.absoluteString);
    if ([EGMonitor h5InfoStatEnterWithRequest:request webView:webView] == YES) {
        return NO;//此处说明，request是属于统计的，不是真正的网络请求。
    }
    
    return YES;
}

@end
