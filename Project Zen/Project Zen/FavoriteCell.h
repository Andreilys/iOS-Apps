//
//  FavoriteCell.h
//  Project Zen
//
//  Created by Andrei on 8/3/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *filledHeart;
@property (weak, nonatomic) IBOutlet UILabel *dayValue;
@property (weak, nonatomic) IBOutlet UILabel *challengeValue;

@end
