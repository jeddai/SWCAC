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
#import "AnnotationCalloutViewController.h"

@interface MapViewController ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation MapViewController
@synthesize mapView;

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
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    mapView.showsUserLocation = YES;
    
    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.mapType = MKMapTypeStandard;
    
    CLLocationCoordinate2D coord = {.latitude =  36.105636, .longitude =  -86.80006};
    MKCoordinateSpan span = {.latitudeDelta =  0.15, .longitudeDelta =  0.15};
    MKCoordinateRegion region = {coord, span};
    
    [mapView setRegion:region];
    [mapView setDelegate:self];
    [mapView setShowsUserLocation:YES];
    [self.view addSubview:mapView];
    
    conference = false;
    restaurants = false;
    tourists = false;
    animate = (Boolean *) YES;
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"restaurantsVal"] == NO &&
        [[NSUserDefaults standardUserDefaults] boolForKey:@"touristsVal"] == NO &&
        [[NSUserDefaults standardUserDefaults] boolForKey:@"conferenceVal"] == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Pin Drops" message: @"You can use the settings page to turn on pins for restaurants, conference locations, and tourism locations" delegate: self cancelButtonTitle:@"Okay" otherButtonTitles: nil, nil];
        [alert setTag:1];
        [alert show];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)annotMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if (annotation == annotMapView.userLocation)
    {
        return nil;
    }
    else
    {
        MKPinAnnotationView *MyPin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
        
        if([restaurantLocations containsObject:annotation]) MyPin.pinColor = MKPinAnnotationColorPurple;
        else if([touristLocations containsObject:annotation]) MyPin.pinColor = MKPinAnnotationColorRed;
        else if([conferenceLocations containsObject:annotation]) MyPin.pinColor = MKPinAnnotationColorGreen;
        
        UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        
        MyPin.rightCalloutAccessoryView = advertButton;
        MyPin.draggable = NO;
        MyPin.highlighted = YES;
        MyPin.animatesDrop = (BOOL)animate;
        MyPin.canShowCallout = YES;
        
        return MyPin;
    }
}

-(void)button:(id)sender
{
    AnnotationCalloutViewController *newView = (AnnotationCalloutViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"AnnotCallout"];
    Annotation *ann = [mapView.selectedAnnotations objectAtIndex:0];
    newView.locationTitle = ann.title;
    newView.index = (NSInteger *) ann.index;//(NSInteger *) [mapView.annotations indexOfObject:[mapView.selectedAnnotations objectAtIndex:0]];
    [self.navigationController pushViewController:newView animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    restaurantLocations = [[NSMutableArray alloc] init];
    touristLocations = [[NSMutableArray alloc] init];
    conferenceLocations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    Annotation *ann;
    
//  Lipscomb
    ann = [[Annotation alloc] init];
    location.latitude = 36.105636;
    location.longitude = -86.80006;
    ann.coordinate = location;
    ann.title = @"Lipscomb University";
    ann.subtitle = @"Home of the Bisons";
    ann.index = (NSInteger *) 0;
    [conferenceLocations addObject:ann];
    
//  Pancake Pantry
    ann = [[Annotation alloc] init];
    location.latitude = 36.137011;
    location.longitude = -86.800631;
    ann.coordinate = location;
    ann.title = @"Pancake Pantry";
    ann.subtitle = @"Best Pancakes around";
    ann.index = (NSInteger *) 1;
    [restaurantLocations addObject:ann];
    
//  Edley's
    ann = [[Annotation alloc] init];
    location.latitude = 36.12283;
    location.longitude = -86.789914;
    ann.coordinate = location;
    ann.title = @"Edley's BBQ";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 2;
    [restaurantLocations addObject:ann];
    
//  Burger Up
    ann = [[Annotation alloc] init];
    location.latitude = 36.1215;
    location.longitude = -86.790635;
    ann.coordinate = location;
    ann.title = @"Burger Up";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 3;
    [restaurantLocations addObject:ann];
    
//  The Frothy Monkey
    ann = [[Annotation alloc] init];
    location.latitude = 36.124623;
    location.longitude = -86.789809;
    ann.coordinate = location;
    ann.title = @"The Frothy Monkey Coffeehouse";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 4;
    [restaurantLocations addObject:ann];
    
//  Las Paletas
    ann = [[Annotation alloc] init];
    location.latitude = 36.120551;
    location.longitude = -86.790754;
    ann.coordinate = location;
    ann.title = @"Las Paletas";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 5;
    [restaurantLocations addObject:ann];
    
//  Copper Kettle
    ann = [[Annotation alloc] init];
    location.latitude = 36.105232;
    location.longitude = -86.795649;
    ann.coordinate = location;
    ann.title = @"Copper Kettle";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 6;
    [restaurantLocations addObject:ann];

//  The Well
    ann = [[Annotation alloc] init];
    location.latitude = 36.105359;
    location.longitude = -86.795517;
    ann.coordinate = location;
    ann.title = @"The Well Coffeehouse";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 7;
    [restaurantLocations addObject:ann];

//  SloCo
    ann = [[Annotation alloc] init];
    location.latitude = 36.121399;
    location.longitude = -86.790848;
    ann.coordinate = location;
    ann.title = @"SloCo";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 8;
    [restaurantLocations addObject:ann];

//  Noodles
    ann = [[Annotation alloc] init];
    location.latitude = 36.108547;
    location.longitude = -86.813399;
    ann.coordinate = location;
    ann.title = @"Noodles & Co.";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 9;
    [restaurantLocations addObject:ann];

//  Panera
    ann = [[Annotation alloc] init];
    location.latitude = 36.107518;
    location.longitude = -86.814288;
    ann.coordinate = location;
    ann.title = @"Panera";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 10;
    [restaurantLocations addObject:ann];

//  Cheescake Factory
    ann = [[Annotation alloc] init];
    location.latitude = 36.107787;
    location.longitude = -86.814948;
    ann.coordinate = location;
    ann.title = @"Cheesecake Factory";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 11;
    [restaurantLocations addObject:ann];

//  Bread and Soup, Co.
    ann = [[Annotation alloc] init];
    location.latitude = 36.102179;
    location.longitude = -86.817789;
    ann.coordinate = location;
    ann.title = @"Bread & Company";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 12;
    [restaurantLocations addObject:ann];

//  California Pizza Kitchen
    ann = [[Annotation alloc] init];
    location.latitude = 36.102823;
    location.longitude = -86.816952;
    ann.coordinate = location;
    ann.title = @"California Pizza Kitchen";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 13;
    [restaurantLocations addObject:ann];

//  Chipotle
    ann = [[Annotation alloc] init];
    location.latitude = 36.105424;
    location.longitude = -86.812832;
    ann.coordinate = location;
    ann.title = @"Chipotle";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 14;
    [restaurantLocations addObject:ann];

//  Ruby Tuesday's
    ann = [[Annotation alloc] init];
    location.latitude = 36.108468;
    location.longitude = -86.812937;
    ann.coordinate = location;
    ann.title = @"Ruby Tuesday";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 15;
    [restaurantLocations addObject:ann];

//  Whole Foods
    ann = [[Annotation alloc] init];
    location.latitude = 36.103371;
    location.longitude = -86.81853;
    ann.coordinate = location;
    ann.title = @"Whole Foods";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 16;
    [restaurantLocations addObject:ann];

//  Zoe's
    ann = [[Annotation alloc] init];
    location.latitude = 36.103605;
    location.longitude = -86.817646;
    ann.coordinate = location;
    ann.title = @"Zoe's Kitchen";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 17;
    [restaurantLocations addObject:ann];

//  Douglas Corner Cafe
    ann = [[Annotation alloc] init];
    location.latitude = 36.131945;
    location.longitude = -86.778626;
    ann.coordinate = location;
    ann.title = @"Douglas Corner Cafe";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 18;
    [restaurantLocations addObject:ann];

//  Zanies
    ann = [[Annotation alloc] init];
    location.latitude = 36.13189;
    location.longitude = -86.779128;
    ann.coordinate = location;
    ann.title = @"Zanies Comedy Night Club";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 19;
    [restaurantLocations addObject:ann];
    
//  Athens
    ann = [[Annotation alloc] init];
    location.latitude = 36.123268;
    location.longitude = -86.77593;
    ann.coordinate = location;
    ann.title = @"Athens Family Restaurant";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 20;
    [restaurantLocations addObject:ann];
    
//  Grimey's--Frothy Monkey
    ann = [[Annotation alloc] init];
    location.latitude = 36.136966;
    location.longitude = -86.778579;
    ann.coordinate = location;
    ann.title = @"Grimey's Too";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 21;
    [restaurantLocations addObject:ann];
    
//  Merridee's
    ann = [[Annotation alloc] init];
    location.latitude = 35.924034;
    location.longitude = -86.870034;
    ann.coordinate = location;
    ann.title = @"Merridee's Breadbasket";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 22;
    [restaurantLocations addObject:ann];
    
//  Cool Springs Mall
    ann = [[Annotation alloc] init];
    location.latitude = 35.9571;
    location.longitude = -86.81374;
    ann.coordinate = location;
    ann.title = @"CoolSprings Galleria";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 23;
    [touristLocations addObject:ann];
    
//  Jack's Barbecue (Broadway)
    ann = [[Annotation alloc] init];
    location.latitude = 36.16098;
    location.longitude = -86.777682;
    ann.coordinate = location;
    ann.title = @"Jack's Barbecue";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 24;
    [restaurantLocations addObject:ann];
    
//  Wild Wasabi (off Demonbruen)
    ann = [[Annotation alloc] init];
    location.latitude = 36.154729;
    location.longitude = -86.782348;
    ann.coordinate = location;
    ann.title = @"Wild Wasabi";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 25;
    [restaurantLocations addObject:ann];
    
//  The Flying Saucer
    ann = [[Annotation alloc] init];
    location.latitude = 36.156736;
    location.longitude = -86.783803;
    ann.coordinate = location;
    ann.title = @"The Flying Saucer";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 26;
    [restaurantLocations addObject:ann];
    
//  The Frist
    ann = [[Annotation alloc] init];
    location.latitude = 36.157955;
    location.longitude = -86.784172;
    ann.coordinate = location;
    ann.title = @"The Frist Center";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 27;
    [touristLocations addObject:ann];
    
    [mapView removeAnnotations:[mapView annotations]];
    
    restaurants = [[NSUserDefaults standardUserDefaults] boolForKey:@"restaurantsVal"];
    tourists = [[NSUserDefaults standardUserDefaults] boolForKey:@"touristsVal"];
    conference = [[NSUserDefaults standardUserDefaults] boolForKey:@"conferenceVal"];
    if (restaurants) [mapView addAnnotations:restaurantLocations];
    if (tourists) [mapView addAnnotations:touristLocations];
    if (conference) [mapView addAnnotations:conferenceLocations];
}

- (void)viewWillDisappear:(BOOL)animated
{
    animate = (Boolean *) NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleRestaurants:(BOOL)on
{
    if (on)
    {
        restaurants = YES;
        [[NSUserDefaults standardUserDefaults] setBool:restaurants forKey:@"restaurantsVal"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else
    {
        restaurants = NO;
        [[NSUserDefaults standardUserDefaults] setBool:restaurants forKey:@"restaurantsVal"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleTourist:(BOOL)on
{
    if (on)
    {
        tourists = YES;
        [[NSUserDefaults standardUserDefaults] setBool:tourists forKey:@"touristsVal"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else
    {
        tourists = NO;
        [[NSUserDefaults standardUserDefaults] setBool:tourists forKey:@"touristsVal"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleConference:(BOOL)on
{
    if (on)
    {
        conference = YES;
        [[NSUserDefaults standardUserDefaults] setBool:conference forKey:@"conferenceVal"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else
    {
        conference = NO;
        [[NSUserDefaults standardUserDefaults] setBool:conference forKey:@"conferenceVal"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end