//
//  PCANotesViewController.h
//  Everpobre
//
//  Created by Paco on 4/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
#import "PCANotebook.h"

@interface PCANotesViewController : AGTCoreDataTableViewController

@property (strong, nonatomic) PCANotebook *notebook;

@end
