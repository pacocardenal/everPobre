//
//  PCATextTableViewCell.h
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCATextTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;

+ (CGFloat)height;
+ (NSString *)cellId;

@end
