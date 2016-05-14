//
//  dynamicAnimationViewController.m
//  animationExample
//
//  Created by Steven Liu on 2016-05-06.
//  Copyright © 2016 Steven Liu. All rights reserved.
//
// TESt
#import "dynamicAnimationViewController.h"

@interface dynamicAnimationViewController ()

@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (weak, nonatomic) IBOutlet UIView *redSquare;
@property (weak, nonatomic) IBOutlet UIView *animateView;

@end

@implementation dynamicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.animateView];

    self.redSquare.layer.cornerRadius = 30;

    self.ballBehavior = [[AEBallBehavior alloc] initWithItems:@[self.redSquare]];
    [self.animator addBehavior:self.ballBehavior];
    
}


- (IBAction)dragRecognized:(UIPanGestureRecognizer *)sender {

    [self.animator removeAllBehaviors];

    if([sender state] == UIGestureRecognizerStateChanged) {
        self.redSquare.center = [sender locationInView:self.animateView];
    }
    
    if([sender state] == UIGestureRecognizerStateEnded) {
        [self.animator addBehavior:self.ballBehavior];
        
        [self.ballBehavior.push setAngle:[self calculateAngle:[sender velocityInView:self.animateView]]
                  magnitude:[self calculateMagnitude:[sender velocityInView:self.animateView]]];
        [self.ballBehavior.push setActive:YES];
    }
    
}


- (CGFloat)calculateAngle:(CGPoint)p1  {
    CGFloat angle = atanf(p1.y/p1.x);
    return angle;
}


- (CGFloat)calculateMagnitude:(CGPoint)p1 {
    CGFloat direction = 1;
    CGFloat magnitude = pow(p1.x, 2) + pow(p1.y, 2);
    if (p1.x < 0 ) {
        direction = -1;
    }
    
    return sqrt(magnitude)/1000 * direction;
}

@end
