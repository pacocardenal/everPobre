//
//  PCADatesTableViewCell.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCADatesTableViewCell.h"
#import "PCANote.h"

@implementation PCADatesTableViewCell

+ (CGFloat)height{
    return 44.0f;
}

+ (NSString *)cellId{
    return [self description];
}

- (void)setNote:(PCANote *)note {
    
    // Guardar la nota
    _note = note;
    
    // Observamos modificationDate y cuando cambia la mostramos en la vista
    [self.note addObserver:self forKeyPath:PCANoteAttributes.modificationDate options:0 context:NULL];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    // Hay que darse de baja de las notificaciones de KVO!!!
    [self.note removeObserver:self forKeyPath:PCANoteAttributes.modificationDate];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    // Sincronizamos el nuevo valor de modificationDate
    [self syncNoteWithView];
}

- (void)syncNoteWithView {
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    
    fmt.dateStyle = NSDateFormatterShortStyle;
    self.creationDate.text = [fmt stringFromDate:self.note.creationDate];
    
    fmt.dateStyle = NSDateIntervalFormatterFullStyle; // Con milisegundos para probar KVO
    self.modificationDate.text = [fmt stringFromDate:self.note.modificationDate];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
