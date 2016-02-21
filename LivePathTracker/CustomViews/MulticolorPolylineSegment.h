//
//  MulticolorPolylineSegment.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/21/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <MapKit/MapKit.h>
/**
 A line to represent path on map with different colors.
 */
@interface MulticolorPolylineSegment : MKPolyline
@property (strong, nonatomic) UIColor *color;

@end
