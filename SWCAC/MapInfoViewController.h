//
//  MapInfoViewController.h
//  SWCAC
//
//  Created by Charles Humphreys on 5/16/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapInfoViewController : UIViewController
{
    IBOutlet UISwitch *Switch1;
    IBOutlet UISwitch *Switch2;
    IBOutlet UISwitch *Switch3;
}

@property (nonatomic, retain) IBOutlet UISwitch *Switch1;
@property (nonatomic, retain) IBOutlet UISwitch *Switch2;
@property (nonatomic, retain) IBOutlet UISwitch *Switch3;


- (IBAction)toggleRestaurants:(id)sender;
- (IBAction)toggleAttractions:(id)sender;
- (IBAction)toggleConference:(id)sender;


@end
