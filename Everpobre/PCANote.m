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

# pragma mark - Lifecycle

-(void)awakeFromInsert {
    [super awakeFromInsert];
    // Se llama una vez en la vida
    [self setupKVO];
}

-(void) awakeFromFetch {
    [super awakeFromFetch];
    // Se llama n veces
    [self setupKVO];
}

-(void) willTurnIntoFault {
    [super willTurnIntoFault];
    
    [self tearDownKVO];
}

-(NSArray *) observableKeys {
    return @[PCANoteAttributes.name, PCANoteAttributes.text, PCANoteRelationships.photo, PCANoteRelationships.notebook, @"photo.photoData"];
}

# pragma mark - KVO

-(void) setupKVO {
    
    // Alta en notificaciones para las propiedades
    // que quiero observar
    
    for (NSString * key in [self observableKeys]) {
        [self addObserver:self forKeyPath:key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    }
    
}

-(void)tearDownKVO {
    
    // Baja en todas las listas de Spam
    for (NSString * key in [self observableKeys]) {
        [self removeObserver:self forKeyPath:key];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    
    // Solo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
    
}

@end
