#import "PCAPhotoContainer.h"

@interface PCAPhotoContainer ()

// Private interface goes here.

@end

@implementation PCAPhotoContainer

// Custom logic goes here.

-(UIImage *)image {
    
    //Crear imagen desde NSData
    
    return [UIImage imageWithData:self.photoData];
    
}

- (void)setImage:(UIImage *)image {
    
    //Convertir imagen en NSData
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

@end
