//
//  MapInfoViewController.m
//  SWCAC
//
//  Created by Charles Humphreys on 5/16/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import "MapInfoViewController.h"
#import "MapViewController.h"
#import "MapInfoViewController.m"

@interface MapInfoViewController ()

@end

@implementation MapInfoViewController
@synthesize Switch1, Switch2, Switch3;

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
    Switch1.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch1Val"];
    Switch2.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch2Val"];
    Switch3.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch3Val"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleRestaurants:(id)sender
{
    MapViewController *mapView = [[MapViewController alloc] init];
    [mapView toggleRestaurants:(BOOL)Switch1.on];
    [[NSUserDefaults standardUserDefaults] setBool:Switch1.on forKey:@"switch1Val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)toggleAttractions:(id)sender
{
    MapViewController *mapView = [[MapViewController alloc] init];
    [mapView toggleTourist:(BOOL)Switch2.on];
    [[NSUserDefaults standardUserDefaults] setBool:Switch2.on forKey:@"switch2Val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)toggleConference:(id)sender
{
    MapViewController *mapView = [[MapViewController alloc] init];
    [mapView toggleConference:(BOOL)Switch3.on];
    [[NSUserDefaults standardUserDefaults] setBool:Switch3.on forKey:@"switch3Val"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
