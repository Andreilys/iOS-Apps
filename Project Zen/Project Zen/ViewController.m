//
//  ViewController.m
//  Project Zen
//
//  Created by Andrei on 8/1/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "ViewController.h"
#import "DateModel.h"
#import "OnboardingContentViewController.h"
#import "OnboardingViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int counter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OnboardingContentViewController *firstPage = [OnboardingContentViewController contentWithTitle:@"Page Title" body:@"Page body goes here." image:nil buttonText:@"Text For Button" action:^{
        // do something here when users press the button, like ask for location services permissions, register for push notifications, connect to social media, or finish the onboarding process
    }];
    
    OnboardingContentViewController *secondPage = [OnboardingContentViewController contentWithTitle:@"Page Title" body:@"Page body goes here." image:nil buttonText:@"Text For Button" action:^{
        // do something here when users press the button, like ask for location services permissions, register for push notifications, connect to social media, or finish the onboarding process
    }];
    
    OnboardingContentViewController *thirdPage = [OnboardingContentViewController contentWithTitle:@"Page Title" body:@"Page body goes here." image:nil buttonText:@"Text For Button" action:^{
        // do something here when users press the button, like ask for location services permissions, register for push notifications, connect to social media, or finish the onboarding process
    }];
    
    
    
    // Image
    OnboardingViewController *onboardingVC = [OnboardingViewController onboardWithBackgroundImage:[UIImage imageNamed:@"nature"] contents:@[firstPage, secondPage, thirdPage]];
       
    [self presentViewController:onboardingVC animated:YES completion: nil];
    
    

    
    //this will be the start date for the challenge
    NSDate *startingDate = self.startDate;
    startingDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"startDate"];
  
    DateModel *dateModelClass = [[DateModel alloc] init];

    //need to check if we already set the standard user default
    if(startingDate){
        //this finds the difference in the dates to see if there is a new day
        double differenceInDate = [dateModelClass findChallengeDate:startingDate];

        //returns a dictionary which I can pull info from
        NSDictionary *challenge = [dateModelClass showChallenge:differenceInDate];
        self.dayLabel.text = challenge[@"Day"];
        self.challengeLabel.text = challenge[@"Challenge"];
        
    } else{
        //set the start date for the challenge, and save to user default
        startingDate = [dateModelClass getDate];
        [[NSUserDefaults standardUserDefaults] setObject:self.startDate forKey:@"startDate"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"damn");
    }
    
    

}



- (IBAction)loadButton:(id)sender {

}

//testing purposes
- (IBAction)nextButton:(id)sender {
    self.dayLabel.text = @"Day 2:";
    self.challengeLabel.text = @"Meditate for 5 mins:";
}

- (IBAction)favoriteButton:(id)sender {
//    [self.heartButton setBackgroundImage:[UIImage imageNamed:@"filledHeart"] forState:UIControlStateDisabled];
//    self.heartButton.enabled = NO;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *favoritesLoaded = [defaults objectForKey:@"favorites"];
    
    NSDictionary *fav = [NSDictionary dictionaryWithObjectsAndKeys:
                         self.dayLabel.text, @"Day",
                         self.challengeLabel.text, @"Challenge",
                         nil];
    
    
    NSMutableArray *favorites = [NSMutableArray array];
    
    if (favoritesLoaded) {
        favorites = [[NSMutableArray alloc] initWithArray:favoritesLoaded];
    } else {
        favorites = [[NSMutableArray alloc] init];
    }
    

    [favorites addObject:fav];
    [defaults setObject:favorites forKey:@"favorites"];
    [defaults synchronize];
}

- (IBAction)zenButton:(id)sender {
    [self.uncheckedButton setBackgroundImage:[UIImage imageNamed:@"ChallengeCounter"] forState:UIControlStateDisabled];
    self.uncheckedButton.enabled = NO;
    counter++;
    self.challengeCounter.text = [NSString stringWithFormat:@"%d", counter];
    
    
    //disable for the day
    // self.uncheckedButton.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
