//
//  DetailedViewController.h
//  brainplus
//
//  Created by Andrei on 7/17/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedViewController : UIViewController

@property (nonatomic) NSString *nootropicName;
@property (weak, nonatomic) IBOutlet UILabel *nameValue;
@property (weak, nonatomic) IBOutlet UILabel *dosageValue;
@property (weak, nonatomic) IBOutlet UILabel *typeValue;
@property (weak, nonatomic) IBOutlet UITextView *descriptionValue;

@end
