//
//  TrailerVC.m
//  testFilmProject
//
//  Created by admin on 19.05.18.
//  Copyright © 2018 admin. All rights reserved.
//

#import "TrailerVC.h"
#import "JVYoutubePlayer.h"
#import <MBProgressHUD.h>
#import "Const.h"
#import "ServerManager.h"
#import "TrailerML.h"

@interface TrailerVC () <JVYoutubePlayerDelegate>
@property (weak, nonatomic) IBOutlet JVYoutubePlayerView *player;
@property (strong, nonatomic) NSString* youtubeKey;
@end

@implementation TrailerVC

#pragma mark - Life cycle
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self getDataFromServer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.player];
}

#pragma mark - Get Data From SERVER
- (void) getDataFromServer {
    
    [[ServerManager sharedManager]
     getVidesToMovies:nil
     moveID:self.idTrailerLong
     onSuccess:^(NSArray *result) {
        
         NSArray *temp = [NSMutableArray arrayWithArray:result];
         for (TrailerML* trailer in temp) {
             self.youtubeKey = trailer.youtubeKeyString;
         }
         
          [self.player loadPlayerWithVideoURL:[NSString stringWithFormat:@"%@%@",YOUTUBE_URL, self.youtubeKey]];
         
     } onFailure:^(NSError *error) {
         NSLog(@"%@", error);
         
     }];
}

#pragma mark - Youtube PLAYER
- (JVYoutubePlayerView *)player {
    if(!_player) {
        _player.delegate = self;
        _player.autoplay = NO;
        _player.modestbranding = YES;
        _player.allowLandscapeMode = YES;
        _player.forceBackToPortraitMode = NO;
        _player.allowAutoResizingPlayerFrame = YES;
        _player.playsinline = NO;
        _player.fullscreen = YES;
        _player.playsinline = YES;
        _player.allowBackgroundPlayback = YES;
    }
    
    return _player;
}

@end
