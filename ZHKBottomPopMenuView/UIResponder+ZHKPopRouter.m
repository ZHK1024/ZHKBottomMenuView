//
//  UIResponder+ZHKPopRouter.m
//  Example
//
//  Created by ZHK on 2018/6/29.
//Copyright © 2018年 ZHK. All rights reserved.
//

#import "UIResponder+ZHKPopRouter.h"

@implementation UIResponder (ZHKPopRouter)

- (void)routerWithEvent:(ZHKResponderEventType)type index:(NSUInteger)index {
    [[self nextResponder] routerWithEvent:type index:index];
}

@end
