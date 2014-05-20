//
//  MapViewController.h
//  SWCAC
//
//  Created by Charles Humphreys on 1/29/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapInfoViewController.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *mapView;
    BOOL *restaurants;
    BOOL *tourists;
    BOOL *conference;
}

@property(nonatomic, retain) MKMapView *mapView;

-(void)toggleRestaurants:(BOOL *)on;
-(void)toggleTourist:(BOOL *)on;
-(void)toggleConference:(BOOL *)on;

@end
