//
//  settingNotificationsModel.m
//  Project Zen
//
//  Created by Andrei on 8/6/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "settingNotificationsModel.h"
#import "UIKit/UIKit.h"
#import "DateModel.h"
#import "ViewController.h"

@implementation settingNotificationsModel

-(void)setNotifications{
    // Schedule the notification, need to check if current iOS device is above 8.0
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    
    
    //setting night notification

    NSDateComponents *currentDate = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];


    //setting day notification
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:[currentDate year]];
    [comps setMonth:[currentDate month]];
    [comps setDay:[currentDate day]];
    [comps setHour:8];
    [comps setMinute:00];
    [comps setTimeZone:[NSTimeZone systemTimeZone]];
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *setTime = [cal dateFromComponents:comps];
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = setTime;
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotif.alertBody = @"See what challenge awaits you today on your journey to enlightenment!";
    // Set the action button
    localNotif.alertAction = @"View";
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
    localNotif.repeatInterval = NSCalendarUnitDay;
    
    // Schedule the notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];

    
    
//setting night notification, infinite repeat, always at 8pm
    NSDateComponents *compsNight = [[NSDateComponents alloc] init];
    [compsNight setYear:[currentDate year]];
    [compsNight setMonth:[currentDate month]];
    [compsNight setDay:[currentDate day]];
    [compsNight setHour:20];
    [compsNight setMinute:00];
    [compsNight setTimeZone:[NSTimeZone systemTimeZone]];
    NSCalendar *calNight = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *setTimeNight = [calNight dateFromComponents:compsNight];
    
    UILocalNotification *localNotifNight = [[UILocalNotification alloc] init];
    if (localNotifNight == nil)
        return;
    localNotifNight.fireDate = setTimeNight;
    localNotifNight.timeZone = [NSTimeZone defaultTimeZone];
    
    // Notification details
    localNotifNight.alertBody = @"How did it go today? Celebrate your success by recording it, and observe as the presence within you grows.";
    // Set the action button
    localNotifNight.alertAction = @"View";
    
    localNotifNight.soundName = UILocalNotificationDefaultSoundName;
    localNotifNight.applicationIconBadgeNumber = 1;
    localNotifNight.repeatInterval = NSCalendarUnitDay;
    
    // Schedule the notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotifNight];
    
//    This is for testing purposes, don't think I need anymore
    NSLog(@"%@", localNotifNight);
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *eventArray = [app scheduledLocalNotifications];
    
    NSLog(@"%@", eventArray);
    
    
    NSLog(@"setting notifcations is working");

}

@end
