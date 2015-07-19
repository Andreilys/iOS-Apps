//
//  DetailedViewController.m
//  brainplus
//
//  Created by Andrei on 7/17/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "DetailedViewController.h"
#import "Parse/Parse.h"


@interface DetailedViewController ()

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFQuery *query = [PFQuery queryWithClassName:@"Nootropic"];
    
    //I basically need to get the name from the nootropicstableviewcontroller, by checking which row was selected
    [query whereKey:@"Name" equalTo:self.nootropicName];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // Load the objects from the name
            for (PFObject *object in objects) {
                NSLog(@"Dosage Value: %@", object[@"Dosage"]);
                self.nameValue.text = object[@"Name"];
                self.dosageValue.text = object[@"Dosage"];
                self.typeValue.text = object[@"Type"];
                self.descriptionValue.text = object[@"Description"];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    //finding the detailed info
    
}

- (IBAction)favoriteButton:(id)sender {
    //need to query object to save the votevalue in Parse
    PFQuery *query = [PFQuery queryWithClassName:@"Nootropic"];
    [query whereKey:@"Name" equalTo:self.nootropicName];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects){
                if ([object[@"Favorite"]  isEqual: @"True"]) {
                    object[@"Favorite"] = @"False";
                    [object saveInBackground];
                }
                else {
                    object[@"Favorite"] = @"True";
                    [object saveInBackground];
                }
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}


- (IBAction)doneButtonPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;
{
    if (item.tag == 1){
        [self performSegueWithIdentifier:@"showFavorites" sender:self];
    }
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
