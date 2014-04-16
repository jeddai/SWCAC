//
//  HotelViewController.m
//  SWCAC
//
//  Created by Charles Humphreys on 4/14/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//
#import "UIWeb1ViewController.h"
#import "HotelViewController.h"

@interface HotelViewController ()

@end

@implementation HotelViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"HotelSegue"])
    {
        UIWeb1ViewController *webController = [segue destinationViewController];
        webController.segueNum = 4;
    }
    
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
