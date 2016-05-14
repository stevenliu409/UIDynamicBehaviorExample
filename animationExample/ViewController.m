//
//  ViewController.m
//  animationExample
//
//  Created by Steven Liu on 2016-05-06.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (assign) BOOL pressed;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pressed = NO;
    

    
}

-(IBAction)buttonPressed:(id)sender {
    
    if (!self.pressed) {
        self.heightConstraint.constant = 200;
        
        
        [UIView animateWithDuration:1
                              delay:0.5
             usingSpringWithDamping:0.5
              initialSpringVelocity:0.5
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [self.view layoutIfNeeded];
                         }
                         completion:nil];
    } else {
        self.heightConstraint.constant = 8;
        
        [UIView animateWithDuration:1
                              delay:0.5
             usingSpringWithDamping:0.5
              initialSpringVelocity:0.5
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [self.view layoutIfNeeded];
                         }
                         completion:nil];
        
    }
    self.pressed = !self.pressed;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
