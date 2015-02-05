//
//  PCADatesTableViewCell.h
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCADatesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *modificationDate;
@property (weak, nonatomic) IBOutlet UILabel *creationDate;

+ (CGFloat)height;
+ (NSString *)cellId;

@end
