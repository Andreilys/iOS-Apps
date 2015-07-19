//
//  FavTableViewController.m
//  brainplus
//
//  Created by Andrei on 7/19/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "FavTableViewController.h"
#import "Parse/Parse.h"
#import "CCell.h"
#import "DetailedViewController.h"

@interface FavTableViewController ()

@end

@implementation FavTableViewController
{
    NSMutableArray *nootropicsArray;
    NSMutableArray *nootropicsVoteValueArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //I'm finding the object for social (this will have to adjust according to which button was pressed on home)
    PFQuery *query = [PFQuery queryWithClassName:@"Nootropic"];
    [query whereKey:@"Favorite" equalTo:@"True"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //adding to the nootropics array
            for (PFObject *object in objects) {
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
    [query whereKey:@"Favorite" equalTo:@"True"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects) {
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
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [nootropicsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //create the cell
    CCell *cell = (CCell *)[tableView dequeueReusableCellWithIdentifier:@"CCell"];
    cell.nameLabel.text = [nootropicsArray objectAtIndex:indexPath.row];
    //init cell with the values
    //need to query array to get vote value for cell
    cell.voteValue.text = [NSString stringWithFormat:@"%@",[nootropicsVoteValueArray objectAtIndex:indexPath.row]];
    cell.downvoteButton.enabled = NO;
    cell.upvoteButton.enabled = NO;
   return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//segues into the new view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"works now");
    if ([segue.identifier isEqualToString:@"moreDetails"]) {
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        NSInteger rowSelected = selectedIndexPath.row;
        DetailedViewController *controller = (DetailedViewController *)segue.destinationViewController;
        controller.nootropicName = [nootropicsArray objectAtIndex:rowSelected];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return YES; // So that I can determine whether or not to perform the segue based on app logic
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
