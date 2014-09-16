//
//  PagerViewController.m
//  WebPager
//
//  Created by Ilter Cengiz on 16/09/14.
//  Copyright (c) 2014 Ilter Cengiz. All rights reserved.
//

#import "PagerViewController.h"
#import "WebViewController.h"

@interface PagerViewController () <ViewPagerDataSource, ViewPagerDelegate>

@property (nonatomic) NSMutableDictionary *viewControllers;

@property (nonatomic) NSMutableArray *titles;
@property (nonatomic) NSMutableArray *urls;

@end

@implementation PagerViewController

#pragma mark - Initialization

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        _titles = [NSMutableArray arrayWithObjects:
                   NSLocalizedString(@"Yahoo", nil),
                   NSLocalizedString(@"Wikipedia", nil),
                   NSLocalizedString(@"Twitter", nil),
                   NSLocalizedString(@"GitHub", nil),
                   NSLocalizedString(@"Google", nil),
                   NSLocalizedString(@"Apple", nil),
                   nil];
        
        _urls = [NSMutableArray arrayWithObjects:
                 [NSURL URLWithString:@"http://yahoo.com/"],
                 [NSURL URLWithString:@"http://wikipedia.org"],
                 [NSURL URLWithString:@"http://twitter.com/iltercengiz"],
                 [NSURL URLWithString:@"http://github.com/iltercengiz"],
                 [NSURL URLWithString:@"http://google.com"],
                 [NSURL URLWithString:@"http://apple.com"],
                 nil];
    }
    
    return self;
    
}

#pragma mark - View life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"WebPager", nil);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

#pragma mark - Getter

- (NSMutableDictionary *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = [NSMutableDictionary dictionary];
    }
    return _viewControllers;
}

#pragma mark - View pager data source

- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return 6;
}

- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *tabView = [UILabel new];
    
    tabView.textColor = [UIColor blackColor];
    tabView.text = self.titles[index];
    
    [tabView sizeToFit];
    
    return tabView;
    
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    
    WebViewController *wvc = self.viewControllers[@(index)];
    
    if (!wvc) {
        wvc = [self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
        wvc.urlToBeLoaded = self.urls[index];
        
        self.viewControllers[@(index)] = wvc;
    }
    
    return wvc;
    
}

#pragma mark - View pager delegate

@end
