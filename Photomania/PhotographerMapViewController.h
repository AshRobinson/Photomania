//
//  PhotographerMapViewController.h
//  Photomania
//
//  Created by Ashley Robinson on 22/09/2013.
//  Copyright (c) 2013 Ashley Robinson. All rights reserved.
//

#import "MapViewController.h"

@interface PhotographerMapViewController : MapViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)reload;

@end
