//
//  SecondViewController.m
//  SWCAC
//
//  Created by Charles Humphreys on 1/29/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import "CampusViewController.h"
#import "Annotation.h"
#import "AnnotationCalloutViewController.h"

@interface CampusViewController ()
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation CampusViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    mapView.showsUserLocation = YES;
    
    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.mapType = MKMapTypeHybrid;
    
    CLLocationCoordinate2D coord = {.latitude =  36.104572, .longitude =  -86.7987725};
    MKCoordinateSpan span = {.latitudeDelta =  0.007, .longitudeDelta =  0.007};
    MKCoordinateRegion region = {coord, span};
    
    [mapView setRegion:region];
    [mapView setDelegate:self];
    [mapView setShowsUserLocation:YES];
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    CLLocationCoordinate2D coord = {.latitude =  36.104572, .longitude =  -86.7987725};
    MKCoordinateSpan span = {.latitudeDelta =  0.007, .longitudeDelta =  0.007};
    MKCoordinateRegion region = {coord, span};
    
    [mapView setRegion:region];
    
    NSMutableArray *buildings = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    Annotation *ann;
    
    //  Ezell
    ann = [[Annotation alloc] init];
    location.latitude = 36.1041055;
    location.longitude = -86.8004851;
    ann.coordinate = location;
    ann.title = @"Ezell";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 100;
    [buildings addObject:ann];
    
    //  Beaman
    ann = [[Annotation alloc] init];
    location.latitude = 36.1048306;
    location.longitude = -86.8003913;
    ann.coordinate = location;
    ann.title = @"Beaman Library";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 101;
    [buildings addObject:ann];
    
    //  McFarland
    ann = [[Annotation alloc] init];
    location.latitude = 36.1064152;
    location.longitude = -86.8002926;
    ann.coordinate = location;
    ann.title = @"McFarland Science Center";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 102;
    [buildings addObject:ann];
    
    //  Bennett
    ann = [[Annotation alloc] init];
    location.latitude = 36.1054512;
    location.longitude = -86.7980867;
    ann.coordinate = location;
    ann.title = @"Bennett Campus Center";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 103;
    [buildings addObject:ann];
    
    //  Allen
    ann = [[Annotation alloc] init];
    location.latitude = 36.1038855;
    location.longitude = -86.7988551;
    ann.coordinate = location;
    ann.title = @"Allen Arena";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 104;
    [buildings addObject:ann];
    
    //  Swang
    ann = [[Annotation alloc] init];
    location.latitude = 36.1047595;
    location.longitude = -86.7994899;
    ann.coordinate = location;
    ann.title = @"Swang Business Center";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 105;
    [buildings addObject:ann];
    
    //  Burton
    ann = [[Annotation alloc] init];
    location.latitude = 36.1054736;
    location.longitude = -86.7993974;
    ann.coordinate = location;
    ann.title = @"Burton Health Sciences Center";
    ann.subtitle = @"";
    ann.index = (NSInteger *) 106;
    [buildings addObject:ann];
    
    [mapView removeAnnotations:[mapView annotations]];
    
    [mapView addAnnotations:buildings];
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
        
        MyPin.pinColor = MKPinAnnotationColorPurple;
        
        if(![annotation.title isEqualToString:@"McFarland Science Center"] || ![annotation.title isEqualToString:@"Beaman Library"])
        {
            UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        
            MyPin.rightCalloutAccessoryView = advertButton;
        }
        
        MyPin.draggable = NO;
        MyPin.highlighted = YES;
        MyPin.animatesDrop = YES;
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

@end
