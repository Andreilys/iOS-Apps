//
//  ViewController.h
//  MemTrack
//
//  Created by Andrei on 6/29/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "questionViewModel.h"

@interface ViewController : UIViewController <questionDelegate>
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@end

