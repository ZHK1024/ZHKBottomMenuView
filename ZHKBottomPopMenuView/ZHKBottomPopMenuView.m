//
//  ZHKBottomMenuView.m
//  SpringAnimation
//
//  Created by ZHK on 2018/6/29.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKBottomPopMenuView.h"
#import "ZHKPopContentView.h"
#import "UIResponder+ZHKPopRouter.h"

#define BM_SIZE [UIScreen mainScreen].bounds.size

static CGFloat gap = 50.0f;

@interface ZHKBottomPopMenuView () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) ZHKPopContentView *contentView;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UILabel  *titleLabel;

@end

@implementation ZHKBottomPopMenuView

#pragma mark - Init

- (instancetype)init {
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.height = 300.0f;
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

#pragma mark - UIGestureRecognizer delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return [touch.view isKindOfClass:[self class]];
}

#pragma mark - Router

- (void)routerWithEvent:(ZHKResponderEventType)type index:(NSUInteger)index {
    if (type == ZHKResponderEventTypeCancel) {
        [self hideAnimation];
    } else {
        
    }
}

#pragma mark - Animation

- (void)showAnimation {
    self.hidden = NO;
    [self makeKeyAndVisible];
    _contentView.frame = CGRectMake(0, BM_SIZE.height, BM_SIZE.width, _height + gap);
    [UIView animateWithDuration:0.1 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _contentView.frame = CGRectMake(0, BM_SIZE.height - _height, BM_SIZE.width, _height + gap);
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)hideAnimation {
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _contentView.frame = CGRectMake(0, BM_SIZE.height, BM_SIZE.width, _height + gap);
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

- (ZHKPopContentView *)contentView {
    if (_contentView == nil) {
        self.contentView = [ZHKPopContentView new];
        _contentView.frame = CGRectMake(0, BM_SIZE.height, BM_SIZE.width, _height + gap);
    }
    return _contentView;
}

@end
