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
    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.mapType = MKMapTypeStandard;
    
    CLLocationCoordinate2D coord = {.latitude =  36.1866405, .longitude =  -86.7852454};
    MKCoordinateSpan span = {.latitudeDelta =  0.1, .longitudeDelta =  0.1};
    MKCoordinateRegion region = {coord, span};
    
    [mapView setRegion:region];
    [mapView setDelegate:self];
    [self.view addSubview:mapView];
    
    restaurants = NO;
    tourists = NO;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *MyPin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
    MyPin.pinColor = MKPinAnnotationColorPurple;
    
    UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    MyPin.rightCalloutAccessoryView = advertButton;
    MyPin.draggable = NO;
    MyPin.highlighted = YES;
    MyPin.animatesDrop = TRUE;
    MyPin.canShowCallout = YES;
    
    return MyPin;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSMutableArray *restaurantLocations = [[NSMutableArray alloc] init];
    NSMutableArray *touristLocations = [[NSMutableArray alloc] init];
    NSMutableArray *conferenceLocations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    Annotation *ann;
    
//  Lipscomb
    ann = [[Annotation alloc] init];
    location.latitude = 36.105636;
    location.longitude = -86.80006;
    ann.coordinate = location;
    ann.title = @"Lipscomb University";
    ann.subtitle = @"Home of the Bisons";
    [touristLocations addObject:ann];
    
//  Pancake Pantry
    ann = [[Annotation alloc] init];
    location.latitude = 36.137011;
    location.longitude = -86.800631;
    ann.coordinate = location;
    ann.title = @"Pancake Pantry";
    ann.subtitle = @"Best Pancakes around";
    [restaurantLocations addObject:ann];
    
//  Edley's
    ann = [[Annotation alloc] init];
    location.latitude = 36.12283;
    location.longitude = -86.789914;
    ann.coordinate = location;
    ann.title = @"Edley's BBQ";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  Burger Up
    ann = [[Annotation alloc] init];
    location.latitude = 36.1215;
    location.longitude = -86.790635;
    ann.coordinate = location;
    ann.title = @"Burger Up";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  The Frothy Monkey
    ann = [[Annotation alloc] init];
    location.latitude = 36.124623;
    location.longitude = -86.789809;
    ann.coordinate = location;
    ann.title = @"The Frothy Monkey Coffeehouse";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  Las Paletas
    ann = [[Annotation alloc] init];
    location.latitude = 36.120551;
    location.longitude = -86.790754;
    ann.coordinate = location;
    ann.title = @"Las Paletas";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  Copper Kettle
    ann = [[Annotation alloc] init];
    location.latitude = 36.105232;
    location.longitude = -86.795649;
    ann.coordinate = location;
    ann.title = @"Copper Kettle";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  The Well
    ann = [[Annotation alloc] init];
    location.latitude = 36.105359;
    location.longitude = -86.795517;
    ann.coordinate = location;
    ann.title = @"The Well Coffeehouse";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  SloCo
    ann = [[Annotation alloc] init];
    location.latitude = 36.121399;
    location.longitude = -86.790848;
    ann.coordinate = location;
    ann.title = @"SloCo";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Noodles
    ann = [[Annotation alloc] init];
    location.latitude = 36.108547;
    location.longitude = -86.813399;
    ann.coordinate = location;
    ann.title = @"Noodles & Co.";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Panera
    ann = [[Annotation alloc] init];
    location.latitude = 36.107518;
    location.longitude = -86.814288;
    ann.coordinate = location;
    ann.title = @"Panera";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Cheescake Factory
    ann = [[Annotation alloc] init];
    location.latitude = 36.107787;
    location.longitude = -86.814948;
    ann.coordinate = location;
    ann.title = @"Cheesecake Factory";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Bread and Soup, Co.
    ann = [[Annotation alloc] init];
    location.latitude = 36.102179;
    location.longitude = -86.817789;
    ann.coordinate = location;
    ann.title = @"Bread & Company";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  California Pizza Kitchen
    ann = [[Annotation alloc] init];
    location.latitude = 36.102823;
    location.longitude = -86.816952;
    ann.coordinate = location;
    ann.title = @"California Pizza Kitchen";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Chipotle
    ann = [[Annotation alloc] init];
    location.latitude = 36.105424;
    location.longitude = -86.812832;
    ann.coordinate = location;
    ann.title = @"Chipotle";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Ruby Tuesday's
    ann = [[Annotation alloc] init];
    location.latitude = 36.108468;
    location.longitude = -86.812937;
    ann.coordinate = location;
    ann.title = @"Ruby Tuesday";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Whole Foods
    ann = [[Annotation alloc] init];
    location.latitude = 36.103371;
    location.longitude = -86.81853;
    ann.coordinate = location;
    ann.title = @"Whole Foods";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Zoe's
    ann = [[Annotation alloc] init];
    location.latitude = 36.037322;
    location.longitude = -86.798405;
    ann.coordinate = location;
    ann.title = @"Zoe's Kitchen";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Douglas Corner Cafe
    ann = [[Annotation alloc] init];
    location.latitude = 36.131945;
    location.longitude = -86.778626;
    ann.coordinate = location;
    ann.title = @"Douglas Corner Cafe";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];

//  Zanies
    ann = [[Annotation alloc] init];
    location.latitude = 36.13189;
    location.longitude = -86.779128;
    ann.coordinate = location;
    ann.title = @"Zanies Comedy Night Club";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  Athens
    ann = [[Annotation alloc] init];
    location.latitude = 36.123268;
    location.longitude = -86.77593;
    ann.coordinate = location;
    ann.title = @"Athens Family Restaurant";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  Grimey's--Frothy Monkey
    ann = [[Annotation alloc] init];
    location.latitude = 36.136966;
    location.longitude = -86.778579;
    ann.coordinate = location;
    ann.title = @"Grimey's Too";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  Merridee's
    ann = [[Annotation alloc] init];
    location.latitude = 35.924034;
    location.longitude = -86.870034;
    ann.coordinate = location;
    ann.title = @"Merridee's Breadbasket";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  Cool Springs Mall
    ann = [[Annotation alloc] init];
    location.latitude = 35.9571;
    location.longitude = -86.81374;
    ann.coordinate = location;
    ann.title = @"CoolSprings Galleria";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  Jack's Barbecue (Broadway)
    ann = [[Annotation alloc] init];
    location.latitude = 36.16098;
    location.longitude = -86.777682;
    ann.coordinate = location;
    ann.title = @"Jack's Barbecue";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  Wild Wasabi (off Demonbruen)
    ann = [[Annotation alloc] init];
    location.latitude = 36.154729;
    location.longitude = -86.782348;
    ann.coordinate = location;
    ann.title = @"Wild Wasabi";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  The Flying Saucer
    ann = [[Annotation alloc] init];
    location.latitude = 36.156736;
    location.longitude = -86.783803;
    ann.coordinate = location;
    ann.title = @"The Flying Saucer";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
//  The Frist
    ann = [[Annotation alloc] init];
    location.latitude = 36.157955;
    location.longitude = -86.784172;
    ann.coordinate = location;
    ann.title = @"The Frist Center";
    ann.subtitle = @"";
    [touristLocations addObject:ann];
    
//  O'Charley's
    ann = [[Annotation alloc] init];
    location.latitude = 36.036895;
    location.longitude = -86.790485;
    ann.coordinate = location;
    ann.title = @"O'Charley's";
    ann.subtitle = @"";
    [restaurantLocations addObject:ann];
    
    [mapView removeAnnotations:[mapView annotations]];
    
    restaurants = [[NSUserDefaults standardUserDefaults] boolForKey:@"restaurantsVal"];
    tourists = [[NSUserDefaults standardUserDefaults] boolForKey:@"touristsVal"];
    conference = [[NSUserDefaults standardUserDefaults] boolForKey:@"conferenceVal"];
    if (restaurants) [mapView addAnnotations:restaurantLocations];
    if (tourists) [mapView addAnnotations:touristLocations];
    if (conference) [mapView addAnnotations:conferenceLocations];
}

-(void)button:(id)sender
{
    NSLog(@"Button Clicked");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleRestaurants:(BOOL *)on
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

- (void)toggleTourist:(BOOL *)on
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

- (void)toggleConference:(BOOL *)on
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
