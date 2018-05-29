//
//  TrailerML.m
//  testFilmProject
//
//  Created by admin on 21.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import "TrailerML.h"

@implementation TrailerML

- (id)initWithTrailerServerResponse:(NSDictionary *)responseObject {
    
    self = [super init];
    if (!self) { return nil; }
    
    self.youtubeKeyString = [responseObject objectForKey:@"key"];
   
    return self;
}

@end
