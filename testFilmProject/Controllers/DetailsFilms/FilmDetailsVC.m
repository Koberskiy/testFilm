//
//  FilmDetailsVC.m
//  testFilmProject
//
//  Created by admin on 17.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import "FilmDetailsVC.h"
#import "ServerManager.h"
#import "Const.h"
#import "TrailerVC.h"

@interface FilmDetailsVC ()

@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UILabel *filmNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateReleaseLbl;
@property (weak, nonatomic) IBOutlet UILabel *languageLbl;
@property (weak, nonatomic) IBOutlet UILabel *popularityLbl;
@property (weak, nonatomic) IBOutlet UILabel *overviewFilmLbl;
@property (weak, nonatomic) IBOutlet UIButton *trailerButton;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (assign, nonatomic) long idTrailerLong;

@end

@implementation FilmDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator startAnimating];
    [self setUpUI];
    [self.view addSubview:indicator];
}

#pragma mark - setUp UI
- (void) setUpUI{
    
    [self.filmNameLbl setText:self.filmML.titleString];
    [self.dateReleaseLbl setText:self.filmML.releaseDateString];
    [self.languageLbl setText:self.filmML.originalLangString];
    [self.popularityLbl setText:[NSString stringWithFormat:@"%@", self.filmML.popularityString]];
    [self.overviewFilmLbl setText:self.filmML.overviewString];
   
    self.idTrailerLong = [self.filmML.moveIdString longLongValue];

    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_URL,self.filmML.imagePosterString]]];
        if (imageData) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.posterImage setImage:[UIImage imageWithData:imageData]];
            });
        }
    });
}

#pragma mark - Actions

- (IBAction)trailerAction:(id)sender {
    TrailerVC* trailer = [[TrailerVC alloc]init];
    
    trailer.idTrailerLong = self.idTrailerLong;
    
    [self.navigationController pushViewController:trailer animated:YES];
}
@end
