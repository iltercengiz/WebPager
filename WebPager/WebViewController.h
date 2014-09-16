//
//  WebViewController.h
//  WebPager
//
//  Created by Ilter Cengiz on 16/09/14.
//  Copyright (c) 2014 Ilter Cengiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic) NSURL *urlToBeLoaded;

@end
