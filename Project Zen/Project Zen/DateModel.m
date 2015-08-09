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
    
    NSLog (@"start date: %@", startingDate);
    
    //testing purposes
    int daysToAdd = 8;
    NSDate *newDate1 = [startingDate dateByAddingTimeInterval:60*60*24*daysToAdd];
    
    NSLog(@"newdate: %@", newDate1);
    NSLog(@"current date: %@", [NSDate date]);
      //THIS IS ONLY FOR TESTING PURPOSES, NEWDATE1 SHOULD BE SWITCHED TO CURRENT DATE
    differenceInDate = [newDate1 timeIntervalSinceDate: startingDate]/(60*60*24);
    NSLog(@"differnece in date: %f", differenceInDate);

    return differenceInDate;
  }


-(NSDictionary *)showChallenge:(double)difference
{
    
#pragma mark Challenges #1-10
    if (difference < 1) {
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 1:", @"Day",
                                       @"Admire 5 Trees Today", @"Challenge",
                                       nil];
        return nextChallenge;
    } else if (difference < 2){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Day 2:", @"Day",
                             @"Call Someone and Tell Them You Appreciate Them", @"Challenge",
                             nil];
        return nextChallenge;
    }
    else if (difference < 3){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 3:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
    }
    else if (difference < 4){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 4:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;

    }else if (difference < 5){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 5:", @"Day",
                                       @"Meditate Under A Tree", @"Challenge",
                                       nil];
        return nextChallenge;

    }
    else if (difference < 6){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 6:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;

    }else if (difference < 7){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 7:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;

    }

    else if (difference < 8){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 8:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
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
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    } else if (difference < 11){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 11:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    } else if (difference < 12){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 12:", @"Day",
                                       @"Call Someone and Tell Them You Appreciate Them", @"Challenge",
                                       nil];
        return nextChallenge;}
    else if (difference < 13){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 13:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
    }
    else if (difference < 14){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 14:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 15){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 15:", @"Day",
                                       @"Meditate Under A Tree", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    else if (difference < 16){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 16:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 17){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 17:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    
    else if (difference < 18){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 18:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 19){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 19:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    } else if (difference < 20){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 20:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    #pragma mark Challenges #20-31
    else if (difference < 21){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 21:", @"Day",
                                       @"Call Someone and Tell Them You Appreciate Them", @"Challenge",
                                       nil];
        return nextChallenge;}
    else if (difference < 22){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 22:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
    }
    else if (difference < 23){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 23:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
    }
    else if (difference < 24){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 24:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 25){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 25:", @"Day",
                                       @"Meditate Under A Tree", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    else if (difference < 26){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 26:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 27){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 27:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    
    else if (difference < 28){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 28:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }else if (difference < 29){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 29:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    } else if (difference < 30){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 30:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }  else if (difference < 31){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 31:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
        
    }
    //need to make an alert
    else if (difference <32){
        
            }
 



    NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"Day 1:", @"Day",
                                   @"Admire 9 Trees Today", @"Challenge",
                                   nil];
    return nextChallenge;


}


@end
