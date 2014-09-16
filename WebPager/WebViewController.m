//
//  WebViewController.m
//  WebPager
//
//  Created by Ilter Cengiz on 16/09/14.
//  Copyright (c) 2014 Ilter Cengiz. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.urlToBeLoaded]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
