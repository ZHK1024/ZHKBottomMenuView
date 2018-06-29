//
//  ZHKBottomMenuView.h
//  SpringAnimation
//
//  Created by ZHK on 2018/6/29.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHKBottomMenuView : UIWindow

@property (nonatomic, strong) NSString *title;

- (void)showAnimation;

- (void)hideAnimation;

@end
