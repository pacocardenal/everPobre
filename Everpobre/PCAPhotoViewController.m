//
//  PCAPhotoViewController.m
//  Everpobre
//
//  Created by Paco on 5/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCAPhotoViewController.h"
#import "PCANote.h"
#import "PCAPhotoContainer.h"

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
}

- (IBAction)takePhoto:(id)sender {
}
@end
