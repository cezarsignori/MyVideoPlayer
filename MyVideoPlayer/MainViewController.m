//This file is part of MyVideoPlayer.
//
//MyVideoPlayer is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//MyVideoPlayer is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License
//along with MyVideoPlayer.  If not, see <http://www.gnu.org/licenses/>.

#import "MainViewController.h"
#import "VideoPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MainViewController () 

@property (nonatomic, retain) MPMoviePlayerController *playerViewController;
@property (nonatomic, retain) VideoPlayerViewController *myPlayerViewController;

@end


@implementation MainViewController

@synthesize playerViewController = _playerViewController;
@synthesize myPlayerViewController = _myPlayerViewController;

- (void)dealloc {
    self.playerViewController = nil;
    self.myPlayerViewController = nil;
    
    [super dealloc];
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"video_1" withExtension:@"mp4"];
    
    // video player
    MPMoviePlayerController *playerViewController = [[MPMoviePlayerController alloc] init];
    playerViewController.contentURL = url;
    playerViewController.view.frame = CGRectMake(0, 0, 500, 500);
    
    [self.view addSubview:playerViewController.view];
    [playerViewController play];
    
    self.playerViewController = playerViewController;
    [playerViewController release];
    
    
    // my video player
    VideoPlayerViewController *player = [[VideoPlayerViewController alloc] init];
    player.URL = url;
    player.view.frame = CGRectMake(0, 600, 500, 500);
    [self.view addSubview:player.view];
    self.myPlayerViewController = player;
    [player release];
}

@end
