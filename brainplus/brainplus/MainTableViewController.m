//
//  MainTableViewController.m
//  brainplus
//
//  Created by Andrei on 7/22/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "MainTableViewController.h"
#import "TypeViewCell.h"
#import "NootropicTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    
    return (screenHeight - 64)/4;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int newIndexPath = (int)indexPath.row;
    TypeViewCell *cell = (TypeViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TypeViewCell"];
    if (newIndexPath == 0) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.image = [UIImage imageNamed: @"Social.png"];
        [cell setBackgroundView:imageV];
    } else if(newIndexPath == 1){
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.image = [UIImage imageNamed: @"Relax.png"];
        [cell setBackgroundView:imageV];
    }else if(newIndexPath == 2){
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.image = [UIImage imageNamed: @"Work.png"];
        [cell setBackgroundView:imageV];
    }else if(newIndexPath == 3){
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.image = [UIImage imageNamed: @"Active.png"];
        [cell setBackgroundView:imageV];
    }
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showType"]) {
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        NSInteger rowSelected = selectedIndexPath.row;
        NootropicTableViewController *controller = (NootropicTableViewController *)segue.destinationViewController;
        switch (rowSelected % 10) {
            case 0:
                controller.nootropicTypeValue = @"Social";
                break;
            case 1:
                controller.nootropicTypeValue = @"Relax";
                break;
            case 2:
                controller.nootropicTypeValue = @"Work";
                break;
            case 3:
                controller.nootropicTypeValue = @"Active";
                break;
        }}
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
