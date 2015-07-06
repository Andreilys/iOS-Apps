//
//  ViewController.m
//  habitChecker
//
//  Created by Andrei on 7/5/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "ViewController.h"
#import "UIKit/UIKit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *whiteButton1;
@property (weak, nonatomic) IBOutlet UIButton *whiteButton2;
@property (weak, nonatomic) IBOutlet UIButton *whiteButton3;
@property (weak, nonatomic) IBOutlet UIButton *whiteButton4;

@end

@implementation ViewController
{
    int count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)turnGreen:(id)sender {
    UIButton *button = sender;
    button.backgroundColor = [UIColor greenColor];
    count++;
    if (count == 4) {
        NSLog(@"works");
    }
}

- (IBAction)reset:(id)sender {
    _whiteButton1.backgroundColor = [UIColor whiteColor];
    _whiteButton2.backgroundColor = [UIColor whiteColor];
    _whiteButton3.backgroundColor = [UIColor whiteColor];
    _whiteButton4.backgroundColor = [UIColor whiteColor];
    count = 0;
}



@end
