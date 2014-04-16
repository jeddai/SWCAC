//
//  UIViewControllerLinks.m
//  SWCAC
//
//  Created by Charles Humphreys on 4/8/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//
#import "UIWeb1ViewController.h"
#import "UIViewControllerLinks.h"

@interface UIViewControllerLinks ()

@end

@implementation UIViewControllerLinks

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
    if ([[segue identifier] isEqualToString:@"LUWSSegue"])
    {
        UIWeb1ViewController *webController = [segue destinationViewController];
        webController.segueNum = 1;
    }
    else if ([[segue identifier] isEqualToString:@"SWCATennSegue"])
    {
        UIWeb1ViewController *webController = [segue destinationViewController];
        webController.segueNum = 2;
    }
    else if ([[segue identifier] isEqualToString:@"SWCASegue"])
    {
        UIWeb1ViewController *webController = [segue destinationViewController];
        webController.segueNum = 3;
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
