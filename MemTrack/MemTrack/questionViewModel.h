//
//  questionViewModel.h
//  MemTrack
//
//  Created by Andrei on 6/29/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol questionDelegate <NSObject>
@optional
- (void) print;
@end

@interface questionViewModel : NSObject

@property (nonatomic,strong) id delegate;
@property (nonatomic) NSString *question;
@property (nonatomic) NSString *answer;
@property (nonatomic) NSArray *questionArray;

-(void)printquestions; // Instance method

@end
