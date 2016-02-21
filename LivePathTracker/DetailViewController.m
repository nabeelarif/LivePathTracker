//
//  DetailViewController.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/20/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "DetailViewController.h"
#import <MapKit/MapKit.h>
#import "LocationModel.h"
#import "PathModel.h"
#import "Utility.h"
#import "MulticolorPolylineSegment.h"

@interface DetailViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (nonatomic,strong) NSArray *arrLocation;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView.delegate = self;
    self.title = [[Utility dateFormatter] stringFromDate:_currentPathModel.timeStarted];
    NSSortDescriptor *sortDateBased = [NSSortDescriptor sortDescriptorWithKey:@"timeStamp" ascending:YES];
    _arrLocation = [_currentPathModel.locations sortedArrayUsingDescriptors:@[sortDateBased]];
    [self loadMap];
    [self configureLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configureLabel{
    
    self.detailLabel.text = [NSString stringWithFormat:
                       @"  Time: %@\n  Distance: %@\n  Pace: %@",
                       [Utility stringifySecondCount:_currentPathModel.totalDurationValue usingLongFormat:NO],
                       [Utility stringifyDistance:_currentPathModel.totalDistanceValue],
                       [Utility stringifyAvgPaceFromDist:_currentPathModel.totalDistanceValue overTime:_currentPathModel.totalDurationValue]];
}
- (MKCoordinateRegion)defineRegion
{
    MKCoordinateRegion region;
    LocationModel *initialLoc = _arrLocation.firstObject;
    
    float minLat = initialLoc.latitudeValue;
    float minLng = initialLoc.longitudeValue;
    float maxLat = initialLoc.latitudeValue;
    float maxLng = initialLoc.longitudeValue;
    
    for (LocationModel *location in _arrLocation) {
        if (location.latitudeValue < minLat) {
            minLat = location.latitudeValue;
        }
        if (location.longitudeValue < minLng) {
            minLng = location.longitudeValue;
        }
        if (location.latitudeValue > maxLat) {
            maxLat = location.latitudeValue;
        }
        if (location.longitudeValue > maxLng) {
            maxLng = location.longitudeValue;
        }
    }
    
    region.center.latitude = (minLat + maxLat) / 2.0f;
    region.center.longitude = (minLng + maxLng) / 2.0f;
    
    region.span.latitudeDelta = (maxLat - minLat) * 1.1f; // 10% padding
    region.span.longitudeDelta = (maxLng - minLng) * 1.1f; // 10% padding
    
    return region;
}
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MulticolorPolylineSegment *polyLine = (MulticolorPolylineSegment *)overlay;
        MKPolylineRenderer *aRenderer = [[MKPolylineRenderer alloc] initWithPolyline:polyLine];
        aRenderer.strokeColor = polyLine.color;
        aRenderer.lineWidth = 6;
        return aRenderer;
    }
    
    return nil;
}
- (MKPolyline *)polyLine {
    
    CLLocationCoordinate2D coords[_arrLocation.count];
    
    int i=0;
    for (LocationModel *location in _arrLocation)  {
        coords[i] = CLLocationCoordinate2DMake(location.latitude.doubleValue, location.longitude.doubleValue);
        i++;
    }
    
    MKPolyline *polyLine = [MKPolyline polylineWithCoordinates:coords count:_arrLocation.count];
    return polyLine;
}

- (void)loadMap
{
    if (_arrLocation.count > 0) {
        self.mapView.hidden = NO;
        // set the map bounds
        [self.mapView setRegion:[self defineRegion]];
        NSArray *colorSegmentArray = [Utility colorSegmentsForLocations:_arrLocation];
        [self.mapView addOverlays:colorSegmentArray];
        
    } else {
        // no locations were found!
        self.mapView.hidden = YES;
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:@"Sorry, this run has no locations saved."
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}
@end
