// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PathModel.m instead.

#import "_PathModel.h"

const struct PathModelAttributes PathModelAttributes = {
	.timeStarted = @"timeStarted",
	.totalDistance = @"totalDistance",
	.totalDuration = @"totalDuration",
};

const struct PathModelRelationships PathModelRelationships = {
	.locations = @"locations",
};

@implementation PathModelID
@end

@implementation _PathModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PathModel" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PathModel";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PathModel" inManagedObjectContext:moc_];
}

- (PathModelID*)objectID {
	return (PathModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"totalDistanceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"totalDistance"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"totalDurationValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"totalDuration"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic timeStarted;

@dynamic totalDistance;

- (float)totalDistanceValue {
	NSNumber *result = [self totalDistance];
	return [result floatValue];
}

- (void)setTotalDistanceValue:(float)value_ {
	[self setTotalDistance:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveTotalDistanceValue {
	NSNumber *result = [self primitiveTotalDistance];
	return [result floatValue];
}

- (void)setPrimitiveTotalDistanceValue:(float)value_ {
	[self setPrimitiveTotalDistance:[NSNumber numberWithFloat:value_]];
}

@dynamic totalDuration;

- (int16_t)totalDurationValue {
	NSNumber *result = [self totalDuration];
	return [result shortValue];
}

- (void)setTotalDurationValue:(int16_t)value_ {
	[self setTotalDuration:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveTotalDurationValue {
	NSNumber *result = [self primitiveTotalDuration];
	return [result shortValue];
}

- (void)setPrimitiveTotalDurationValue:(int16_t)value_ {
	[self setPrimitiveTotalDuration:[NSNumber numberWithShort:value_]];
}

@dynamic locations;

- (NSMutableSet*)locationsSet {
	[self willAccessValueForKey:@"locations"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"locations"];

	[self didAccessValueForKey:@"locations"];
	return result;
}

@end

