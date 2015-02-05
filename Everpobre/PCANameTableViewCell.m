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

@end

@implementation PCANameTableViewCell

#pragma mark - Properties

-(void)setNote:(PCANote *)note {
    // Sincronizamos la vista con la nota (del modelo a la vista)
    self.nameField.text = note.name;
    
    // Guardamos la nota
    _note = note;
}

+ (CGFloat)height {
    return 44.0f;
}

+ (NSString *)cellId {
    return [self description];
}

#pragma mark - Misc

- (void)prepareForReuse {
    [super prepareForReuse];
    
    // Cuando desaparezco, me mandan este mensaje para que me resetee
    // y me prepare para ser reutilizado. Similar al viewWillDisappear
    
    // Sincroniza la vista con la nota por si hubo cambios (saco de la vista y meto en el modelo)
    self.note.name = self.nameField.text;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
