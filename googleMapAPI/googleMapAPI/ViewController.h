//
//  ViewController.h
//  googleMapAPI
//
//  Created by Andrei on 7/1/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;

@interface ViewController : UIViewController <GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *gMapsView;
@property (nonatomic, strong) IBOutlet GMSMapView *mapView;
@property (nonatomic, strong) IBOutlet GMSCameraPosition *camera;

@end

