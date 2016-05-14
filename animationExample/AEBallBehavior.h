//
//  AEBallBehavior.h
//  animationExample
//
//  Created by Steven Liu on 2016-05-13.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AEBallBehavior : UIDynamicBehavior

@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collision;
@property (strong, nonatomic) UIPushBehavior *push;



- (instancetype)initWithItems:(NSArray *)items;

@end
