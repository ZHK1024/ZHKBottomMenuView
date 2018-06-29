//
//  ZHKBottomMenuView.h
//  SpringAnimation
//
//  Created by ZHK on 2018/6/29.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHKBottomPopMenuView : UIWindow

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) CGFloat height;

- (void)showAnimation;

- (void)hideAnimation;

@end
