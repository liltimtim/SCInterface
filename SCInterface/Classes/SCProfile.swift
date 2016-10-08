//
//  SCProfile.swift
//  TubeTunes
//
//  Created by Timothy Barrett on 10/3/16.
//  Copyright © 2016 Tim Barrett. All rights reserved.
//
//  A remote user profile

import Foundation
import ObjectMapper

public class SCProfile : NSObject, Mappable {
    public private(set) var id:Int?
    public private(set) var permalink:String?
    public private(set) var username:String?
    public private(set) var uri:String?
    public private(set) var permalink_url:String?
    public private(set) var avatar_url:String?
    public private(set) var country:String?
    public private(set) var fullName:String?
    public private(set) var descript:String?
    public private(set) var city:String?
    public private(set) var discogsName:String?
    public private(set) var myspaceName:String?
    public private(set) var website:String?
    public private(set) var online:Bool?
    public private(set) var trackCount:Int?
    public private(set) var playlistCount:Int?
    public private(set) var followersCount:Int?
    public private(set) var followingsCount:Int?
    public private(set) var publicFavoritesCount:Int?
    public private(set) var privatePlaylistsCount:Int?
    public private(set) var primaryEmailConfirmed:Bool?
    public private(set) var privateTracksCount:Int?
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        permalink <- map["permalink"]
        username <- map["username"]
        uri <- map["uri"]
        permalink_url <- map["permalink_url"]
        avatar_url <- map["avatar_url"]
        country <- map["country"]
        fullName <- map["full_name"]
        city <- map["city"]
        descript <- map["description"]
        discogsName <- map["discogs-name"]
        myspaceName <- map["myspace-name"]
        website <- map["website"]
        online <- map["online"]
        trackCount <- map["trackCount"]
        playlistCount <- map["playlist_count"]
        followersCount <- map["followers_count"]
        followingsCount <- map["followings_count"]
        publicFavoritesCount <- map["public_favorites_count"]
        privateTracksCount <- map["private_tracks_count"]
        privatePlaylistsCount <- map["private_playlists_count"]
        primaryEmailConfirmed <- map["primary_email_confirmed"]
    }
    
    
}
