// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PCANotebook.m instead.

#import "_PCANotebook.h"

const struct PCANotebookAttributes PCANotebookAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
};

const struct PCANotebookRelationships PCANotebookRelationships = {
	.notes = @"notes",
};

@implementation PCANotebookID
@end

@implementation _PCANotebook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Notebook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Notebook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Notebook" inManagedObjectContext:moc_];
}

- (PCANotebookID*)objectID {
	return (PCANotebookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

