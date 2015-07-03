//
//  ViewController.m
//  googleMapAPI
//
//  Created by Andrei on 7/1/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "ViewController.h"

@import GoogleMaps;


@interface ViewController ()

@end


@implementation ViewController 

- (void)viewDidLoad {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    self.mapView = [GMSMapView mapWithFrame:_gMapsView.bounds camera:camera];
    self.mapView.delegate = self;
    
    [self.gMapsView addSubview:_mapView];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = _mapView;
}
@end
