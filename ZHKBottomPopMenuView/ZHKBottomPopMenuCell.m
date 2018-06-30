//
//  ZHKBottomPopMenuCell.m
//  Example
//
//  Created by TongJunfeng on 2018/6/30.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import "ZHKBottomPopMenuCell.h"

NSString *const ZHKBottomPopMenuCell_IDFR = @"ZHKBottomPopMenuCell";

@interface ZHKBottomPopMenuCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel     *textLabel;

@end

@implementation ZHKBottomPopMenuCell

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

#pragma mark - UI

- (void)createUI {
//    self.contentView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.textLabel];
    
    _imageView.image = [UIImage imageNamed:@"umsocial_qq"];
    _textLabel.text = @"QQ";
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = self.bounds.size;
    [_textLabel sizeToFit];
    _textLabel.frame = CGRectMake(0, size.height - CGRectGetHeight(_textLabel.frame), size.width, CGRectGetHeight(_textLabel.frame));
    _imageView.frame = CGRectMake(0, 0, size.height - CGRectGetHeight(_textLabel.frame), size.height - CGRectGetHeight(_textLabel.frame));
    _imageView.center = CGPointMake(size.width / 2, CGRectGetHeight(_imageView.frame) / 2);
}

#pragma mark - Getter

- (UIImageView *)imageView {
    if (_imageView == nil) {
        self.imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UILabel *)textLabel {
    if (_textLabel == nil) {
        self.textLabel = [UILabel new];
        _textLabel.font = [UIFont systemFontOfSize:14.0f];
        _textLabel.textColor = [UIColor grayColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

@end
