//
//  UIResponder+ZHKPopRouter.h
//  Example
//
//  Created by ZHK on 2018/6/29.
//Copyright © 2018年 ZHK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZHKResponderEventType) {
    ZHKResponderEventTypeCancel,
    ZHKResponderEventTypeSelected
};

@interface UIResponder (ZHKPopRouter)

/**
 事件传递函数

 @param type  事件类型
 @param index item 被选中的 index
 */
- (void)routerWithEvent:(ZHKResponderEventType)type index:(NSUInteger)index;

@end
