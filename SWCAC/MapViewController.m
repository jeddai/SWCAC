//
//  MapViewController.m
//  SWCAC
//
//  Created by Charles Humphreys on 1/29/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import "MapViewController.h"
#import "Annotation.h"
#import "MapInfoViewController.h"

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
    MKCoordinateSpan span = {.latitudeDelta =  0.1, .longitudeDelta =  0.1};
    MKCoordinateRegion region = {coord, span};
    
    [mapView setRegion:region];
    [self.view addSubview:mapView];
    
    restaurants = NO;
    tourists = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSMutableArray *restaurantLocations = [[NSMutableArray alloc] init];
    NSMutableArray *touristLocations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    Annotation *ann;
    
    //Lipscomb
    ann = [[Annotation alloc] init];
    location.latitude = 36.105636;
    location.longitude = -86.80006;
    ann.coordinate = location;
    ann.title = @"Lipscomb University";
    ann.subtitle = @"Home of the Bisons";
    [touristLocations addObject:ann];
    
    //Pancake Pantry
    ann = [[Annotation alloc] init];
    location.latitude = 36.137011;
    location.longitude = -86.800631;
    ann.coordinate = location;
    ann.title = @"Pancake Pantry";
    ann.subtitle = @"Best Pancakes around";
    [restaurantLocations addObject:ann];
    
    restaurants = [[NSUserDefaults standardUserDefaults] boolForKey:@"restaurantsVal"];
    tourists = [[NSUserDefaults standardUserDefaults] boolForKey:@"touristsVal"];
    
    [mapView removeAnnotations:[mapView annotations]];
    
    if (restaurants) [mapView addAnnotations:restaurantLocations];
    if (tourists) [mapView addAnnotations:touristLocations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addRestaurants
{
    restaurants = YES;
    [[NSUserDefaults standardUserDefaults] setBool:restaurants forKey:@"restaurantsVal"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)removeRestaurants
{
    restaurants = NO;
    [[NSUserDefaults standardUserDefaults] setBool:restaurants forKey:@"restaurantsVal"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)addTourist
{
    tourists = YES;
    [[NSUserDefaults standardUserDefaults] setBool:tourists forKey:@"touristsVal"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)removeTourist
{
    tourists = NO;
    [[NSUserDefaults standardUserDefaults] setBool:tourists forKey:@"touristsVal"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

    @end
