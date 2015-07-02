//
//  NSString+FormValidation.m
//  Rival
//
//  Created by Andrei on 7/2/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "NSString+FormValidation.h"

@implementation NSString (FormValidation)

- (BOOL)isValidEmail {
    NSString *regex = @"[^@]+@[A-Za-z0-9.-]+\\.[A-Za-z]+";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailPredicate evaluateWithObject:self];
}

- (BOOL)isValidPassword {
    return (self.length >= 5);
}

- (BOOL)isValidName {
    return (self.length >= 1);
}



@end
