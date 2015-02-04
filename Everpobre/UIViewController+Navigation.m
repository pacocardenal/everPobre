//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Paco on 4/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) pcaWrappedInNavigation {
    
    UINavigationController *nav = [UINavigationController new];
    [nav pushViewController:self animated:NO];
    
    return nav;
    
}

@end
