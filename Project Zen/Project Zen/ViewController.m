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
#import "settingNotificationsModel.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //need to check if user has already been onboarded
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userOnBoarded;
    userOnBoarded = [defaults objectForKey:@"onboarded"];
    
    //instantiaiting counter object
    NSInteger userCompletedChallengesCounter = [defaults integerForKey:@"counter"];
    if (userCompletedChallengesCounter) {
        self.challengeCounter.text = [NSString stringWithFormat:@"%d", userCompletedChallengesCounter];
    } else {
        NSInteger challengeCounter = 0;
        [defaults setInteger:challengeCounter forKey:@"counter"];
        [defaults synchronize];
        self.challengeCounter.text = [NSString stringWithFormat:@"%ld", (long)challengeCounter];

        
    }

    
    if(!userOnBoarded){
        OnboardingContentViewController *firstPage = [OnboardingContentViewController contentWithTitle:@"The Journey" body:@"Over the course of 31 days, this app will help create more space in your life. You will recieve a daily challenge that's aimed to make you more mindful, compassionate, and empathetic." image:[UIImage imageNamed:@"Icon-76"] buttonText:@"Let's Do This!" action:^{
            // do something here when users press the button, like ask for location services permissions, register for push notifications, connect to social media, or finish the onboarding process
        }];
        
        firstPage.movesToNextViewController = YES;
        firstPage.underIconPadding = 20;
        
        OnboardingContentViewController *secondPage = [OnboardingContentViewController contentWithTitle:@"The Tools" body:@"To help you, we'll send you two notifications, once in the morning, and once in the evening." image:[UIImage imageNamed:@"Icon-76"] buttonText:@"Agreed" action:^{
            
            settingNotificationsModel *notification = [[settingNotificationsModel alloc] init];
            
            [notification setNotifications];
            
            // do something here when users press the button, like ask for location services permissions, register for push notifications, connect to social media, or finish the onboarding process
        }];
        
        secondPage.movesToNextViewController = YES;
        OnboardingContentViewController *thirdPage = [OnboardingContentViewController contentWithTitle:@"The Challenge" body:@"Some of these challenges may be outside of your comfort zone and that's okay. Its important to occasionally push the boundaries of your comfort zone. You will have 24 hours to complete each challenge, starting from the moment you open the application - good luck!" image:[UIImage imageNamed:@"Icon-76"] buttonText:@"Challenge Accepted" action:^{
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        
        thirdPage.movesToNextViewController = YES;
        
        // Image
        OnboardingViewController *onboardingVC = [OnboardingViewController onboardWithBackgroundImage:[UIImage imageNamed:@"nature"] contents:@[firstPage, secondPage, thirdPage]];
        
        
        onboardingVC.bodyTextColor = [UIColor colorWithRed:200.0f/255.0f
                                                     green:230.0f/255.0f
                                                      blue:201.0f/255.0f
                                                     alpha:1.0f];
        onboardingVC.buttonTextColor = [UIColor colorWithRed:76.0f/255.0f
                                                       green:175.0f/255.0f
                                                        blue:80.0f/255.0f
                                                       alpha:1.0f];
        onboardingVC.titleTextColor = [UIColor colorWithRed:122.0f/255.0f
                                                      green:199.0f/255.0f
                                                       blue:132.0f/255.0f
                                                      alpha:1.0f];
        onboardingVC.swipingEnabled = NO;
        onboardingVC.fontName = @"Helvetica-Light";
        onboardingVC.titleFontSize = 28;
        onboardingVC.bodyFontSize = 22;
        onboardingVC.topPadding = 20;
        onboardingVC.underIconPadding = 10;
        onboardingVC.underTitlePadding = 15;
        onboardingVC.bottomPadding = 20;
        
        [self presentViewController:onboardingVC animated:NO completion: nil];
        
        //this prevents the onboarding screen from poping up multiple times
        NSString *onboard = @"Yes";
        [[NSUserDefaults standardUserDefaults] setObject:onboard forKey:@"onboarded"];
        [[NSUserDefaults standardUserDefaults] synchronize];

    }

    
    //this will be the start date for the challenge
    NSDate *startingDate = self.startDate;
    startingDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"startDate"];
  
    DateModel *dateModelClass = [[DateModel alloc] init];

    //need to check if we already set the standard user default
    if(startingDate){
        //this finds the difference in the dates to see if there is a new day, using the datemodel object.
        double differenceInDate = [dateModelClass findChallengeDate:startingDate];

        //returns a dictionary which I can pull info from, the input is the differenceDate which shows how much of a difference there is from the START date and the CURRENT date
        NSDictionary *challenge = [dateModelClass showChallenge:differenceInDate];
        self.dayLabel.text = challenge[@"Day"];
        self.challengeLabel.text = challenge[@"Challenge"];

        self.dayLabel.textColor =  [UIColor colorWithRed:232.0f/255.0f
                                                   green:245.0f/255.0f
                                                    blue:233.0f/255.0f
                                                   alpha:1.0f];
        self.challengeLabel.textColor =  [UIColor colorWithRed:232.0f/255.0f
                                                         green:245.0f/255.0f
                                                          blue:233.0f/255.0f
                                                         alpha:1.0f];
    }
    else {
        //set the start date for the challenge, and save to user default
        startingDate = [dateModelClass getDate];
        [[NSUserDefaults standardUserDefaults] setObject:startingDate forKey:@"startDate"];
        
    
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    
    
    
    //need to check if favorite button should be active
    NSArray *favorites = [[NSUserDefaults standardUserDefaults] objectForKey:@"favorites"];
    int count = [favorites count];
    for (int i=0; i < count; i++) {
        if([self.dayLabel.text isEqualToString:favorites[i][@"Day"]])
        {
            [self.heartButton setBackgroundImage:[UIImage imageNamed:@"filledHeart"] forState:UIControlStateDisabled];
            self.heartButton.enabled = NO;
        }
        else {
            
            self.heartButton.enabled = YES;
        }
    }
    
    NSArray *completed = [[NSUserDefaults standardUserDefaults] objectForKey:@"completed"];
    int countForCompleted = [completed count];
    for (int i=0; i < countForCompleted; i++) {
        if([self.dayLabel.text isEqualToString:completed[i][@"Day"]])
        {
            [self.uncheckedButton setBackgroundImage:[UIImage imageNamed:@"ChallengeCounter"] forState:UIControlStateDisabled];
            self.uncheckedButton.enabled = NO;
        }
        else {
            self.uncheckedButton.enabled = YES;
        }
    }


}



- (IBAction)favoriteButton:(id)sender {
    [self.heartButton setBackgroundImage:[UIImage imageNamed:@"filledHeart"] forState:UIControlStateDisabled];
    self.heartButton.enabled = NO;
    
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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //changing the background of unchecked button to signify its completed
    [self.uncheckedButton setBackgroundImage:[UIImage imageNamed:@"ChallengeCounter"] forState:UIControlStateDisabled];
    self.uncheckedButton.enabled = NO;
  
    //need to save to user defaults counter
    NSInteger userCompletedChallengesCounter = [defaults integerForKey:@"counter"];
    userCompletedChallengesCounter++;
    [defaults setInteger:userCompletedChallengesCounter forKey:@"counter"];
    [defaults synchronize];
    self.challengeCounter.text = [NSString stringWithFormat:@"%d", userCompletedChallengesCounter];
    

    //need to save in user defaults that this person completed these challenges
    NSMutableArray *completedLoaded = [defaults objectForKey:@"completed"];
    
    NSDictionary *completedDict = [NSDictionary dictionaryWithObjectsAndKeys:
                         self.dayLabel.text, @"Day",
                         self.challengeLabel.text, @"Challenge",
                         nil];
    
    
    NSMutableArray *completedArray = [NSMutableArray array];
    
    if (completedLoaded) {
        completedArray = [[NSMutableArray alloc] initWithArray:completedLoaded];
    } else {
        completedArray = [[NSMutableArray alloc] init];
    }
    
    
    [completedArray addObject:completedDict];
    [defaults setObject:completedArray forKey:@"completed"];
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
