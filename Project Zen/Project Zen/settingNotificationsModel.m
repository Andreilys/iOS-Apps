//
//  settingNotificationsModel.m
//  Project Zen
//
//  Created by Andrei on 8/6/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "settingNotificationsModel.h"
#import "UIKit/UIKit.h"

@implementation settingNotificationsModel

-(void)setNotifications{
    
    NSLog(@"setting notifcations is working");
    // Schedule the notification
    //-- Set Notification
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
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:1];
    [comps setHour:8];
    [comps setMinute:00];
    NSCalendar *gregorian = [[NSCalendar alloc] init];
    NSDate *date = [gregorian dateFromComponents:comps];
    
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = date;
    localNotification.alertBody = @"Yolo";
    localNotification.alertAction = @"Show me the item";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    localNotification.repeatInterval = NSCalendarUnitDay;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    
    //setting night notification
    NSDateComponents *comps1 = [[NSDateComponents alloc] init];
    [comps1 setDay:1];
    [comps1 setHour:20];
    [comps1 setMinute:00];
    NSCalendar *gregorian1 = [[NSCalendar alloc] init];
    NSDate *date1 = [gregorian1 dateFromComponents:comps];
    
    UILocalNotification* localNightNotification = [[UILocalNotification alloc] init];
    localNightNotification.fireDate = date1;
    localNightNotification.alertBody = @"Yolo";
    localNightNotification.alertAction = @"Show me the item";
    localNightNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNightNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    localNightNotification.repeatInterval = NSCalendarUnitDay;

    [[UIApplication sharedApplication] scheduleLocalNotification:localNightNotification];
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *eventArray = [app scheduledLocalNotifications];
    
    NSLog(@"%@", eventArray);
}
@end
