//
//  AEBallBehavior.m
//  animationExample
//
//  Created by Steven Liu on 2016-05-13.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "AEBallBehavior.h"

@implementation AEBallBehavior

- (instancetype)initWithItems:(NSArray *)items
{
    if(self = [super init]) {
        self.gravity = [[UIGravityBehavior alloc] initWithItems:items];
        self.collision = [[UICollisionBehavior alloc] initWithItems:items];
        self.collision.translatesReferenceBoundsIntoBoundary = YES;
        self.push = [[UIPushBehavior alloc] initWithItems:items mode:UIPushBehaviorModeInstantaneous];
        
        [self addChildBehavior:self.gravity];
        [self addChildBehavior:self.collision];
        [self addChildBehavior:self.push];
    }
    
   
    return self;
}



@end
