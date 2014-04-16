//
//  UIWeb1ViewController.m
//  SWCAC
//
//  Created by Charles Humphreys on 3/12/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import "UIWeb1ViewController.h"

@interface UIWeb1ViewController ()

@end

@implementation UIWeb1ViewController

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
    NSURL *websiteUrl;
    if (self.segueNum == 0) {
        websiteUrl = [NSURL URLWithString:@"http://www.google.com/"];
    }
    else if (self.segueNum == 1) {
        websiteUrl = [NSURL URLWithString:@"http://www.lipscomb.edu/writingcenter"];
    }
    else if(self.segueNum == 2) {
        websiteUrl = [NSURL URLWithString:@"http://www.iwca-swca.org/Tennessee.html"];
    }
    else if(self.segueNum == 3) {
        websiteUrl = [NSURL URLWithString:@"http://www.iwca-swca.org/"];
    }
    else if(self.segueNum == 4) {
        websiteUrl = [NSURL URLWithString:@"https://www.google.com/maps/dir/Holiday+Inn+Express+Hotel+Brentwood+North-Nashville+Area,+5566+Franklin+Pike+Cir,+Brentwood,+TN+37027/Lipscomb+University,+1+University+Park+Dr,+Nashville,+TN+37204/@36.0785332,-86.7822654,13z/am=t/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x88647ad5e9c1a5c1:0xd045a9daa9192e39!2m2!1d-86.78142!2d36.042267!1m5!1m1!1s0x8864644f42372ca9:0x40bc74c10dec0853!2m2!1d-86.80006!2d36.105636"];
    }
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    [myWebView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
