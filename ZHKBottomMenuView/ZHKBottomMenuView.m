//
//  ZHKBottomMenuView.m
//  SpringAnimation
//
//  Created by ZHK on 2018/6/29.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKBottomMenuView.h"


#define BM_SIZE [UIScreen mainScreen].bounds.size

static CGFloat height = 300.0f;
static CGFloat gap = 50.0f;

@interface ZHKBottomMenuView () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *contentView;

@end

@implementation ZHKBottomMenuView

#pragma mark - Init

- (instancetype)init {
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        [self createUI];
    }
    return self;
}

#pragma mark - UI

- (void)createUI {
    self.windowLevel = 2000;
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.contentView];
    
    // GestureRecognizer
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAnimation)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

#pragma mark -

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return ![touch.view isEqual:self.contentView];
}

#pragma mark - Animation

- (void)showAnimation {
    self.hidden = NO;
    [self makeKeyAndVisible];
    [UIView animateWithDuration:0.1 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _contentView.frame = CGRectMake(0, BM_SIZE.height - height, BM_SIZE.width, height + gap);
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)hideAnimation {
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _contentView.frame = CGRectMake(0, BM_SIZE.height, BM_SIZE.width, height + gap);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.backgroundColor = [UIColor clearColor];
        } completion:^(BOOL finished) {
            [self setHidden:YES];
            [self resignKeyWindow];
        }];
    }];
}

#pragma mark - Getter

- (UIView *)contentView {
    if (_contentView == nil) {
        self.contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.frame = CGRectMake(0, BM_SIZE.height, BM_SIZE.width, height + gap);
    }
    return _contentView;
}

@end
