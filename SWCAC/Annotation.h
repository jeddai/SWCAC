//
//  Annotation.h
//  SWCAC
//
//  Created by Charles Humphreys on 5/16/14.
//  Copyright (c) 2014 Charles Humphreys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString* title;
@property(nonatomic, copy) NSString* subtitle;

@end
