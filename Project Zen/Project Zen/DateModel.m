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

//Basically I want to set the starting date for the function
-(double)findChallengeDate:(NSDate*)startingDate
{


    //testing purposes
    NSDate* date = [NSDate date];
    int daysToAdd = 2;
    NSDate *newDate1 = [date dateByAddingTimeInterval:60*60*24*daysToAdd];
    
    
    NSLog (@"start date: %@", startingDate);
    NSLog(@"now date: %@", [NSDate date]);
    
    differenceInDate = [newDate1 timeIntervalSinceDate:startingDate]/(60*60*24);
    return differenceInDate;
}

-(NSDictionary *)showChallenge:(double)differenceInDate
{
    int difference = (int)differenceInDate;
    
    
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
        return nextChallenge;}
    else if (difference < 3){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 3:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;
    }
    else if (difference < 4){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 3:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;

    }else if (difference < 5){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 3:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;

    }
    else if (difference < 6){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 3:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;

    }else if (difference < 7){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 3:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;

    }

    else if (difference < 8){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 3:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;

    }else if (difference < 9){
        NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                       @"Day 3:", @"Day",
                                       @"Donate your time to someone else", @"Challenge",
                                       nil];
        return nextChallenge;

    }


    NSDictionary *nextChallenge = [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"Day 1:", @"Day",
                                   @"Admire 5 Trees Today", @"Challenge",
                                   nil];
    return nextChallenge;


}


@end
