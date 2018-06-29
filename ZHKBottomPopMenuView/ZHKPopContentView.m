//
//  ZHKPopContentView.m
//  Example
//
//  Created by ZHK on 2018/6/29.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKPopContentView.h"
#import "UIResponder+ZHKPopRouter.h"

@interface ZHKPopContentView ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UILabel          *titleLabel;
@property (nonatomic, strong) UIButton         *button;

@end

@implementation ZHKPopContentView

#pragma mark - Init

- (instancetype)init {
    if (self = [super init]) {
        [self createUI];
    }
    return self;
}

#pragma mark - UI

- (void)createUI {
    [self addSubview:self.titleLabel];
    [self addSubview:self.collectionView];
    [self addSubview:self.button];
    
    self.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    _collectionView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds) - 50;
    [_titleLabel sizeToFit];
    _titleLabel.center = CGPointMake(width / 2, 25.0f);
    _button.frame = CGRectMake(0, height - 50.0f, width, 50.0f);
    _collectionView.frame = CGRectMake(0, 50.0f, width, height - 50.0f - 50.0f);
}

#pragma mark - Action

- (void)cancelButtonAction {
    [[self nextResponder] routerWithEvent:ZHKResponderEventTypeCancel index:0];
}

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.text = @"标题";
    }
    return _titleLabel;
}

- (UIButton *)button {
    if (_button == nil) {
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setBackgroundColor:[UIColor whiteColor]];
        [_button setTitle:@"Cancel" forState:(UIControlStateNormal)];
        [_button addTarget:self action:@selector(cancelButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _button;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    }
    return _collectionView;
}

@end
