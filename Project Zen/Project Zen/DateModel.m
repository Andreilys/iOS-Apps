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
    int daysToAdd = 4;
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
                                   @"Admire 9 Trees Today", @"Challenge",
                                   nil];
    return nextChallenge;


}


@end
