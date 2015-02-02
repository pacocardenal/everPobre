// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PCAPhotoContainer.h instead.

@import CoreData;

extern const struct PCAPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} PCAPhotoContainerAttributes;

extern const struct PCAPhotoContainerRelationships {
	__unsafe_unretained NSString *notes;
} PCAPhotoContainerRelationships;

@class PCANote;

@interface PCAPhotoContainerID : NSManagedObjectID {}
@end

@interface _PCAPhotoContainer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PCAPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _PCAPhotoContainer (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(PCANote*)value_;
- (void)removeNotesObject:(PCANote*)value_;

@end

@interface _PCAPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
