//
//  UIAlertView+ActionBlock.h
//  UIAlertViewBYRuntime
//
//  Created by ian on 16/2/20.
//  Copyright © 2016年 ian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertCallBack)(UIAlertView *, NSUInteger);

@interface UIAlertView (ActionBlock)<UIAlertViewDelegate>

@property (nonatomic, copy) AlertCallBack callBack;

@end
