#import "PCANotebook.h"

@interface PCANotebook ()

// Private interface goes here.

@end

@implementation PCANotebook

+(instancetype)notebookWithName:(NSString *)name
                        context:(NSManagedObjectContext*)context {
    
    PCANotebook *nb = [self insertInManagedObjectContext:context];
    
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return  nb;
    
}

# pragma mark - Utils

-(NSArray *) observableKeys {
    return @[PCANotebookAttributes.name, PCANotebookRelationships.notes];
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
