//
//  ViewController.m
//  Example
//
//  Created by ZHK on 2018/6/29.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ViewController.h"
#import "ZHKBottomPopMenuView.h"

@interface ViewController () <ZHKBottomPopMenuDelegate>

@property (nonatomic, strong) ZHKBottomPopMenuView *bmView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.bmView = [[ZHKBottomPopMenuView alloc] init];
    _bmView.delegate = self;
    _bmView.title = @"分享";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(show)];
}

#pragma mark - Action

- (void)show {
    [_bmView show];
}

#pragma mark - ZHKBottomPopMenu delegate

- (void)menuView:(ZHKBottomPopMenuView *)menu didSelectAtIndex:(NSUInteger)index {
    NSLog(@"index = %lu", index);
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
