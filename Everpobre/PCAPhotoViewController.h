//
//  PCAPhotoViewController.h
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

@import UIKit;
@class PCANote;

@interface PCAPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)deletePhoto:(id)sender;
- (IBAction)takePhoto:(id)sender;
- (id)initWithModel:(PCANote *)model;
- (IBAction)vintagify:(id)sender;

@end
