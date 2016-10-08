//
//  Playlist.swift
//  Pods
//
//  Created by Timothy Barrett on 10/7/16.
//
//

import Foundation
import ObjectMapper
public class Playlist : NSObject, Mappable {
    public private(set) var id:Int?
    public private(set) var createdAt:String?
    public private(set) var userId:String?
    public private(set) var user:SCProfile?
    public private(set) var title:String?
    public private(set) var permalink:String?
    public private(set) var permalinkURL:String?
    public private(set) var uri:String?
    public private(set) var sharing:String?
    public private(set) var purchaseURL:String?
    public private(set) var artworkURL:String?
    public private(set) var descript:String?
    public private(set) var label:String?
    public private(set) var duration:Double?
    public private(set) var genre:String?
    public private(set) var tagList:String?
    public private(set) var labelId:String?
    public private(set) var labelName:String?
    public private(set) var release:Int?
    public private(set) var releaseDay:Int?
    public private(set) var releaseMonth:Int?
    public private(set) var releaseYear:Int?
    public private(set) var streamable:Bool?
    public private(set) var downloadable:Bool?
    public private(set) var ean:String?
    public private(set) var playlistType:String?
    public private(set) var tracks:[Track]?
    public required init?(map: Map) { super.init() }
    
    public func mapping(map: Map) {
        id <- map["id"]
        createdAt <- map["created_at"]
        userId <- map["user_id"]
        user <- map["user"]
        title <- map["title"]
        permalink <- map["permalink"]
        permalinkURL <- map["permalink_url"]
        uri <- map["uri"]
        sharing <- map["sharing"]
        purchaseURL <- map["purhcase_url"]
        artworkURL <- map["artwork_url"]
        descript <- map["description"]
        label <- map["label"]
        duration <- map["duration"]
        genre <- map["genre"]
        tagList <- map["tag_list"]
        labelId <- map["label_id"]
        labelName <- map["label_name"]
        release <- map["release"]
        releaseDay <- map["release_day"]
        releaseMonth <- map["release_month"]
        releaseYear <- map["release_year"]
        streamable <- map["streamable"]
        downloadable <- map["downloadable"]
        ean <- map["ean"]
        playlistType <- map["playlist_type"]
        tracks <- map["tracks"]
    }
}
