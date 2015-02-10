// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PCANote.m instead.

#import "_PCANote.h"

const struct PCANoteAttributes PCANoteAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
	.text = @"text",
};

const struct PCANoteRelationships PCANoteRelationships = {
	.locations = @"locations",
	.notebook = @"notebook",
	.photo = @"photo",
};

@implementation PCANoteID
@end

@implementation _PCANote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (PCANoteID*)objectID {
	return (PCANoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic text;

@dynamic locations;

@dynamic notebook;

@dynamic photo;

@end

