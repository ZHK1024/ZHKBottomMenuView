//
//  ZHKBottomMenuView.h
//  SpringAnimation
//
//  Created by ZHK on 2018/6/29.
//  Copyright © 2018年 ZHK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHKBottomPopMenuView;
@protocol ZHKBottomPopMenuDelegate <NSObject>

- (void)menuView:(ZHKBottomPopMenuView *)menu didSelectAtIndex:(NSUInteger)index;

@end

@interface ZHKBottomPopMenuView : UIWindow

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, weak) id <ZHKBottomPopMenuDelegate> delegate;

- (void)show;

- (void)hideAnimation;

@end
