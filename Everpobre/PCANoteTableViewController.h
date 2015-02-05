//
//  PCANoteTableViewController.h
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PCANote;

@interface PCANoteTableViewController : UITableViewController

@property (strong, nonatomic) PCANote *note;

-(id)initWithModel:(PCANote *)model;

@end
