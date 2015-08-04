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

    NSLog (@"start date: %@", startingDate);
    NSLog(@"now date: %@", [NSDate date]);
    
    NSDate* date = [NSDate date];
    differenceInDate = [date timeIntervalSinceDate:startingDate]/(60*60*24);
    return differenceInDate;
}

-(void)showChallenge:(double)differenceInDate
{
    
}


@end
