//
//  ServerManager.m
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//


#import "ServerManager.h"
#import "AFNetworking.h"
#import "Helper.h"
#import "FilmML.h"
#import "TrailerML.h"
#import "Const.h"

@interface ServerManager ()
@property (strong, nonatomic) AFHTTPRequestOperationManager *ROM;
@property (strong, nonatomic) NSString *apiKey;
@end

@implementation ServerManager

@synthesize ROM;

#pragma mark - init
- (id)init{
    
    self = [super init];
    if(self){
        NSURL *baseUrl = [NSURL URLWithString:BASE_URL];
        ROM = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseUrl];
    }
    return self;
}

#pragma mark - SharedManager
+ (ServerManager*) sharedManager {
    if(![Helper internetConnect]){
     //   [Helper showAlert:@"Network Error" message:@"Need connection to internet" cancelButton:@"OK"];
        NSLog(@"Need connection to internet");
        return FALSE;
    }
    
    static ServerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    return manager;
}

#pragma mark - GET
- (void) getTopFilmsFromServer:(NSDictionary*)postData
                     onSuccess:(void(^)(NSArray* result))success
                     onFailure:(void(^)(NSError *error))failure {
    [ROM GET:
   // movie/popular
   // @"movie/top_rated?%@",API_KEY
     [NSString stringWithFormat:@"movie/popular?%@",API_KEY]
    parameters:nil
     success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
         
         NSArray* dataArray  = [responseObject objectForKey:@"results"];
         NSMutableArray* dataObjectMutArray = [NSMutableArray array];
         
         for (NSDictionary* dictData in dataArray) {
             FilmML *model = [[FilmML alloc] initWithServerResponse:dictData];
             [dataObjectMutArray addObject:model];
         }
         
         if (success) {
             success(dataObjectMutArray);
         }
         
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"%@", error);
         
     }];
}

- (void) getVidesToMovies:(NSDictionary*)postData
                   moveID:(long)moveId
                onSuccess:(void(^)(NSArray* result))success
                onFailure:(void(^)(NSError *error))failure {
    
    [ROM GET:
    [NSString stringWithFormat:@"movie/%ld/videos?%@",(long)moveId, API_KEY]
    parameters:postData
     success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
      
         NSArray* dataArray  = [responseObject objectForKey:@"results"];
         NSMutableArray* dataObjectMutArray = [NSMutableArray array];
         
         for (NSDictionary* dictData in dataArray) {
             TrailerML *model = [[TrailerML alloc] initWithTrailerServerResponse:dictData];
             [dataObjectMutArray addObject:model];
         }
         
         if (success) {
             success(dataObjectMutArray);
         }
         
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

@end
