//
//  PCANotebookTableViewCell.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCANotebookTableViewCell.h"

@implementation PCANotebookTableViewCell

#pragma mark - Class methods

+ (CGFloat)height {
    return 60.0;
}

+ (NSString *)cellId {
    return [self description];
}

#pragma mark - TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
