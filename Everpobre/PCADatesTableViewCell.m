//
//  PCADatesTableViewCell.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCADatesTableViewCell.h"

@implementation PCADatesTableViewCell

+ (CGFloat)height{
    return 44.0f;
}

+ (NSString *)cellId{
    return [self description];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end