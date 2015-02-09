//
//  PCANoteTableViewController.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

// Constantes
#define NUMBER_OF_SECTIONS  4

#define NAME_SECTION_HEADER        @"Name"
#define DATES_SECTION_HEADER       @"Created and last modified"
#define TEXT_SECTION_HEADER        @"Text"
#define PHOTO_SECTION_HEADER       @"Photo"

// TO-DO: Create enum
#define NAME_SECTION        0
#define DATES_SECTION       1
#define TEXT_SECTION        2
#define PHOTO_SECTION       3

#import "PCANoteTableViewController.h"
#import "PCANote.h"
#import "PCANameTableViewCell.h"
#import "PCATextTableViewCell.h"
#import "PCADatesTableViewCell.h"
#import "PCAPhotoTableViewCell.h"
#import "PCAPhotoViewController.h"

@interface PCANoteTableViewController ()

@end

@implementation PCANoteTableViewController

-(id)initWithModel:(PCANote *)model {
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _note = model;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerNibs];
    
    // Registrar las celdas
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
        case DATES_SECTION:
            return DATES_SECTION_HEADER;
            break;
        case TEXT_SECTION:
            return TEXT_SECTION_HEADER;
            break;
        case PHOTO_SECTION:
            return PHOTO_SECTION_HEADER;
            break;
        // Never reaches default
        default:
            [NSException raise:@"Section doesn't exist" format:nil];
            return nil;
            break;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Averiguamos de qué celda nos habla
    switch (indexPath.section) {
        case NAME_SECTION:
        {
            PCANameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PCANameTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;
        }
        case DATES_SECTION: {
            PCADatesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PCADatesTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;
        }
        case TEXT_SECTION: {
            PCATextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PCATextTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;
        }
        case PHOTO_SECTION: {
            PCAPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PCAPhotoTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;
        }
        default:
            [NSException raise:@"UnknownSection" format:@"Unknown section %ld",(long)indexPath.section];
            return nil;
            break;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case NAME_SECTION:
            return [PCANameTableViewCell height];
            break;
        case DATES_SECTION:
            return [PCADatesTableViewCell height];
            break;
        case TEXT_SECTION:
            return [PCATextTableViewCell height];
            break;
        case PHOTO_SECTION:
            return [PCAPhotoTableViewCell height];
        default:
            return 0;
            break;
    }
    
}
- (void) registerNibs {
    
    NSBundle *main = [NSBundle mainBundle];
    
    UINib *nameNib = [UINib nibWithNibName:@"PCANameTableViewCell" bundle:main];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[PCANameTableViewCell cellId]];
    
    UINib *datesNib = [UINib nibWithNibName:@"PCADatesTableViewCell" bundle:main];
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[PCADatesTableViewCell cellId]];
    
    UINib *textNib = [UINib nibWithNibName:@"PCATextTableViewCell" bundle:main];
    [self.tableView registerNib:textNib forCellReuseIdentifier:[PCATextTableViewCell cellId]];
    
    UINib *photoNib = [UINib nibWithNibName:@"PCAPhotoTableViewCell" bundle:main];
    [self.tableView registerNib:photoNib forCellReuseIdentifier:[PCAPhotoTableViewCell cellId]];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == PHOTO_SECTION) {
        
        // Mostramos el controlador de fotos
        PCAPhotoViewController *pVC = [[PCAPhotoViewController alloc]initWithModel:self.note];
        [self.navigationController pushViewController:pVC animated:YES];
        
    }
    
}

/*
 AGTNameTableViewCell: No puede haber una nota sin nombre.
 Valida (usando el UITextFieldDelegate) que el usuario ha escrito algo.
 En caso contrario, mírate UIAlertViewController y muéstrale una alerta llamándole la atención
 */


@end
