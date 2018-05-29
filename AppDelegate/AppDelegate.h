//
//  AppDelegate.h
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL videoIsInFullscreen;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
- (void)saveContext;

@end

