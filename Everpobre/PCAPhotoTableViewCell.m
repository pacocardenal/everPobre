//
//  PCAPhotoTableViewCell.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCAPhotoTableViewCell.h"
#import "PCANote.h"
#import "PCAPhotoContainer.h"

@implementation PCAPhotoTableViewCell

#pragma mark - Properties

-(void)setNote:(PCANote *)note {
    // Guardamos la nota
    _note = note;
    
    // Sincronizamos los datos de la nota con la vista
    if (note.photo.image) {
        self.photoView.image = note.photo.image;
    }
    
}

// No se implementa el prepareForReuse porque no se va a reutilizar

#pragma mark - Class methods

+ (CGFloat)height {
    return 320.0f;
}

+ (NSString *)cellId {
    return [self description];
}

#pragma mark - Utils

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
