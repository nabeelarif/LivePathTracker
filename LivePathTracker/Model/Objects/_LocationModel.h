// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LocationModel.h instead.

#import <CoreData/CoreData.h>
#import "BaseModel.h"

extern const struct LocationModelAttributes {
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *timeStamp;
} LocationModelAttributes;

extern const struct LocationModelRelationships {
	__unsafe_unretained NSString *path;
} LocationModelRelationships;

@class PathModel;

@interface LocationModelID : NSManagedObjectID {}
@end

@interface _LocationModel : BaseModel {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LocationModelID* objectID;

@property (nonatomic, strong) NSNumber* latitude;

@property (atomic) double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* longitude;

@property (atomic) double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* timeStamp;

//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) PathModel *path;

//- (BOOL)validatePath:(id*)value_ error:(NSError**)error_;

@end

@interface _LocationModel (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;

- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;

- (PathModel*)primitivePath;
- (void)setPrimitivePath:(PathModel*)value;

@end
