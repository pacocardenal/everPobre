//
//  PCANoteTableViewController.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
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
