//
//  PCAPhotoViewController.h
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

@import UIKit;
@class PCANote;

@interface PCAPhotoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)deletePhoto:(id)sender;
- (IBAction)takePhoto:(id)sender;
- (id)initWithModel:(PCANote *)model;

@end
