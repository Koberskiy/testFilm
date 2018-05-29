//
//  AppDelegate.m
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "MainVC.h"

@interface AppDelegate ()
@property (nonatomic) NSManagedObjectContext* context;
@end

@implementation AppDelegate

#pragma mark - Life Cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.frame = [[UIScreen mainScreen] bounds];
    [self.window makeKeyAndVisible];
    
    MainVC *main = [[MainVC alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:main];
    self.window.rootViewController = navigationController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark - Core Data stack
@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"testFilmDataModel"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                   
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support
- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
