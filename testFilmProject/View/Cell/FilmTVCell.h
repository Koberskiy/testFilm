//
//  FilmTVCell.h
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilmML;

@interface FilmTVCell : UITableViewCell

@property (strong, nonatomic) FilmML* model;

@property (weak, nonatomic) IBOutlet UILabel *titleFilmLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageFilm;
@property (weak, nonatomic) IBOutlet UILabel *popularityFilmLbl;

@end
