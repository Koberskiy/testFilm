//
//  FilmML.m
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import "FilmML.h"


@implementation FilmML

- (id)initWithServerResponse:(NSDictionary*)responseObject {
   
    self = [super init];
    if (!self) { return nil; }

    
    
    self.imagePosterString = [responseObject objectForKey:@"backdrop_path"];
    self.moveIdString = [responseObject objectForKey:@"id"];
    self.originalLangString = [responseObject objectForKey:@"original_language"];
    self.titleString = [responseObject objectForKey:@"original_title"];
    self.overviewString = [responseObject objectForKey:@"overview"];
    self.popularityString = [responseObject objectForKey:@"popularity"];
    self.releaseDateString = [responseObject objectForKey:@"release_date"];
    
    
    
    
    return self;
}

@end
