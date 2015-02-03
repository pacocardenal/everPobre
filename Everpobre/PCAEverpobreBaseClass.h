//
//  PCAEverpobreBaseClass.h
//  Everpobre
//
//  Created by Paco on 3/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface PCAEverpobreBaseClass : NSManagedObject

-(NSArray *) observableKeys;
-(void) setupKVO;
-(void)tearDownKVO;

@end
