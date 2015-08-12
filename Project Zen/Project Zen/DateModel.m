//
//  DateModel.m
//  Project Zen
//
//  Created by Andrei on 8/4/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "DateModel.h"
#import "ViewController.h"

@implementation DateModel
{
    NSDate *startDate;
    double differenceInDate;
 }

//gets the date for the start
-(NSDate *)getDate
{
    NSDate* date = [NSDate date];
    return date;
}

//Returns the difference between the START date, and the CURRENT date, the input is the STARTINGDATE which is pulled from user preferences in viewcontroller.h
-(double)findChallengeDate:(NSDate*)startingDate
{
    

    //testing purposes
//    int daysToAdd = 8;
//    NSDate *newDate1 = [startingDate dateByAddingTimeInterval:60*60*24*daysToAdd];
//    
      //THIS IS ONLY FOR TESTING PURPOSES, NEWDATE1 SHOULD BE SWITCHED TO CURRENT DATE
    differenceInDate = [[NSDate date] timeIntervalSinceDate: startingDate]/(60*60*24);
   
    return differenceInDate;
  }


-(NSDictionary *)showChallenge:(double)difference
{
    
#pragma mark Challenges #1-10
    if (difference < 1) {
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 1:", @"Day",
                                       @"Pause and take a deep breath", @"Challenge",
                                       nil];
        return nextChallenge;
    } else if (difference < 2){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Day 2:", @"Day",
                                       @"Admire 5 trees today", @"Challenge",
                             nil];
        return nextChallenge;
    }
    else if (difference < 3){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 3:", @"Day",
                                       @"Donate 30mins of time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
    }
    else if (difference < 4){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 4:", @"Day",
                                       @" Give a stranger a compliment", @"Challenge",
                                       nil];
        return nextChallenge;

    }else if (difference < 5){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 5:", @"Day",
                                       @"Draw a flower", @"Challenge",
                                       nil];
        return nextChallenge;

    }
    else if (difference < 6){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 6:", @"Day",
                                       @"Write a poem", @"Challenge",
                                       nil];
        return nextChallenge;

    }else if (difference < 7){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 7:", @"Day",
                                       @"Make peace with an enemy", @"Challenge",
                                       nil];
        return nextChallenge;

    }

    else if (difference < 8){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 8:", @"Day",
                                       @"Do something that scares you", @"Challenge",
                                       nil];
        return nextChallenge;

    }else if (difference < 9){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 9:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
#pragma mark Challenges #10-20
    } else if (difference < 10){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 10:", @"Day",
                                       @"Smile at 5 strangers", @"Challenge",
                                       nil];
        return nextChallenge;
        
    } else if (difference < 11){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 11:", @"Day",
                                       @"Give someone a hug", @"Challenge",
                                       nil];
        return nextChallenge;
        
    } else if (difference < 12){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 12:", @"Day",
                                       @"Avoid social media today", @"Challenge",
                                       nil];
        return nextChallenge;}
    else if (difference < 13){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 13:", @"Day",
                                       @"Laugh enthusiastically", @"Challenge",
                                       nil];
        return nextChallenge;
    }
    else if (difference < 14){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 14:", @"Day",
                                       @"Smell a flower", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 15){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 15:", @"Day",
                                       @"Eat mindfully, savoring the taste", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    else if (difference < 16){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 16:", @"Day",
                                       @"While walking, feel the soles of your feet", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 17){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 17:", @"Day",
                                       @"Meditate under a tree", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    
    else if (difference < 18){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 18:", @"Day",
                                       @"Spend the day without Internet", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 19){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 19:", @"Day",
                                       @"Contemplate your mortality", @"Challenge",
                                       nil];
        return nextChallenge;
        
    } else if (difference < 20){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 20:", @"Day",
                                       @"Give back to your community", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    #pragma mark Challenges #20-31
    else if (difference < 21){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 21:", @"Day",
                                       @"Plant a tree", @"Challenge",
                                       nil];
        return nextChallenge;}
    else if (difference < 22){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 22:", @"Day",
                                       @"Water a garden", @"Challenge",
                                       nil];
        return nextChallenge;
    }
    else if (difference < 23){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 23:", @"Day",
                                       @"Wash your dishes mindfully", @"Challenge",
                                       nil];
        return nextChallenge;
    }
    else if (difference < 24){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 24:", @"Day",
                                       @"Eliminate clutter", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 25){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 25:", @"Day",
                                       @"Relinquish control", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    else if (difference < 26){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 26:", @"Day",
                                       @"Connect with Nature", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 27){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 27:", @"Day",
                                       @"Spend 5 minutes being grateful", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    
    else if (difference < 28){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 28:", @"Day",
                                       @"Practice self-compassion", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 29){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 29:", @"Day",
                                       @"Write a journal post", @"Challenge",
                                       nil];
        return nextChallenge;
        
    } else if (difference < 30){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 30:", @"Day",
                                       @"Notice 5 things, that go unnoticed", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }  else if (difference < 31){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 31:", @"Day",
                                       @"Show vulnerability in front of a group", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    //need to make an alert
    else if (difference <32){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congrats you made it!"
                                                        message:@"I hope that at the end of these 31 days you've found time to be more at peace with yourself."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
 



    NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"Day 1:", @"Day",
                                   @"Admire 9 Trees Today", @"Challenge",
                                   nil];
    return nextChallenge;


}


@end
