//
//  DropitBehavior.h
//  Clock Ball

//  Created by HIROKI on 2014/02/11.
//  Copyright (c) 2014年 HIROKI. All rights reserved.

//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end
