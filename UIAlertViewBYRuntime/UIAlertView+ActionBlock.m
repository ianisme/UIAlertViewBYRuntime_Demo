//
//  UIAlertView+ActionBlock.m
//  UIAlertViewBYRuntime
//
//  Created by ian on 16/2/20.
//  Copyright © 2016年 ian. All rights reserved.
//

#import "UIAlertView+ActionBlock.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation UIAlertView (ActionBlock)

- (void)setCallBack:(AlertCallBack)callBack
{
    objc_setAssociatedObject(self, @selector(callBack), callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;
}

- (AlertCallBack)callBack
{
    return objc_getAssociatedObject(self, @selector(callBack));
}

#pragma mark - delegate method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.callBack) {
        self.callBack(alertView, buttonIndex);
    }
}

@end
