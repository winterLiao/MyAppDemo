//
//  NSArray+swiArray.m
//  MyApp
//
//  Created by liaowentao on 17/3/28.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import "NSArray+swiArray.h"
#import "objc/runtime.h"

@implementation NSArray (swiArray)
+ (void)load {
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(swi_objectAtIndex:));
    method_exchangeImplementations(fromMethod, toMethod);
}

- (id)swi_objectAtIndex:(NSUInteger)index {
    if (self.count-1 < index) {
        // 这里做一下异常处理，不然都不知道出错了。
        @try {
            return [self swi_objectAtIndex:index];
        }
        @catch (NSException *exception) {
            // 在崩溃后会打印崩溃信息，方便我们调试。
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            NSLog(@"%@", [exception callStackSymbols]);
            return nil;
        }
        @finally {}
    } else {
        return [self swi_objectAtIndex:index];
    }
}
@end
