//
//  NSString+FormValidation.h
//  Rival
//
//  Created by Andrei on 7/2/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FormValidation)

- (BOOL)isValidEmail;
- (BOOL)isValidPassword;
- (BOOL)isValidName;

@end
