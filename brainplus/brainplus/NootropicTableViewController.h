//
//  NootropicTableViewController.h
//  brainplus
//
//  Created by Andrei on 7/17/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NootropicTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, UITabBarControllerDelegate>

@property (weak, nonatomic) NSString *nootropicValue;
@property (nonatomic) NSString *nootropicTypeValue;

@end
