//
//  PCATextTableViewCell.h
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

@import UIKit;
@class PCANote;

@interface PCATextTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) PCANote *note;

+ (CGFloat)height;
+ (NSString *)cellId;

@end
