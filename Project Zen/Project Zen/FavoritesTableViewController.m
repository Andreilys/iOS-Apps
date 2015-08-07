//
//  FavoritesTableViewController.m
//  Project Zen
//
//  Created by Andrei on 8/3/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "FavoritesTableViewController.h"
#import "FavoriteCell.h"

@interface FavoritesTableViewController ()

@end

@implementation FavoritesTableViewController
{
    NSMutableArray *favoritesArray;
    NSMutableArray *newFavoritesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //since nsuserdefaults returns an immutable type, it is important to create a mutable copy
    favoritesArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"favorites"] mutableCopy];
    
    
     // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [favoritesArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 79;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = indexPath.row;
    //create the cell
    FavoriteCell *cell = (FavoriteCell *)[tableView dequeueReusableCellWithIdentifier:@"FavoriteCell"];
    cell.dayValue.text = favoritesArray[row][@"Day"];
    cell.challengeValue.text = favoritesArray[row][@"Challenge"];
    cell.challengeValue.textColor =  [UIColor colorWithRed:232.0f/255.0f
                                                     green:245.0f/255.0f
                                                      blue:233.0f/255.0f
                                                     alpha:1.0f];
    cell.dayValue.textColor =  [UIColor colorWithRed:232.0f/255.0f
                                          green:245.0f/255.0f
                                           blue:233.0f/255.0f
                                          alpha:1.0f];
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //removing object from favorites index
    [favoritesArray removeObjectAtIndex:indexPath.row];
    //adding favorites array to newfavorites array
    newFavoritesArray = favoritesArray;

    //removing all account of favorites from nsuserdefaults
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"favorites"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //new array being added back to user defaults
    [[NSUserDefaults standardUserDefaults] setObject: newFavoritesArray forKey: @"favorites"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    // Remove the row from data model
    
    
    
    // Request table view to reload
    [tableView reloadData];
}


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
