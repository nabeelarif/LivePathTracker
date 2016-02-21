//
//  PathViewController.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/19/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "PathViewController.h"
#import <MapKit/MapKit.h>
#import "LocationModel.h"
#import "Utility.h"
#import "UIColor+Theme.h"

@interface PathViewController () <UIActionSheetDelegate, CLLocationManagerDelegate,MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *stopButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)actionStop:(id)sender;

@property int seconds;
@property float distance;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *locations;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSDate *timeStarted;
@property (nonatomic) BOOL isFirstTime;

@end

@implementation PathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isFirstTime = YES;
    self.label.text = nil;
    [self transparentNavigationBar];
    [self setupMap];
    [self startRun];
}
-(void)transparentNavigationBar{
    [self.navigationController.navigationBar setBackgroundImage:[Utility imageFromColor:[UIColor appColorWithLightness:0.7 alpha:0.5]] forBarMetrics:UIBarMetricsDefault]; 
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)setupMap{
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
}
#pragma mark - MKMapViewDelegate
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation: (MKUserLocation *)userLocation
{
    if (_isFirstTime) {
        _isFirstTime=NO;
        _mapView.centerCoordinate = userLocation.location.coordinate;
        MKCoordinateRegion adjustedRegion =  { {0.0, 0.0 }, { 0.0, 0.0 } };
        adjustedRegion.center.latitude = userLocation.location.coordinate.latitude;
        adjustedRegion.center.longitude = userLocation.location.coordinate.longitude;
        adjustedRegion.span.longitudeDelta  = 0.15;
        adjustedRegion.span.latitudeDelta  = 0.15;
        [self.mapView setRegion:adjustedRegion animated:NO];
    }else{
//        _mapView.centerCoordinate = userLocation.location.coordinate;
        [_mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    }
    
}
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolyline *polyLine = (MKPolyline *)overlay;
        MKPolylineRenderer *aRenderer = [[MKPolylineRenderer alloc] initWithPolyline:polyLine];
        aRenderer.strokeColor = [UIColor blueColor];
        aRenderer.lineWidth = 3;
        return aRenderer;
    }
    return nil;
}
#pragma mark - Timer and location updates
-(void)startRun
{
    self.seconds = 0;
    self.distance = 0;
    self.locations = [NSMutableArray array];
    [self startLocationUpdates];
    //Ignore location manager values for 2 seconds to avoid false values.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.locationManager.delegate = self;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self
                                                    selector:@selector(eachSecond) userInfo:nil repeats:YES];
        _timeStarted = [NSDate date];
    });
}
- (void)startLocationUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
    }
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.activityType = CLActivityTypeFitness;
    
    // Movement threshold for new events.
    self.locationManager.distanceFilter = 5; // meters
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
    
    [self.locationManager startUpdatingLocation];
}
- (void)eachSecond
{
    self.seconds++;
    self.label.text = [NSString stringWithFormat:
                       @"  Time: %@\n  Distance: %@\n  Pace: %@",
                       [Utility stringifySecondCount:self.seconds usingLongFormat:NO],
                       [Utility stringifyDistance:self.distance],
                       [Utility stringifyAvgPaceFromDist:self.distance overTime:self.seconds]];
}
#pragma mark - CLLocationManager Delegate
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    NSLog(@"New location");
    for (CLLocation *newLocation in locations) {
        
        NSDate *eventDate = newLocation.timestamp;
        
        NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
        
        if (fabs(howRecent) < 10.0 && newLocation.horizontalAccuracy < 20) {
            
            // update distance
            if (self.locations.count > 0) {
                self.distance += [newLocation distanceFromLocation:self.locations.lastObject];
                
                CLLocationCoordinate2D coords[2];
                coords[0] = ((CLLocation *)self.locations.lastObject).coordinate;
                coords[1] = newLocation.coordinate;
                
                [self.mapView addOverlay:[MKPolyline polylineWithCoordinates:coords count:2]];
            }
            
            [self.locations addObject:newLocation];
        }
    }
}


#pragma mark - Action Methods
- (IBAction)actionStop:(id)sender {
    [_locationManager stopUpdatingLocation];
    UIAlertController *actionController = [[UIAlertController alloc] init];
    actionController.message = @"You have a track completed.";
    actionController.preferredAction = UIAlertControllerStyleActionSheet;
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //Do nothing;
    }];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //Save;
        [self saveCurrentRun];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *discardAction = [UIAlertAction actionWithTitle:@"Discard" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        [self discardCurrentRun];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
    [actionController addAction:saveAction];
    [actionController addAction:discardAction];
    [actionController addAction:cancelAction];
    [self presentViewController:actionController animated:YES completion:nil];
}
-(void)saveCurrentRun{
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        PathModel *currentPathModel = [PathModel MR_createEntityInContext:localContext];
        currentPathModel.totalDistanceValue = _distance;
        currentPathModel.totalDurationValue = _seconds;
        currentPathModel.timeStarted = _timeStarted;
        
        for (CLLocation *location in _locations) {
            LocationModel *locModel = [LocationModel MR_createEntityInContext:localContext];
            locModel.latitudeValue = location.coordinate.latitude;
            locModel.longitudeValue = location.coordinate.longitude;
            locModel.timeStamp = location.timestamp;
            [currentPathModel addLocationsObject:locModel];
        }
    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        //
    }];
}
@end
