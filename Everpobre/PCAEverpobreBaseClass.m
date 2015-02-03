//
//  PCAEverpobreBaseClass.m
//  Everpobre
//
//  Created by Paco on 3/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCAEverpobreBaseClass.h"

@implementation PCAEverpobreBaseClass

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
    return nil;
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

@end
