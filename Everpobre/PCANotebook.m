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
    return @[PCANotebookAttributes.name, PCANotebookRelationships.notes];
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
