//
//  BannarsDetailViewController.m
//  Infinite-Shuffling-Figure
//
//  Created by 紫川秀 on 2017/7/6.
//  Copyright © 2017年 View. All rights reserved.
//

#import "BannarsDetailViewController.h"
#import <WebKit/WebKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface BannarsDetailViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation BannarsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;

    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20)];
    _webView.allowsBackForwardNavigationGestures = YES;
    if (_model == nil) {
        return;
    }else{
        if (_model.link == nil) {
            return;
        }else{
            [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_model.link]]];
        }
    }
    [self.view addSubview:_webView];
    
}


@end
