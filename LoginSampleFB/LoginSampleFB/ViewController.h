//
//  ViewController.h
//  LoginSampleFB
//
//  Created by Andrei on 6/29/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface ViewController : UIViewController  <FBSDKLoginButtonDelegate>

@property (strong, nonatomic) IBOutlet FBSDKProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

@end

