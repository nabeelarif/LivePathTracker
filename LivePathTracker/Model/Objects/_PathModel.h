// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PathModel.h instead.

#import <CoreData/CoreData.h>
#import "BaseModel.h"

extern const struct PathModelAttributes {
	__unsafe_unretained NSString *timeStarted;
	__unsafe_unretained NSString *totalDistance;
	__unsafe_unretained NSString *totalDuration;
} PathModelAttributes;

extern const struct PathModelRelationships {
	__unsafe_unretained NSString *locations;
} PathModelRelationships;

@class LocationModel;

@interface PathModelID : NSManagedObjectID {}
@end

@interface _PathModel : BaseModel {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PathModelID* objectID;

@property (nonatomic, strong) NSDate* timeStarted;

//- (BOOL)validateTimeStarted:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* totalDistance;

@property (atomic) float totalDistanceValue;
- (float)totalDistanceValue;
- (void)setTotalDistanceValue:(float)value_;

//- (BOOL)validateTotalDistance:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* totalDuration;

@property (atomic) int16_t totalDurationValue;
- (int16_t)totalDurationValue;
- (void)setTotalDurationValue:(int16_t)value_;

//- (BOOL)validateTotalDuration:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *locations;

- (NSMutableSet*)locationsSet;

@end

@interface _PathModel (LocationsCoreDataGeneratedAccessors)
- (void)addLocations:(NSSet*)value_;
- (void)removeLocations:(NSSet*)value_;
- (void)addLocationsObject:(LocationModel*)value_;
- (void)removeLocationsObject:(LocationModel*)value_;

@end

@interface _PathModel (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveTimeStarted;
- (void)setPrimitiveTimeStarted:(NSDate*)value;

- (NSNumber*)primitiveTotalDistance;
- (void)setPrimitiveTotalDistance:(NSNumber*)value;

- (float)primitiveTotalDistanceValue;
- (void)setPrimitiveTotalDistanceValue:(float)value_;

- (NSNumber*)primitiveTotalDuration;
- (void)setPrimitiveTotalDuration:(NSNumber*)value;

- (int16_t)primitiveTotalDurationValue;
- (void)setPrimitiveTotalDurationValue:(int16_t)value_;

- (NSMutableSet*)primitiveLocations;
- (void)setPrimitiveLocations:(NSMutableSet*)value;

@end
