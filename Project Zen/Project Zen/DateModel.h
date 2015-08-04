//
//  DateModel.h
//  Project Zen
//
//  Created by Andrei on 8/4/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateModel : NSObject

-(NSDate *) getDate;
-(double)findChallengeDate:(NSDate *)startingDate;
@property (nonatomic) NSDate *date;
-(void)showChallenge:(double)differenceInDate;


@end
