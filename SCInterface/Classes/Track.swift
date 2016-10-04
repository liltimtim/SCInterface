//
//  Track.swift
//  TubeTunes
//
//  Created by Timothy Barrett on 10/3/16.
//  Copyright © 2016 Tim Barrett. All rights reserved.
//

import Foundation
import ObjectMapper

public class Track: NSObject, Mappable {
    public private(set) var id:Int?
    public private(set) var ownerId:Int?
    public private(set) var title:String?
    public private(set) var user:SCProfile?
    public private(set) var duration:Double?
    public private(set) var commentable:Bool?
    public private(set) var state:String?
    public private(set) var sharing:String?
    public private(set) var tag_list:String?
    public private(set) var permalink:String?
    public private(set) var streamable:Bool?
    public private(set) var downloadable:Bool?
    public private(set) var genre:String?
    public private(set) var releaseCount:String?
    public private(set) var purchaseURL:String?
    public private(set) var labelId:Int?
    public private(set) var labelName:String?
    public private(set) var isrc:String?
    public private(set) var videoURL:String?
    public private(set) var trackType:String?
    public private(set) var keySignature:String?
    public private(set) var bpm:Int?
    public private(set) var releaseYear:Int?
    public private(set) var releaseMonth:Int?
    public private(set) var releaseDay:Int?
    public private(set) var originalFormat:String?
    public private(set) var originalContentSize:Double?
    public private(set) var license:String?
    public private(set) var uri:String?
    public private(set) var permalinkURL:String?
    public private(set) var artworkURL:String?
    public private(set) var waveformURL:String?
    public private(set) var avatarURL:String?
    public private(set) var streamURL:String?
    public private(set) var downloadURL:String?
    public private(set) var playbackCount:Int?
    public private(set) var downloadCount:Int?
    public private(set) var favoritingsCount:Int?
    public private(set) var commentCount:Int?
    public private(set) var attatchmentsURL:String?
    
    public required init?(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        ownerId <- map["user_id"]
        duration <- map["duration"]
        commentable <- map["commentable"]
        state <- map["state"]
        sharing <- map["sharing"]
        tag_list <- map["tag_list"]
        permalink <- map["permalink"]
        streamable <- map["streamable"]
        downloadable <- map["downloadable"]
        genre <- map["genre"]
        purchaseURL <- map["purchase_url"]
        labelId <- map["label_id"]
        labelName <- map["label_name"]
        isrc <- map["isrc"]
        videoURL <- map["video_url"]
        trackType <- map["track_type"]
        keySignature <- map["key_signature"]
        bpm <- map["bpm"]
        title <- map["title"]
        releaseYear <- map["release_year"]
        releaseMonth <- map["release_month"]
        releaseDay <- map["release_day"]
        originalFormat <- map["original_format"]
        originalContentSize <- map["original_content_size"]
        license <- map["license"]
        uri <- map["uri"]
        permalinkURL <- map["permalink_url"]
        artworkURL <- map["artwork_url"]
        waveformURL <- map["waveform_url"]
        user <- map["user"]
        permalink <- map["permalink"]
        avatarURL <- map["avatar_url"]
        streamURL <- map["stream_url"]
        downloadURL <- map["download_url"]
        playbackCount <- map["playback_count"]
        downloadCount <- map["download_count"]
        favoritingsCount <- map["favoritings_count"]
        commentCount <- map["comment_count"]
        attatchmentsURL <- map["attachents_url"]
    }
}

/*
 {
 "id": 13158665,
 "created_at": "2011/04/06 15:37:43 +0000",
 "user_id": 3699101,
 "duration": 18109,
 "commentable": true,
 "state": "finished",
 "sharing": "public",
 "tag_list": "soundcloud:source=iphone-record",
 "permalink": "munching-at-tiannas-house",
 "description": null,
 "streamable": true,
 "downloadable": true,
 "genre": null,
 "release": null,
 "purchase_url": null,
 "label_id": null,
 "label_name": null,
 "isrc": null,
 "video_url": null,
 "track_type": "recording",
 "key_signature": null,
 "bpm": null,
 "title": "Munching at Tiannas house",
 "release_year": null,
 "release_month": null,
 "release_day": null,
 "original_format": "m4a",
 "original_content_size": 10211857,
 "license": "all-rights-reserved",
 "uri": "http://api.soundcloud.com/tracks/13158665",
 "permalink_url": "http://soundcloud.com/user2835985/munching-at-tiannas-house",
 "artwork_url": null,
 "waveform_url": "http://w1.sndcdn.com/fxguEjG4ax6B_m.png",
 "user": {
 "id": 3699101,
 "permalink": "user2835985",
 "username": "user2835985",
 "uri": "http://api.soundcloud.com/users/3699101",
 "permalink_url": "http://soundcloud.com/user2835985",
 "avatar_url": "http://a1.sndcdn.com/images/default_avatar_large.png?142a848"
 },
 "stream_url": "http://api.soundcloud.com/tracks/13158665/stream",
 "download_url": "http://api.soundcloud.com/tracks/13158665/download",
 "playback_count": 0,
 "download_count": 0,
 "favoritings_count": 0,
 "comment_count": 0,
 "created_with": {
 "id": 124,
 "name": "SoundCloud iPhone",
 "uri": "http://api.soundcloud.com/apps/124",
 "permalink_url": "http://soundcloud.com/apps/iphone"
 },
 "attachments_uri": "http://api.soundcloud.com/tracks/13158665/attachments"
 }
 */
