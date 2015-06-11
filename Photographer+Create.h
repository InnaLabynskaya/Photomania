//
//  Photographer+Create.h
//  Photomania
//
//  Created by Inna Labuns'ka on 11.06.15.
//  Copyright (c) 2015 Inna Labuns'ka. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)

+ (Photographer *)photographerWithName:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)context;

@end
