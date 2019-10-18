//
//  MPMediaItem.m
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 8. 20..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

@import FoundationExtension;

#import "MPMediaItem.h"

@implementation MPMediaItem (Shortcuts)

@dynamic persistentID, mediaType, title;
@dynamic albumTitle, artist, albumArtist, genre, composer;
@dynamic albumPID, artistPID, albumArtistPID, genrePID, composerPID;
@dynamic playbackDuration, albumTrackNumber, albumTrackCount, discNumber, discCount, artwork, lyrics;
@dynamic isCompilation, releaseDate, beatsPerMinute, comments, assetURL, isCloudItem;
@dynamic podcastTitle, podcastPID;
@dynamic playCount, skipCount, rating, lastPlayedDate, userGrouping;

+ (void)initialize {
    if (self == [MPMediaItem class]) {
        [self _patch];
    }
}

- (id)_getValue {
    NSString *name = NSStringFromSelector(_cmd);
    id value = [self valueForProperty:name];
    return value;
}

+ (void)_patch {
    static BOOL done = NO;
    if (done) return;

    done = YES;
    NSAMethod *template = [self methodObjectForSelector:@selector(_getValue)];
    Class ConcreteClass = NSClassFromString(@"MPConcreteMediaItem");
    //dassert(ConcreteClass);
    for (NSString *key in @[@"persistentID", @"mediaType", @"title",
                            @"albumTitle", @"artist", @"albumArtist", @"genre", @"composer",
                            @"albumPID", @"artistPID", @"albumArtistPID", @"genrePID", @"composerPID",
                            @"playbackDuration", @"albumTrackNumber", @"albumTrackCount", @"discNumber", @"discCount", @"artwork", @"lyrics",
                            @"isCompilation", @"releaseDate", @"beatsPerMinute", @"comments", @"assetURL", @"isCloudItem",
                            // Podcast properties
                            @"podcastTitle", @"podcastPID",
                            // User properties
                            @"playCount", @"skipCount", @"rating", @"lastPlayedDate", @"userGrouping"]) {

        [ConcreteClass addMethodForSelector:NSSelectorFromString(key) fromMethod:template];
    }
    [ConcreteClass addMethodForSelector:@selector(artworkImageWithSize:) fromMethod:[self methodObjectForSelector:@selector(artworkImageWithSize:)]];
}

- (UIImage *)artworkImageWithSize:(CGSize)size {
    MPMediaItemArtwork *artwork = self.artwork;
    return [artwork imageWithSize:size];
}

@end
