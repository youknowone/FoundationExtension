//
//  MPMediaItem.h
//  FoundationExtension
//
//  Created by Jeong YunWon on 13. 8. 20..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>

@interface MPMediaItem (Shortcuts)

+ (void)_patch;

@property(readonly) NSNumber *persistentID; // int64_t
@property(readonly) NSNumber *mediaType; // NSInteger
@property(readonly) NSString *title, *albumTitle, *artist, *albumArtist, *genre, *composer;

@property(readonly) NSNumber *albumPID, *artistPID, *albumArtistPID, *genrePID, *composerPID; // int64_t

@property(readonly) NSNumber *playbackDuration; // NSTimeInterval
@property(readonly) NSNumber *albumTrackNumber, *albumTrackCount, *discNumber, *discCount; // NSUInteger

@property(readonly) MPMediaItemArtwork *artwork;
@property(readonly) NSString *lyrics;

@property(readonly) NSNumber *isCompilation; // BOOL
@property(readonly) NSDate *releaseDate;
@property(readonly) NSNumber *beatsPerMinute; // NSUInteger
@property(readonly) NSString *comments;
@property(readonly) NSURL *assetURL;
@property(readonly) NSNumber *isCloudItem; // BOOL;

// Podcast properties
@property(readonly) NSString *podcastTitle;
@property(readonly) NSNumber *podcastPID; // int64_t

// User properties
@property(readonly) NSNumber *playCount, *skipCount, *rating; // NSUInteger
@property(readonly) NSDate *lastPlayedDate; // NSDate
@property(readonly) NSString *userGrouping;

//MP_EXTERN NSString *const MPMediaItemPropertyBookmarkTime NS_AVAILABLE_IOS(6_0);
//@"bookmarkTime",        NSNumber of

- (UIImage *)artworkImageWithSize:(CGSize)size;

@end
