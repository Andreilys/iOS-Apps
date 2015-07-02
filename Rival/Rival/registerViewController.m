//
//  registerViewController.m
//  Rival
//
//  Created by Andrei on 7/2/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "registerViewController.h"
#import "NSString+FormValidation.h"
#import <Parse/Parse.h>


@implementation registerViewController

- (IBAction)registerButtonPressed:(id)sender {
    NSString *errorMessage = [self validateForm];
    if (errorMessage) {
        [[[UIAlertView alloc] initWithTitle:nil message:errorMessage delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
        return;
    }
    
    NSDictionary *formValues = @{ @"username" : self.userTextField.text,
                                  @"email" : self.emailTextfield.text,
                                  @"password" : self.passwordTextField.text};
    
    
    //adding the user to the parse database
    PFObject *user = [PFObject objectWithClassName:@"User"];
    user[@"username"] = (@"%@", formValues[@"username"]);
    user[@"email"] = (@"%@", formValues[@"email"]);
    user[@"password"] = (@"%@", formValues[@"password"]);
    [user saveInBackground];
    
    
    [self performSegueWithIdentifier:@"newView" sender:self];
    
}

- (NSString *)validateForm {
    NSString *errorMessage;
    UITextField *viewWithError;
    
    if (![self.userTextField.text isValidName]){
        viewWithError = self.userTextField;
        errorMessage = @"Please enter a valid username";
    }   else if (![self.emailTextfield.text isValidEmail]){
        viewWithError = self.emailTextfield;
        errorMessage = @"Please enter a valid email address";
    } else if (![self.passwordTextField.text isValidPassword]){
        viewWithError = self.passwordTextField;
        viewWithError = self.passwordTextField2;
        errorMessage = @"Please enter a valid password longer than 5 characters.";
    } else if (![self.passwordTextField.text isEqualToString:self.passwordTextField2.text])
    {
        viewWithError = self.passwordTextField;
        viewWithError = self.passwordTextField2;
        errorMessage = @"Please double check both password fields.";
    }
    // reset the icon views
    self.userTextField.rightView = nil;
    self.emailTextfield.rightView = nil;
    self.passwordTextField.rightView = nil;
    
    if (viewWithError) {
        [self changeViewToInvalid:viewWithError];
    }
    return errorMessage;
}



- (void)changeViewToInvalid:(UITextField *)view {
    if (view){
        
        UIImageView *errorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Failure"]];
        errorImageView.frame = CGRectMake(5, (view.frame.size.height - 20) / 2, 20, 20);
        errorImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        view.rightView = errorImageView;
        view.rightViewMode = UITextFieldViewModeAlways;
    }
}@end
