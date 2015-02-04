//
//  PCANotebooksViewController.m
//  Everpobre
//
//  Created by Paco on 4/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCANotebooksViewController.h"
#import "PCANotebook.h"
#import "PCANotesViewController.h"
#import "PCANote.h"

@interface PCANotebooksViewController ()

@end

@implementation PCANotebooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Everpobre";
    
    // Añadimos botón de nueva libreta
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                            target:self
                                                                            action:@selector(addNotebook:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Averiguamos de qué libreta me hablan
    PCANotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creo una celda
    static NSString *cellId = @"NotebookId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellId];
    }
    
    // La configuro (sincronizo modelo -> vista)
    cell.textLabel.text = nb.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;

    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%lu notes)",
                                 [fmt stringFromDate:nb.modificationDate], (unsigned long)nb.notes.count];
    
    // La devuelvo
    return cell;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Averiguar si se quiere eliminar
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Borramos la libreta. Tenemos que averiguar cual es
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        PCANotebook *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
    }
    
}

- (NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"Remove";
    
}

#pragma mark - Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Averiguar cual es la libreta
    PCANotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creo la selección de datos
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[PCANote entityName]];
    
    r.fetchBatchSize = 30;
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:PCANoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:PCANoteAttributes.modificationDate
                                                        ascending:NO]];
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", nb];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:r
                                                                         managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                           sectionNameKeyPath:nil cacheName:nil];
    
    // Creo una instancia de controlador de notas
    PCANotesViewController *nVC = [[PCANotesViewController alloc]initWithFetchedResultsController:fc
                                                                                            style:UITableViewStylePlain];
    
    // Lo pusheo
    [self.navigationController pushViewController:nVC animated:YES];
    
}

#pragma mark - Actions

- (void)addNotebook:(id)sender {
    
    // Crear una libreta
    [PCANotebook notebookWithName:@"Nueva  libreta"
                          context:self.fetchedResultsController.managedObjectContext];
    
    
}

@end
