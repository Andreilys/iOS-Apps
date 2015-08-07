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
{
    int counter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
    } else{
        //set the start date for the challenge, and save to user default
        startingDate = [dateModelClass getDate];
        [[NSUserDefaults standardUserDefaults] setObject:startingDate forKey:@"startDate"];
        
    
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        NSLog(@"damn");
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
