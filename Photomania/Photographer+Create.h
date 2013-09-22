//
//  Photographer+Create.h
//  Photomania
//
//  Created by Ashley Robinson on 20/09/2013.
//  Copyright (c) 2013 Ashley Robinson. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)

+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context;

@end
