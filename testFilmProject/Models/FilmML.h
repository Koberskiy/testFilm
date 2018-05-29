//
//  FilmML.h
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmML : NSObject

@property (strong, nonatomic) NSString* imagePosterString;
@property (strong, nonatomic) NSString* moveIdString;
@property (strong, nonatomic) NSString* originalLangString;
@property (strong, nonatomic) NSString* titleString;
@property (strong, nonatomic) NSString* overviewString;
@property (strong, nonatomic) NSNumber* popularityString;
@property (strong, nonatomic) NSString* releaseDateString;


- (id)initWithServerResponse:(NSDictionary*)responseObject;

@end
