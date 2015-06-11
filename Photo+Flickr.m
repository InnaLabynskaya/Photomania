//
//  Photo+Flickr.m
//  Photomania
//
//  Created by Inna Labuns'ka on 11.06.15.
//  Copyright (c) 2015 Inna Labuns'ka. All rights reserved.
//

#import "Photo+Flickr.h"
#import "FlickrFetcher.h"
#import "Photographer+Create.h"

@implementation Photo (Flickr)

+ (Photo *)photoWithFlickInfo:(NSDictionary *)photoDictionary inManagedObjectContext:(NSManagedObjectContext *)context
{
    Photo *photo = nil;
    NSString *unique = photoDictionary[FLICKR_PHOTO_ID];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", unique];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if(!matches || error || (matches.count > 1)) {
        
    } else if(matches.count) {
        photo = [matches firstObject];
    } else {
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:context];
        photo.unique = unique;
        photo.title = [photoDictionary valueForKeyPath:FLICKR_PHOTO_TITLE];
        photo.subtitle = [photoDictionary valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
        photo.imageURL = [[FlickrFetcher URLforPhoto:photoDictionary format:FlickrPhotoFormatLarge] absoluteString];
        NSString *photographerName = [photoDictionary valueForKeyPath:FLICKR_PHOTO_OWNER];
        photo.whoTook = [Photographer photographerWithName:photographerName inManagedObjectContext:context];
    }
    return photo;
}

+ (void)loadPhotosFromFlickrArray:(NSArray *)photos intoManagedObjectContext:(NSManagedObjectContext *)context
{
    
}

@end
