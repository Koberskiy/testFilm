//
//  Helper.h
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

#pragma mark - System
+ (NSInteger)internetConnect;
+ (BOOL)internetConnectByHost;

#pragma mark - String
+ (BOOL)emptyString:(NSString*)checkString;

@end
