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

@interface MapViewController : UIViewController
{
    MKMapView *mapView;
    BOOL *restaurants;
    BOOL *tourists;
}

-(void)addRestaurants;
-(void)removeRestaurants;
-(void)addTourist;
-(void)removeTourist;

@end
