//
//  PCANotesViewController.m
//  Everpobre
//
//  Created by Paco on 4/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "PCANotesViewController.h"
#import "PCANote.h"
#import "PCAPhotoContainer.h"

@interface PCANotesViewController ()

@end

@implementation PCANotesViewController

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Averiguar la nota
    PCANote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creamos la celda
    static NSString *cellId = @"noteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // La configuramos
    cell.imageView.image = n.photo.image;
    cell.textLabel.text = n.name;
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateIntervalFormatterMediumStyle;
    cell.detailTextLabel.text = [fmt stringFromDate:n.modificationDate];
    
    // La devolvemos
    return cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
