//
//  PCANotebookTableViewCell.h
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

@import UIKit;

@interface PCANotebookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *notesView;

+ (CGFloat)height;
+ (NSString *)cellId;

@end
