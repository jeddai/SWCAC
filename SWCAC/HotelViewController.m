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
- (IBAction)map:(id)sender
{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Open in Maps",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (IBAction)phone:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = @"6152215001";
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: nil message: @"Copied to clipboard" delegate: self cancelButtonTitle:@"Okay" otherButtonTitles: nil, nil];
    [alert setTag:1];
    [alert show];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://maps.apple.com/?qsaddr=Current+Location&daddr=36.042006,-86.780877"]];
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
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
