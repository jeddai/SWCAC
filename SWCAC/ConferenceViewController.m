//
//  FirstViewController.m
//  SWCAC
//
//  Created by Charles Humphreys on 1/29/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import "ConferenceViewController.h"
#import "ReaderDemoController.h"
#import "ReaderViewController.h"

@interface ConferenceViewController () <ReaderViewControllerDelegate>

@end

@implementation ConferenceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    //2-18-2015
    [self scheduleNotificationWithDate:@"02/18/2015 5:00:00 PM" message:@"Beginning at 7:30 AM tomorrow, this application will send reminder notifications fifteen minutes before each event. If you do not wish to receive these notifications, they can be turned off in Settings>Notifications>SWCAC."];
    //2-19-2015
    [self scheduleNotificationWithDate:@"02/19/2015 7:30:00 AM" message:@"Registration and sponsorship fairs have begun!"];
    [self scheduleNotificationWithDate:@"02/19/2015 7:45:00 AM" message:@"Session A begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/19/2015 9:00:00 AM" message:@"Session B begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/19/2015 10:15:00 AM" message:@"Collaborative meetings and Session C begin in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/19/2015 11:30:00 AM" message:@"Awards lunch begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/19/2015 12:45:00 PM" message:@"Session D and Article Talkback with Joanna Wolfe begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/19/2015 1:45:00 PM" message:@"Snack break!"];
    [self scheduleNotificationWithDate:@"02/19/2015 2:00:00 PM" message:@"Session E begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/19/2015 3:15:00 PM" message:@"Workshops begin in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/19/2015 3:30:00 PM" message:@"Registration ends in one hour."];
    [self scheduleNotificationWithDate:@"02/19/2015 4:30:00 PM" message:@"Registration has closed and the sponsorship fair has ended."];
    [self scheduleNotificationWithDate:@"02/19/2015 5:15:00 PM" message:@"Opening Reception begins in fifteen minutes."];
    //2-20-2015
    [self scheduleNotificationWithDate:@"02/20/2015 7:45:00 AM" message:@"Session F begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/20/2015 9:00:00 AM" message:@"Session G begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/20/2015 10:15:00 AM" message:@"State meetings begin in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/20/2015 11:30:00 AM" message:@"Keynote lunch begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/20/2015 1:15:00 PM" message:@"Google Hangout with Joanna Wolfe begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/20/2015 2:00:00 PM" message:@"Session H begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/20/2015 3:15:00 PM" message:@"Workshops begin in fifteen minutes."];
    //2-21-2015
    [self scheduleNotificationWithDate:@"02/21/2015 7:45:00 AM" message:@"Executive board meeting begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/21/2015 7:45:10 AM" message:@"Session I begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/21/2015 9:00:00 AM" message:@"Session J begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/21/2015 10:15:00 AM" message:@"Tutoring philosophy workshop and Session K begin in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/21/2015 11:30:00 AM" message:@"Session L begins in fifteen minutes."];
    [self scheduleNotificationWithDate:@"02/21/2015 12:45:00 AM" message:@"The conference is now over, thank you for attending!"];
}

- (void)scheduleNotificationWithDate:(NSString *)dateString message:(NSString *)message
{
    NSString *str = dateString;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM/dd/yyyy hh:mm:ss a"];
    NSTimeZone *cst = [NSTimeZone timeZoneWithAbbreviation:@"CST"];
    [formatter setTimeZone:cst];
    NSDate *date = [formatter dateFromString:str];
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = date;
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotif.alertBody = message;
    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    //localNotif.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
    NSLog(@"Has scheduled notification with date %@",date);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    NSString *phrase = nil; // Document password (for unlocking most encrypted PDF files)
    
    NSArray *pdfs = [[NSBundle mainBundle] pathsForResourcesOfType:@"pdf" inDirectory:nil];
    
    NSString *filePath = [pdfs firstObject]; assert(filePath != nil); // Path to first PDF file
    
    ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:phrase];
    
    if (document != nil) // Must have a valid ReaderDocument object in order to proceed with things
    {
        ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
        
        readerViewController.delegate = self; // Set the ReaderViewController delegate to self
        
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
        
        [self.navigationController pushViewController:readerViewController animated:YES];
        
#else // present in a modal view controller
        
        readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        
        [self presentViewController:readerViewController animated:YES completion:NULL];
        
#endif // DEMO_VIEW_CONTROLLER_PUSH
    }
    else // Log an error so that we know that something went wrong
    {
        NSLog(@"%s [ReaderDocument withDocumentFilePath:'%@' password:'%@'] failed.", __FUNCTION__, filePath, phrase);
    }
}

- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
    
    [self.navigationController popViewControllerAnimated:YES];
    
#else // dismiss the modal view controller
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
#endif // DEMO_VIEW_CONTROLLER_PUSH
}

@end
