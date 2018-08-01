//
//  ZHKPopContentView.m
//  Example
//
//  Created by ZHK on 2018/6/29.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKPopContentView.h"
#import "ZHKBottomPopMenuCell.h"
#import "UIResponder+ZHKPopRouter.h"

@interface ZHKPopContentView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView           *gapView;

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
    [self addSubview:self.gapView];
    
    self.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    _collectionView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds) - 50;
    [_titleLabel sizeToFit];
    _titleLabel.center = CGPointMake(width / 2, 30.0f);
    _button.frame = CGRectMake(0, height - 50.0f, width, 50.0f);
    _gapView.frame = CGRectMake(0, height, width, 50.0f);
    _collectionView.frame = CGRectMake(0, 50.0f, width, height - 50.0f - 50.0f);
}

#pragma mark - Action

- (void)cancelButtonAction {
    [[self nextResponder] routerWithEvent:ZHKResponderEventTypeCancel index:0];
}

#pragma mark - UICollectionView dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 32;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZHKBottomPopMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZHKBottomPopMenuCell_IDFR forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionView delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [[self nextResponder] routerWithEvent:ZHKResponderEventTypeSelected index:indexPath.row];
}

#pragma mark - Setter

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:17.0f];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.text = @"标题";
    }
    return _titleLabel;
}

- (UIButton *)button {
    if (_button == nil) {
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0f];
        [_button setBackgroundColor:[UIColor whiteColor]];
        [_button setTitle:@"取消" forState:(UIControlStateNormal)];
        [_button setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [_button addTarget:self action:@selector(cancelButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _button;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ZHKBottomPopMenuCell class] forCellWithReuseIdentifier:ZHKBottomPopMenuCell_IDFR];
        _collectionView.pagingEnabled = YES;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)layout {
    if (_layout == nil) {
        self.layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = CGSizeMake(70, 70);
        _layout.minimumLineSpacing = 15.0f;
        _layout.minimumInteritemSpacing = 10.0f;
        _layout.sectionInset = UIEdgeInsetsMake(15, 30, 15, 30);
    }
    return _layout;
}

- (UIView *)gapView {
    if (_gapView == nil) {
        self.gapView = [UIView new];
        _gapView.backgroundColor = [UIColor whiteColor];
    }
    return _gapView;
}

@end
