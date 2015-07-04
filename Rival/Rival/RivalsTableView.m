//
//  RivalsTableView.m
//  Rival
//
//  Created by Andrei on 7/4/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "RivalsTableView.h"
#import <Parse/Parse.h>

@implementation RivalsTableView
- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
