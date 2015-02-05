//
//  PCANameTableViewCell.h
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCANameTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *nameField;

+ (CGFloat)height;
+ (NSString *)cellId;

@end
