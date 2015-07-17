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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //I'm finding the object for social (this will have to adjust according to which button was pressed on home)
    PFQuery *query = [PFQuery queryWithClassName:@"Nootropic"];
    [query whereKey:@"Type" equalTo:@"Social"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //adding to the nootropics array
            for (PFObject *object in objects) {
                if (![nootropicsArray containsObject:object[@"Name"]]) {
                    if(nootropicsArray){
                        [nootropicsArray addObject:object[@"Name"]];
                        [self.tableView reloadData];
                    }
                    else {
                        nootropicsArray = [NSMutableArray arrayWithObjects:object[@"Name"],nil];
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
            // The find succeeded.
            // Do something with the found objects
            for (PFObject *object in objects) {
                if (![nootropicsArray containsObject:object[@"Name"]]) {
                    if(nootropicsArray){
                        [nootropicsArray addObject:object[@"Name"]];
                        [self.tableView reloadData];
                    }
                    else {
                        nootropicsArray = [NSMutableArray arrayWithObjects:object[@"Name"],nil];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [nootropicsArray count];
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    static NSString *simpleTableIdentifier = @"SimpleTableCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    }
//    cell.textLabel.text = [nootropicsArray objectAtIndex:indexPath.row];
//    return cell;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger newIndexPath = indexPath.row + 1;
    //create the cell
    CCell *cell = (CCell *)[tableView dequeueReusableCellWithIdentifier:@"CCell"];
    cell.tag = newIndexPath * 10000;
    cell.nameLabel.text = [nootropicsArray objectAtIndex:indexPath.row];
    //init cell with the values
    cell.voteValue.tag = newIndexPath *1000;
    cell.voteValue.text = @"0";
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
    cell.voteValueInt++;
    NSInteger tagValue = upvote.tag*1000;
    UILabel *label = (UILabel *)[self.view viewWithTag:tagValue];
    label.text = [NSString stringWithFormat:@"%d", cell.voteValueInt];
    upvote.enabled = NO;
}

-(void)downVoteClicked:(UIButton *)downvote
{
    //see above explanation
    NSInteger cellValue = downvote.tag * 100;
    CCell *cell = (CCell *)[self.view viewWithTag:cellValue];
    cell.voteValueInt--;
    NSInteger tagValue = downvote.tag*10;
    UILabel *label = (UILabel *)[self.view viewWithTag:tagValue];
    label.text = [NSString stringWithFormat:@"%d", cell.voteValueInt];
    downvote.enabled = NO;
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
