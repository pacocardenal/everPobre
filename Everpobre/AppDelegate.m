//
//  AppDelegate.m
//  Everpobre
//
//  Created by Paco on 2/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "PCANotebook.h"
#import "PCANote.h"
#import "PCAPhotoContainer.h"
#import "PCANotebooksViewController.h"
#import "UIViewController+Navigation.h"

@interface AppDelegate ()
@property (strong, nonatomic) AGTCoreDataStack *stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Creamos el stack
    // A partir de esto ya podemos empezar a crear objectos PCANote, PCANotebook...
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    // Creamos datos chorras
    //[self createDummyData];
    
    // Creamos el conjunto de datos
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[PCANotebook entityName]];
    r.fetchBatchSize = 30;
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:PCANoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:PCANoteAttributes.modificationDate
                                                        ascending:NO]];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]initWithFetchRequest:r
                                                                        managedObjectContext:self.stack.context sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    
    // Creamos el controlador
    PCANotebooksViewController *nbVC = [[PCANotebooksViewController alloc] initWithFetchedResultsController:fc
                                                                                                      style:UITableViewStylePlain];
    
    // Lo mostramos
    self.window.rootViewController = [nbVC pcaWrappedInNavigation];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %@", error);
    }];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %@", error);
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Utils

- (void)createDummyData {
    
    // [self.stack zapAllData];
    
    PCANotebook *nb = [PCANotebook notebookWithName:@"Ex-novias para el recuerdo"
                                            context:self.stack.context];
    
    [PCANote noteWithName:@"Mariana Dávalos"
                 notebook:nb
                  context:self.stack.context];
    
    [PCANote noteWithName:@"Camila Dávalos"
                 notebook:nb
                  context:self.stack.context];
    
    [PCANote noteWithName:@"Pampita"
                 notebook:nb
                  context:self.stack.context];
    
}

- (void)trastearConDatos {
    
    PCANotebook *apps = [PCANotebook notebookWithName:@"Ideas de Apps"
                                              context:self.stack.context];
    
    PCANote *iCachete = [PCANote noteWithName:@"iCachete"
                                     notebook:apps
                                      context:self.stack.context];
    
    // Comprobar que modificationDate se actualiza
    NSLog(@"Antes: %@", iCachete.modificationDate);
    iCachete.text = @"App educativa para reforzar la coordinación motora fina y los reflejos";
    NSLog(@"Después: %@", iCachete.modificationDate);
    
    // Búsqueda
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[PCANote entityName]];
    // Carga 20 registros
    r.fetchBatchSize = 20;
    // Ordena primero por el nombre y luego por fecha de modificación
    // caseInsensitiveCompare : no tiene en cuenta mayúsculas y minúsculas
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:PCANoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:PCANoteAttributes.modificationDate
                                                        ascending:NO]];
    
    // Indicamos condiciones con lenguaje de predicado
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", apps];
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:r
                                                     error:&err];
    
    if (res == nil) {
        // Error
        NSLog(@"Error al buscar: %@", err);
    } else {
        NSLog(@"Número de notas: %lu", (unsigned long)[res count]);
        NSLog(@" las notas: %@", res);
        
        // De verdad es un array?
        // No se debe obligar a cargar todo en memoria (res class). Sólo para ejemplo
        NSLog(@"Clase: %@", [res class]);
    }
    
    // Borrar
    [self.stack.context deleteObject:apps]; //Borro la libreta
    
    r.predicate = nil;
    res = [self.stack.context executeFetchRequest:r
                                            error:&err];
    
    if (res ==  nil) {
        NSLog(@"Error al buscar de nuevo: %@", res);
    }
    
    NSLog(@"Notas existentes: %@", res);
    
    // Guardamos
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %@", error);
    }];
    
}

@end
