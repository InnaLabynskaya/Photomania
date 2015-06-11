//
//  Photo+Flickr.h
//  Photomania
//
//  Created by Inna Labuns'ka on 11.06.15.
//  Copyright (c) 2015 Inna Labuns'ka. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)

+ (Photo *)photoWithFlickInfo:(NSDictionary *)photoDictionary inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)loadPhotosFromFlickrArray:(NSArray *)photos intoManagedObjectContext:(NSManagedObjectContext *)context;

@end
