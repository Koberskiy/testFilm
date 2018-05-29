//
//  testFilmProjectTests.m
//  testFilmProjectTests
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FilmML.h"

@interface testFilmProjectTests : XCTestCase

@property (strong, nonatomic) FilmML *model;

@end

@implementation testFilmProjectTests

- (void)setUp {
    [super setUp];
    self.model = [[FilmML alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
   // [_model init];
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
