//
//  ViewController.m
//  localNotifications
//
//  Created by Andrei on 8/8/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSDate *Date;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)datePicker:(UIDatePicker *)sender {
    Date = sender.date;
}
- (IBAction)setNotificaton:(UIButton *)sender {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = Date;
    localNotification.alertBody = [NSString stringWithFormat:@"Alert Fired at %@", Date];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

@end
