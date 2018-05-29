//
//  ServerManager.h
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerManager : NSObject

#pragma mark - SharedManager
+ (ServerManager*) sharedManager;

#pragma mark - GET
- (void) getTopFilmsFromServer:(NSDictionary*)postData onSuccess:(void(^)(NSArray* result))success onFailure:(void(^)(NSError *error))failure;

- (void) getVidesToMovies:(NSDictionary*)postData moveID:(long)moveId onSuccess:(void(^)(NSArray* result))success onFailure:(void(^)(NSError *error))failure;
@end
