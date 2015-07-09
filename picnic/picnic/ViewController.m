//
//  ViewController.m
//  picnic
//
//  Created by Andrei on 7/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *fabricTop;
@property (weak, nonatomic) IBOutlet UIImageView *fabricBottom;
@property (weak, nonatomic) IBOutlet UIImageView *bug;

@end

@implementation ViewController


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    
    CGRect bugRect = [[[self.bug layer] presentationLayer] frame];
    if (CGRectContainsPoint(bugRect, touchLocation)){
        bugDead = YES;
    } else{
        NSLog(@"no");
        return;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    CGRect basketTopFrame = self.topView.frame;
    basketTopFrame.origin.y = -basketTopFrame.size.height;
    
    CGRect basketBottomFrame = self.bottomView.frame;
    basketBottomFrame.origin.y = self.view.bounds.size.height;
    
    [UIView animateWithDuration:0.5 delay:1.0 options:UIViewAnimationCurveEaseOut animations:^{ self.topView.frame = basketTopFrame; self.bottomView.frame = basketBottomFrame; }completion:^(BOOL finished){
        NSLog(@"Done!");
    }];
    
    CGRect napkinTopFrame = self.fabricTop.frame;
    napkinTopFrame.origin.y = -napkinTopFrame.size.height;
    
    CGRect napkinBottomFrame = self.fabricBottom.frame;
    napkinBottomFrame.origin.y = self.view.bounds.size.height;
    
    [UIView animateWithDuration:0.9 delay:1.5 options:UIViewAnimationCurveEaseOut animations:^{self.fabricTop.frame = napkinTopFrame; self.fabricBottom.frame = napkinBottomFrame;} completion:^(BOOL finished){
        NSLog(@"double done");
    }];
    
    // Launch the chain of the bug animation at the bottom of viewDidAppear
    [self moveToLeft:nil finished:nil context:nil];
}

- (void)moveToLeft:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if (bugDead) return;
    
    // After NSLog(@"Bug tapped!"); in touchesBegan method
    bugDead = true;
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.bug.transform = CGAffineTransformMakeScale(1.25, 0.75);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0
                                               delay:2.0
                                             options:0
                                          animations:^{
                                              self.bug.alpha = 0.0;
                                          } completion:^(BOOL finished) {
                                              [self.bug removeFromSuperview];
                                          }];
                     }];
    
    [UIView animateWithDuration:1.0
                          delay:2.0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         [UIView setAnimationDidStopSelector:@selector(faceRight:finished:context:)];
                         self.bug.center = CGPointMake(75, 200);
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Move to left done");
                     }];
    
}

- (void)faceRight:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if (bugDead) return;
    
    // After NSLog(@"Bug tapped!"); in touchesBegan method
    bugDead = true;
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.bug.transform = CGAffineTransformMakeScale(1.25, 0.75);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0
                                               delay:2.0
                                             options:0
                                          animations:^{
                                              self.bug.alpha = 0.0;
                                          } completion:^(BOOL finished) {
                                              [self.bug removeFromSuperview];
                                          }];
                     }];
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         [UIView setAnimationDidStopSelector:@selector(moveToRight:finished:context:)];
                         
                         self.bug.transform = CGAffineTransformMakeRotation(M_PI);
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Face right done");
                     }];
    
}

- (void)moveToRight:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if (bugDead) return;
    
    // After NSLog(@"Bug tapped!"); in touchesBegan method
    bugDead = true;
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.bug.transform = CGAffineTransformMakeScale(1.25, 0.75);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0
                                               delay:2.0
                                             options:0
                                          animations:^{
                                              self.bug.alpha = 0.0;
                                          } completion:^(BOOL finished) {
                                              [self.bug removeFromSuperview];
                                          }];
                     }];
    
    [UIView animateWithDuration:1.0
                          delay:2.0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         [UIView setAnimationDidStopSelector:@selector(faceLeft:finished:context:)];
                         self.bug.center = CGPointMake(230, 250);
                         
                     }
                     completion:^(BOOL finished){
                         
                         NSLog(@"Move to right done");
                     }];
    
}

- (void)faceLeft:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if (bugDead) return;
    
    // After NSLog(@"Bug tapped!"); in touchesBegan method
    bugDead = true;
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.bug.transform = CGAffineTransformMakeScale(1.25, 0.75);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0
                                               delay:2.0
                                             options:0
                                          animations:^{
                                              self.bug.alpha = 0.0;
                                          } completion:^(BOOL finished) {
                                              [self.bug removeFromSuperview];
                                          }];
                     }];
    
    
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         
                         [UIView setAnimationDidStopSelector:@selector(moveToLeft:finished:context:)];
                         self.bug.transform = CGAffineTransformMakeRotation(0);
                         
                         
                     }completion:^(BOOL finished){
                         NSLog(@"Face left done");
                         
                     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
