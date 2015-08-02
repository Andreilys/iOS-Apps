//
//  ViewController.m
//  Project Zen
//
//  Created by Andrei on 8/1/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int counter;
}

- (void)viewDidLoad {
    [super viewDidLoad];

   
}
- (IBAction)zenButton:(id)sender {
    [self.uncheckedButton setBackgroundImage:[UIImage imageNamed:@"ChallengeCounter"] forState:UIControlStateDisabled];
    self.uncheckedButton.enabled = NO;
    counter++;
    self.challengeCounter.text = [NSString stringWithFormat:@"%d", counter];
    
    
    //disable for the day
   // self.uncheckedButton.enabled = NO;
}
- (IBAction)favoriteButton:(id)sender {
    [self.heartButton setBackgroundImage:[UIImage imageNamed:@"filledHeart"] forState:UIControlStateDisabled];
    self.heartButton.enabled = NO;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
