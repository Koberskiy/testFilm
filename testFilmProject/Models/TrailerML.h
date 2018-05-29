//
//  TrailerML.h
//  testFilmProject
//
//  Created by admin on 21.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrailerML : NSObject

@property (strong, nonatomic) NSString* youtubeKeyString;

- (id) initWithTrailerServerResponse:(NSDictionary*)responseObject;

@end
