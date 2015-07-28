//
//  CCell.h
//  brainplus
//
//  Created by Andrei on 7/17/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *voteValue;
@property (weak, nonatomic) IBOutlet UIButton *upvoteButton;
@property (weak, nonatomic) IBOutlet UIButton *downvoteButton;
@property (nonatomic) NSInteger voteValueInt;

@end
