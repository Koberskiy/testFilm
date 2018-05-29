//
//  MainVC.m
//  testFilmProject
//
//  Created by admin on 17.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import "MainVC.h"
#import "ServerManager.h"
#import "ListofFilmsVC.h"

@interface MainVC ()

@end

@implementation MainVC

#pragma mark - Life Cycle
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Actions
- (IBAction)enterAction:(id)sender {
    ListofFilmsVC *list = [[ListofFilmsVC alloc]init];
    [self.navigationController pushViewController:list animated:YES];
}

@end
