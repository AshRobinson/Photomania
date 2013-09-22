//
//  PhotosByPhotographerCDTVC.h
//  Photomania
//
//  Created by Ashley Robinson on 21/09/2013.
//  Copyright (c) 2013 Ashley Robinson. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "Photographer.h"

@interface PhotosByPhotographerCDTVC : CoreDataTableViewController

@property (nonatomic, strong) Photographer *photographer;

@end
