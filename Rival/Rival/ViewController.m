//
//  ViewController.m
//  Rival
//
//  Created by Andrei on 7/2/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "NSString+FormValidation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginButtonPressed:(id)sender {
    NSString *errorMessage = [self validateForm];
    if (errorMessage) {
        [[[UIAlertView alloc] initWithTitle:nil message:errorMessage delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
        return;
    }
    
    

    
    [self performSegueWithIdentifier:@"showRivals" sender:self];
    
}

- (NSString *)validateForm {
    NSString *errorMessage;
    NSString *user = self.userTextField.text;
    NSString *password = self.passwordTextField.text;
    PFQuery *query = [PFQuery queryWithClassName:@"user"];
    [query whereKey:@"username" equalTo:user];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    if ([self.userTextField.text isValidName]){
        errorMessage = @"Please enter a valid username";
    } else if (![self.passwordTextField.text isValidPassword]){
        errorMessage = @"Please enter a valid password longer than 5 characters.";
    }
    
    
return errorMessage;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
