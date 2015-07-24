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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

// Do any additional setup after loading the view, typically from a nib.
}


//whenever login button is pressed
- (IBAction)loginButtonPressed:(id)sender {
    //launch the validate form to make sure what the user entered makes sense
    [_spinner startAnimating];
    [PFUser logInWithUsernameInBackground:self.userTextField.text
                                 password:self.passwordTextField.text block:^(PFUser *user, NSError *error)
     
     {
         if (!error) {
             [_spinner stopAnimating];
             [self performSegueWithIdentifier:@"showBrainPlus" sender:nil];
         } else {
             [[[UIAlertView alloc] initWithTitle:nil message:@"Username or Password is incorrect" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
             
         }
     }];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
