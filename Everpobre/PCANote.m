#import "PCANote.h"
#import "PCAPhotoContainer.h"

@interface PCANote ()

// Private interface goes here.

@end

@implementation PCANote

+(instancetype)noteWithName:(NSString *)name
                   notebook:(PCANotebook *)notebook
                    context:(NSManagedObjectContext *)context {
    
    PCANote *note = [self insertInManagedObjectContext:context];
    
    note.name = name;
    note.notebook = notebook;
    note.creationDate = [NSDate date];
    note.photo = [PCAPhotoContainer insertInManagedObjectContext:context];
    note.modificationDate = [NSDate date];
    
    return note;
    
}

# pragma mark - Utils

-(NSArray *) observableKeys {
    return @[PCANoteAttributes.name,
             PCANoteAttributes.text,
             PCANoteRelationships.photo,
             PCANoteRelationships.notebook,
             @"photo.photoData"];
}

# pragma mark - KVO

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    
    // Solo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
    
}

@end
