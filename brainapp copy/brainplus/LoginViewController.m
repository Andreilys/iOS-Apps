//
//  LoginViewController.m
//  brainplus
//
//  Created by Andrei on 7/26/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(id)sender {
    //launch the validate form to make sure what the user entered makes sense
    [_spinner startAnimating];
    [_button setEnabled:NO];
    [_button setTitle: @"" forState: UIControlStateDisabled];
    
    [PFUser logInWithUsernameInBackground:self.userTextField.text
                                 password:self.passwordTextField.text block:^(PFUser *user, NSError *error)
     
     {
         if (!error) {
             [_spinner stopAnimating];
             [_button setEnabled:YES];
             [self performSegueWithIdentifier:@"showBrainPlus" sender:nil];
         } else {
            [_spinner stopAnimating];
            [_button setEnabled:YES];
             [[[UIAlertView alloc] initWithTitle:nil message:@"Username or Password is incorrect" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil] show];
             
         }
     }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
