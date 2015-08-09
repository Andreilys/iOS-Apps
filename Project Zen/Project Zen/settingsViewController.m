//
//  settingsViewController.m
//  Project Zen
//
//  Created by Andrei on 8/9/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "settingsViewController.h"

@interface settingsViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *morningNotifactionSetter;
@property (weak, nonatomic) IBOutlet UIButton *morningNotificationButton;
@property (weak, nonatomic) IBOutlet UISwitch *morningNotificationSwitch;
@property (weak, nonatomic) IBOutlet UIDatePicker *eveningNotificationSetter;
@property (weak, nonatomic) IBOutlet UISwitch *eveningNotificationSwitch;
@property (weak, nonatomic) IBOutlet UIButton *eveningNotificationButton;

@end

@implementation settingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)morningNotification:(UISwitch *)sender {
    
    if (!self.morningNotificationSwitch.on) {
        self.morningNotifactionSetter.enabled = NO;
        self.morningNotificationButton.enabled = NO;
        [self.morningNotificationButton setTitleColor:[UIColor grayColor] forState: UIControlStateDisabled];
       } else {
        self.morningNotifactionSetter.enabled = YES;
        self.morningNotificationButton.enabled = YES;
    }
}
- (IBAction)changeMorningNotification:(id)sender {
}



- (IBAction)eveningNotification:(UISwitch *)sender {
    if (!self.eveningNotificationSwitch.on) {
        self.eveningNotificationSetter.enabled = NO;
        self.eveningNotificationButton.enabled = NO;
        [self.eveningNotificationButton setTitleColor:[UIColor grayColor] forState: UIControlStateDisabled];
    } else {
        self.eveningNotificationSetter.enabled = YES;
        self.eveningNotificationButton.enabled = YES;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
