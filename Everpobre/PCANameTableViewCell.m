//
//  PCANameTableViewCell.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCANameTableViewCell.h"
#import "PCANote.h"

@interface PCANameTableViewCell()
@property (strong, nonatomic) PCANote *note;
@end

@implementation PCANameTableViewCell

+ (CGFloat)height {
    return 44.0f;
}

+ (NSString *)cellId {
    return [self description];
}

#pragma - KVO

- (void)observeNote:(PCANote *) note {
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
