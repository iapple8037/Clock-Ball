//
//  DropitBehavior.m
//  Clock Ball
//
//  Created by HIROKI on 2014/02/11.
//  Copyright (c) 2014年 HIROKI. All rights reserved.
//

#import "DropitBehavior.h"


@interface DropitBehavior()<UICollisionBehaviorDelegate>
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@property (strong, nonatomic) UIDynamicItemBehavior *animationOptions;

@end

@implementation DropitBehavior

//gravityを設定。もしgravityが設定していない場合、作って、gravityをかえす。
-(UIGravityBehavior *) gravity
{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
        
    }
    return _gravity;
}

//collisionを設定。
- (UICollisionBehavior *)collider
{
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
        _collider.collisionDelegate = self;//衝突時に呼ぶメソッドデリゲート

    }
    return _collider;
}

//UIDynamicItemBehaviorの設定。(animationOptions)
- (UIDynamicItemBehavior *)animationOptions
{
    if (!_animationOptions) {
        _animationOptions = [[UIDynamicItemBehavior alloc] init];
        //_animationOptions.allowsRotation = NO;//rotateしないようにする。
        //TODO:バウンドした時の動作ビヘビアー//
        _animationOptions.elasticity = 0.7;

    }
    return _animationOptions;
}

- (void)addItem:(id <UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collider addItem:item];
    [self.animationOptions addItem:item];
}

- (void)removeItem:(id <UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
    [self.animationOptions removeItem:item];
}

//衝突時に呼ぶメソッド,衝突の都度色が変わる。
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    //NSLog(@"Boundary contact occurred - %@", identifier);
    
    UIView* view = (UIView*)item;
    view.backgroundColor = [UIColor yellowColor];
    [UIView animateWithDuration:0.3 animations:^{
        view.backgroundColor = [UIColor orangeColor];
    }];
}


- (instancetype)init
{
    self = [super init];
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collider];
    [self addChildBehavior:self.animationOptions];
    return self;
}

@end
