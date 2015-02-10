//
//  PCAPhotoViewController.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

@import CoreImage;

#import "PCAPhotoViewController.h"
#import "PCANote.h"
#import "PCAPhotoContainer.h"
#import "PCAPhotoContainer.h"
#import "UIImage+Resize.h"

@interface PCAPhotoViewController ()
@property (strong, nonatomic) PCANote *model;
@end

@implementation PCAPhotoViewController

- (id)initWithModel:(PCANote *)model {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Sincronizamos movelo y vista
    self.photoView.image = self.model.photo.image;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Sincronizamos vista y modelo
    self.model.photo.image = self.photoView.image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deletePhoto:(id)sender {
    
    // Cargamos los valores anteriores para devolver la vista a su estado
    CGRect oldRect = self.photoView.bounds;
    
    // Animación
    [UIView animateWithDuration:0.8
                          delay:0
                        options:0
                     animations:^{
                         
                         // Estado final (se va a animar)
                         self.photoView.bounds = CGRectZero;
                         self.photoView.alpha = 0;
                         
                     } completion:^(BOOL finished) {
                         
                         // Quitar la foto del modelo
                         self.model.photo.image = nil;
                         
                         // Quitar la foto de la vista
                         self.photoView.image = nil;
                         
                         // Dejamos la vista como estaba
                         self.photoView.bounds = oldRect;
                         self.photoView.alpha = 1.0;
                         
                     }];
    
    [UIView animateWithDuration:0.8
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:1.0
                        options:0
                     animations:^{
                         // Transfomada afín
                         self.photoView.transform = CGAffineTransformMakeRotation(M_PI_2);
                     } completion:^(BOOL finished) {
                         self.photoView.transform = CGAffineTransformIdentity;
                     }];
    
    
}

- (IBAction)takePhoto:(id)sender {
    
    // Crear un picker
    UIImagePickerController *picker = [UIImagePickerController new];
    
    // Configurar
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // Tenemos cámara
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        // Nos conformamos con el carrete
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.delegate = self;
    // Cambiamos la transición de presentación de la cámara (o álbum)
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    // Presentar
    [self presentViewController:picker animated:YES completion:^{
        // Nos ahorramos el protocolo delegado cuando termina de presentarse
        NSLog(@"Terminé de cargar");
    }];
}

- (IBAction)vintagify:(id)sender {
    
    // Creamos un contexto
    CIContext *context = [CIContext contextWithOptions:nil];
    
    // Obtenemos la imagen original
    CIImage *original = [CIImage imageWithCGImage:self.model.photo.image.CGImage];
    
    // Creamos y configuramos el filtro
    CIFilter *falseColor = [CIFilter filterWithName:@"CIFalseColor"];
    [falseColor setDefaults];
    [falseColor setValue:original forKey:@"InputImage"];
    
    // Obtengo la imagen de salida
    CIImage *output = falseColor.outputImage;
    
    // Creamos el filtro de viñeta
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignette"];
    [vignette setDefaults];
    [vignette setValue:@8 forKey:@"InputIntensity"];
    
    // Los encadenamos
    [vignette setValue:output forKey:@"InputImage"];
    
    output = vignette.outputImage;
    
    // Aplicamos el filtro
    CGImageRef final = [context createCGImage:output fromRect:[output extent]];
    
    // Obtengo la imagen en forma de UIImage
    UIImage *finalImg = [UIImage imageWithCGImage:final];
    
    // Liberamos recursos
    CGImageRelease(final);
    
    // Incluimos en UIImageView
    self.photoView.image = finalImg;
    self.model.photo.image = finalImg;
}

#pragma mark - UIImagePickerControllerDelegate
                              
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    // Ojo, pico de memoria
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // Reducimos la imagen para que tenga el tamaño de la pantalla
    // TO-DO : if para diferenciar cámara y carrete
    
    // Reducimos la imagen para que tenga la mitad del tamaño original.
    // Lo correcto sería que coinicda con el tamaño de la pantalla, pero habría que calcular la escala
    CGSize newSize = CGSizeMake(img.size.width * 0.5, img.size.height * 0.5);
    // Este método, con imágenes grandes y máxima calidad va a tardar un poco.
    // Lo ideal sería pasarlo a segundo plano con GCD.
    img = [img resizedImage:newSize interpolationQuality:kCGInterpolationHigh];
    
    self.model.photo.image = img;
    
    // Ocultar el picker
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
