//
//  AnnotationCalloutViewController.m
//  SWCAC
//
//  Created by Charles Humphreys on 5/20/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import "AnnotationCalloutViewController.h"

@interface AnnotationCalloutViewController ()

@end

@implementation AnnotationCalloutViewController
@synthesize locationTitle;

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
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [self.view addSubview:navbar];
    
    NSString *title = locationTitle;
    self.navigationItem.title = title;
    
    NSURL *websiteUrl;
    if (self.index == 0) websiteUrl = [NSURL URLWithString:@"http://www.lipscomb.edu/"];
    else if(self.index == (NSInteger *) 1) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/116168838521205979524/about"];
    else if(self.index == (NSInteger *) 2) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/+EdleysBarBQueNashville/about"];
    else if(self.index == (NSInteger *) 3) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/101944730025815313543/about"];
    else if(self.index == (NSInteger *) 4) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/102214855200126504932/about"];
    else if(self.index == (NSInteger *) 5) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/104364898620644129504/about"];
    else if(self.index == (NSInteger *) 6) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/105089949793255933877/about"];
    else if(self.index == (NSInteger *) 7) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/101339933460127962325/about"];
    else if(self.index == (NSInteger *) 8) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/109611742405882404894/about"];
    else if(self.index == (NSInteger *) 9) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/100567514874034313422/about"];
    else if(self.index == (NSInteger *) 10) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/114980038094369823862/about"];
    else if(self.index == (NSInteger *) 11) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/117873841167490565013/about"];
    else if(self.index == (NSInteger *) 12) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/112995067839376812038/about"];
    else if(self.index == (NSInteger *) 13) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/103835953857404834514/about"];
    else if(self.index == (NSInteger *) 14) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/112725534674975362776/about"];
    else if(self.index == (NSInteger *) 15) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/114594787881797204603/about"];
    else if(self.index == (NSInteger *) 16) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/112320814268436496005/about"];
    else if(self.index == (NSInteger *) 17) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/110981416601747095769/about"];
    else if(self.index == (NSInteger *) 18) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/101153310947285792943/about"];
    else if(self.index == (NSInteger *) 19) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/106418559379492264878/about"];
    else if(self.index == (NSInteger *) 20) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/110365152217708541670/about"];
    else if(self.index == (NSInteger *) 21) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/108709226106453457545/about"];
    else if(self.index == (NSInteger *) 22) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/+MerrideesBreadbasket/about"];
    else if(self.index == (NSInteger *) 23) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/106775114739960101664/about"];
    else if(self.index == (NSInteger *) 24) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/111734478602053183206/about"];
    else if(self.index == (NSInteger *) 25) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/112705408761233573264/about"];
    else if(self.index == (NSInteger *) 26) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/116503991335681550107/about"];
    else if(self.index == (NSInteger *) 27) websiteUrl = [NSURL URLWithString:@"https://plus.google.com/107345340383374714898/about"];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    [myWebView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
