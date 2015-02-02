// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PCAPhotoContainer.m instead.

#import "_PCAPhotoContainer.h"

const struct PCAPhotoContainerAttributes PCAPhotoContainerAttributes = {
	.photoData = @"photoData",
};

const struct PCAPhotoContainerRelationships PCAPhotoContainerRelationships = {
	.notes = @"notes",
};

@implementation PCAPhotoContainerID
@end

@implementation _PCAPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (PCAPhotoContainerID*)objectID {
	return (PCAPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

