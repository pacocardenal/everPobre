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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

@end
