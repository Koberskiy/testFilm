//
//  Helper.m
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import "Helper.h"
#import "Reachability.h"

@implementation Helper

#pragma mark - System
+(NSInteger)internetConnect{
    NSInteger statusConnect = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    return statusConnect;
}

+(BOOL)internetConnectByHost{
    NSString *urlString = @"www.google.com/";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"HEAD"];
    NSHTTPURLResponse *response;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error: NULL];
    return ([response statusCode] == 200) ? YES : NO;
}

#pragma mark - NSStringMethods
+(BOOL)emptyString:(NSString*)checkString{
    if ([checkString isEqual:[NSNull null]] || checkString == nil || checkString.length < 1) {
        return YES;
    }
    return NO;
}

@end
