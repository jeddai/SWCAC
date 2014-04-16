//
//  MapViewController.m
//  SWCAC
//
//  Created by Charles Humphreys on 1/29/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self) {
            // Custom initialization
        }
        return self;
    }

    - (void)viewDidLoad
    {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        
        mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
        mapView.mapType = MKMapTypeStandard;

        CLLocationCoordinate2D coord = {.latitude =  36.1866405, .longitude =  -86.7852454};
        MKCoordinateSpan span = {.latitudeDelta =  0.2, .longitudeDelta =  0.2};
        MKCoordinateRegion region = {coord, span};
        
        [mapView setRegion:region];
        [self.view addSubview:mapView];
    }

    - (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

    @end
