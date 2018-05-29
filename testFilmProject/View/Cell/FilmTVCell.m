//
//  FilmTVCell.m
//  testFilmProject
//
//  Created by admin on 16.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import "FilmTVCell.h"
#import "FilmML.h"
#import "Const.h"


@implementation FilmTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - override Setters
- (void) setModel:(FilmML*)model {
    _model = model;
    
    [self.titleFilmLbl setText:model.titleString];
    [self.popularityFilmLbl setText:[NSString stringWithFormat:@"%@", model.popularityString]];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
         NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGE_URL,model.imagePosterString]]];
            if (imageData) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.imageFilm setImage:[UIImage imageWithData:imageData]];
                });
            }
        });

    
}
@end
