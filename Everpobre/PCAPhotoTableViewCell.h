//
//  PCAPhotoTableViewCell.h
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PCANote;

@interface PCAPhotoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) PCANote *note;

+ (CGFloat)height;
+ (NSString *)cellId;

@end
