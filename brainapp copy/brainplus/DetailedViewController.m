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
{
    NSString *detailNameValue;
    NSString *detailDosageValue;
    NSString *detailTypeValue;
    NSString *detailDescriptionValue;
    NSString *detailSourceValue;
    NSString *detailVoteValue;
}

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
                self.nameValue.text = object[@"Name"];
                self.dosageValue.text = object[@"Dosage"];
                self.typeValue.text = object[@"Type"];
                self.descriptionValue.text = object[@"Description"];
                self.sourceValue.text = object[@"Source"];
                
                //need to save to the nss strings so that when fav button is pressed, we can assign them
                detailNameValue = self.nameValue.text;
                detailDosageValue = self.dosageValue.text;
                detailTypeValue = self.typeValue.text;
                detailDescriptionValue = self.descriptionValue.text;
                detailSourceValue = self.sourceValue.text;
                detailVoteValue = object[@"VoteValue"];
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
    PFQuery *query = [PFQuery queryWithClassName:@"userFavorites"];
    [query whereKey:@"Author" equalTo:[PFUser currentUser]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        //this is for the case when user has no objects saved already to favorites
        if([objects count] == 0){
            PFObject *userFavorites = [PFObject objectWithClassName:@"userFavorites"];
            userFavorites[@"Type"] = detailTypeValue;
            userFavorites[@"Name"] = detailNameValue;
            userFavorites[@"Dosage"] = detailDosageValue;
            userFavorites[@"Description"] = detailDescriptionValue;
            userFavorites[@"VoteValue"] = detailVoteValue;
            userFavorites[@"Source"] = detailSourceValue;
            userFavorites[@"Author"] = [PFUser currentUser];
            [userFavorites saveInBackground];
        }
        
        NSObject *lastObject = [objects lastObject];
        if (!error) {
            for (PFObject *object in objects){
                if (object == lastObject) {
                    //this checks to see if we already have the object in the userFavorites column
                    if ([object[@"Name"] isEqualToString:self.nameValue.text]) {
                        [object deleteInBackground];
                        NSLog(@"delete completed FINAL");
                    }
                    else {
                        //saving the object to Parse
                        PFObject *userFavorites = [PFObject objectWithClassName:@"userFavorites"];
                        userFavorites[@"Type"] = detailTypeValue;
                        userFavorites[@"Name"] = detailNameValue;
                        userFavorites[@"Dosage"] = detailDosageValue;
                        userFavorites[@"Description"] = detailDescriptionValue;
                        userFavorites[@"VoteValue"] = detailVoteValue;
                        userFavorites[@"Source"] = detailSourceValue;
                        userFavorites[@"Author"] = [PFUser currentUser];
                        [userFavorites saveInBackground];
                    }
                }
                else if ([object[@"Name"] isEqualToString:self.nameValue.text]) {
                    [object deleteInBackground];
                    NSLog(@"delete completed!!");
                    break;
                }
            }
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
