//
//  PCATextTableViewCell.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCATextTableViewCell.h"
#import "PCANote.h"

@implementation PCATextTableViewCell

#pragma mark - Class Methods

+ (CGFloat)height{
    return 320.0f;
}

+ (NSString *)cellId{
    return [self description];
}

#pragma mark - Properties

- (void)setNote:(PCANote *)note {
    // Guardamos la nota
    _note = note;
    
    // Mostramos el texto en la vista
    self.textView.text = note.text;
}

#pragma mark - Misc
- (void)prepareForReuse {
    [super prepareForReuse];
    
    // Guardo lo que haya escrito el usuario en la nota
    self.note.text = self.textView.text;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
