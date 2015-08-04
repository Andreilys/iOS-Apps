//: Playground - noun: a place where people can play

import UIKit


NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

NSDate* date = [NSDate date];

NSDateComponents* comps = [[NSDateComponents alloc]init];
comps.day = -1;

NSCalendar* calendar = [NSCalendar currentCalendar];

NSDate* yesterday = [calendar dateByAddingComponents:comps toDate:date options:nil];

