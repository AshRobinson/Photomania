//
//  Photo+Flickr.h
//  Photomania
//
//  Created by Ashley Robinson on 20/09/2013.
//  Copyright (c) 2013 Ashley Robinson. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)

+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context;

@end
