//
//  AnnotationCalloutViewController.h
//  SWCAC
//
//  Created by Charles Humphreys on 5/20/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnotationCalloutViewController : UIViewController
{
    IBOutlet UIWebView *myWebView;
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
    __weak IBOutlet UILabel *noInfo;
}
@property(nonatomic, copy) NSString *locationTitle;
@property(nonatomic) NSInteger *index;

@end
