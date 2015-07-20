//
//  NootropicTableViewController.m
//  brainplus
//
//  Created by Andrei on 7/17/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "NootropicTableViewController.h"
#import "Parse/Parse.h"
#import "DetailedViewController.h"
#import "CCell.h"

@interface NootropicTableViewController ()

@end

@implementation NootropicTableViewController
{
    NSMutableArray *nootropicsArray;
    NSMutableArray *nootropicsVoteValueArray;
    NSArray *sortedArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //I'm finding the object for social (this will have to adjust according to which button was pressed on home)
    PFQuery *query = [PFQuery queryWithClassName:@"Nootropic"];
    [query whereKey:@"Type" equalTo:@"Social"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //adding to the nootropics array
                NSSortDescriptor *sortDescriptor;
                sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"VoteValue"
                                                             ascending:NO];
                NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
                sortedArray = [objects sortedArrayUsingDescriptors:sortDescriptors];
            for (PFObject *object in sortedArray) {
                //if the object isn't already found in the array (aka the column) - this avoids duplicates
                if (![nootropicsArray containsObject:object[@"Name"]]) {
                    //check to see if it exists already
                    if(nootropicsArray){
                        [nootropicsArray addObject:object[@"Name"]];
                        [nootropicsVoteValueArray addObject:object[@"VoteValue"]];
                        [self.tableView reloadData];
                    }
                    else {
                        nootropicsArray = [NSMutableArray arrayWithObjects:object[@"Name"],nil];
                        nootropicsVoteValueArray = [NSMutableArray arrayWithObjects:object[@"VoteValue"],nil];
                        [self.tableView reloadData];
                    }
                    
                } else
                {
                    return;
                }
        
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    //this is to make sure that whenever the view appears it shows the new objects
    PFQuery *query = [PFQuery queryWithClassName:@"Nootropic"];
    [query whereKey:@"Type" equalTo:@"Social"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            NSSortDescriptor *sortDescriptor;
            sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"VoteValue"
                                                         ascending:NO];
            NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
            sortedArray = [objects sortedArrayUsingDescriptors:sortDescriptors];
            for (PFObject *object in sortedArray) {
                //avoids duplicates
                if (![nootropicsArray containsObject:object[@"Name"]]) {
                    if(nootropicsArray){
                        [nootropicsArray addObject:object[@"Name"]];
                        [nootropicsVoteValueArray addObject:object[@"VoteValue"]];
                        [self.tableView reloadData];
                    }
                    else {
                        nootropicsArray = [NSMutableArray arrayWithObjects:object[@"Name"],nil];
                        nootropicsVoteValueArray = [NSMutableArray arrayWithObjects:object[@"VoteValue"],nil];
                        [self.tableView reloadData];
                    }

                } else
                {
                    return;
                }
            }
        }
         else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [nootropicsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger newIndexPath = indexPath.row + 1;
    //create the cell
    CCell *cell = (CCell *)[tableView dequeueReusableCellWithIdentifier:@"CCell"];
    cell.tag = newIndexPath * 10000;
    cell.nameLabel.text = [nootropicsArray objectAtIndex:indexPath.row];
    //init cell with the values
    cell.voteValue.tag = newIndexPath *1000;
    //need to query array to get vote value for cell
    cell.voteValue.text = [NSString stringWithFormat:@"%@",[nootropicsVoteValueArray objectAtIndex:indexPath.row]];
    cell.upvoteButton.tag = newIndexPath;
    [cell.upvoteButton addTarget:self action:@selector(upVoteClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.downvoteButton.tag = newIndexPath*100;
    [cell.downvoteButton addTarget:self action:@selector(downVoteClicked:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)upVoteClicked:(UIButton *)upvote
{
    //This is the hack-iest thing ever. Basically, I get the tag value from the cell, call the cell, increase the votevalueint on this specific cell, and add it to the new label
    NSInteger cellValue = upvote.tag * 10000;
    CCell *cell = (CCell *)[self.view viewWithTag:cellValue];
    
    //need to query object to save the votevalue in Parse
    PFQuery *query = [PFQuery queryWithClassName:@"Nootropic"];
    [query whereKey:@"Name" equalTo:cell.nameLabel.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects){
                //need to get the vote value from the parse object
                NSInteger voteValue = [[object objectForKey:@"VoteValue"] integerValue];
                voteValue++;
                
                //saving the new vote value
                object[@"VoteValue"] = @(voteValue);
                [object saveInBackground];
                
                //displaying the new vote value
                NSInteger tagValue = upvote.tag*1000;
                UILabel *label = (UILabel *)[self.view viewWithTag:tagValue];
                label.text = [NSString stringWithFormat:@"%d", voteValue];
                upvote.enabled = NO;
                cell.downvoteButton.enabled = YES;

            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

-(void)downVoteClicked:(UIButton *)downvote
{
    //see above explanation
    NSInteger cellValue = downvote.tag * 100;
    CCell *cell = (CCell *)[self.view viewWithTag:cellValue];
    
    //need to query object to save the votevalue in Parse
    PFQuery *query = [PFQuery queryWithClassName:@"Nootropic"];
    [query whereKey:@"Name" equalTo:cell.nameLabel.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects){
                //need to get the vote value from the parse object
                NSInteger voteValue = [[object objectForKey:@"VoteValue"] integerValue];
                voteValue--;
                
                //saving the new vote value
                object[@"VoteValue"] = @(voteValue);
                [object saveInBackground];
                
                //displaying the new vote value
                NSInteger tagValue = downvote.tag*10;
                UILabel *label = (UILabel *)[self.view viewWithTag:tagValue];
                label.text = [NSString stringWithFormat:@"%d", voteValue];
                downvote.enabled = NO;
                cell.upvoteButton.enabled = YES;
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//segues into the new view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"moreDetails"]) {
    
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        NSInteger rowSelected = selectedIndexPath.row;
        DetailedViewController *controller = (DetailedViewController *)segue.destinationViewController;
        self.nootropicValue = [nootropicsArray objectAtIndex:rowSelected];
        controller.nootropicName = self.nootropicValue;
    }
}





@end
