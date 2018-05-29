//
//  ListofFilmsVC.m
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import "ListofFilmsVC.h"
#import "FilmTVCell.h"
#import "FilmML.h"
#import "ServerManager.h"
#import "FilmDetailsVC.h"
#import "AppDelegate.h"

@interface ListofFilmsVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic)    AppDelegate* appDelegate;
@property (weak, nonatomic)    NSManagedObjectContext* context;
@property (weak, nonatomic)    NSArray* dictionaries;

@property (weak, nonatomic) IBOutlet UITableView *listFilmsTableView;
@property (strong, nonatomic) NSMutableArray *filmsArray;
@property (strong, nonatomic) FilmML* model;

@end

@implementation ListofFilmsVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.filmsArray = [NSMutableArray array];
    [self.navigationController setNavigationBarHidden:NO];
    [self loadDataFromServer];
    [self saveData];
    
}

#pragma mark - Conection To Server
- (void) loadDataFromServer {
    [[ServerManager sharedManager]
     getTopFilmsFromServer:nil
     onSuccess:^(NSArray *result) {
         self.filmsArray = [NSMutableArray arrayWithArray:result];
         [self.listFilmsTableView reloadData];
     } onFailure:^(NSError *error) {
        
         NSLog(@"Error");
     }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.filmsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"filmCell";
    FilmTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"FilmTVCell" bundle:nil] forCellReuseIdentifier:identifier];
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    }
   
    self.model = [self.filmsArray objectAtIndex:indexPath.row];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator startAnimating];
    
    cell.model = self.model;
    [self.listFilmsTableView addSubview:indicator];

    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FilmDetailsVC *filmDetails = [[FilmDetailsVC alloc]init];
    filmDetails.filmML = self.filmsArray[indexPath.row];
    [self.navigationController pushViewController:filmDetails animated:YES];
}

#pragma mark - Chash
- (void) saveData {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.context = appDelegate.persistentContainer.viewContext;
    
    NSManagedObject* entity = [NSEntityDescription insertNewObjectForEntityForName:@"Data" inManagedObjectContext:self.context];
    
    [entity setValue:self.model.imagePosterString forKey:@"backdropPath"];
    [entity setValue:self.model.originalLangString forKey:@"language"];
    [entity setValue:[NSString stringWithFormat:@"%@",self.model.moveIdString] forKey:@"moveid"];
    [entity setValue:self.model.titleString forKey:@"originalTitle"];
    [entity setValue:self.model.overviewString forKey:@"overview"];
    [entity setValue:[NSString stringWithFormat:@"%@", self.model.popularityString] forKey:@"popularity"];
    [entity setValue:self.model.releaseDateString forKey:@"releaseDate"];
    
    [appDelegate saveContext];
    
    NSFetchRequest *requestFetch = [NSFetchRequest fetchRequestWithEntityName:@"Data"];
    NSArray* result = [self.context executeFetchRequest:requestFetch error:nil];
    
     NSLog(@"film title %@", [result valueForKey:@"originalTitle"]);
     NSLog(@"image %@", [result valueForKey:@"backdropPath"]);
     NSLog(@"lang %@", [result valueForKey:@"language"]);
     NSLog(@"move id %@", [result valueForKey:@"moveid"]);
     NSLog(@"overview %@", [result valueForKey:@"overview"]);
     NSLog(@"popularity %@", [result valueForKey:@"popularity"]);
     NSLog(@"release date %@", [result valueForKey:@"releaseDate"]);
}

@end
