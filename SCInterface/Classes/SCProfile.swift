//
//  SCProfile.swift
//  TubeTunes
//
//  Created by Timothy Barrett on 10/3/16.
//  Copyright © 2016 Tim Barrett. All rights reserved.
//

import Foundation
import ObjectMapper

public class SCProfile : NSObject, Mappable {
    public private(set) var id:Int?
    public private(set) var permalink:String?
    public private(set) var username:String?
    public private(set) var uri:String?
    public private(set) var permalink_url:String?
    public private(set) var avatar_url:String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        permalink <- map["permalink"]
        username <- map["username"]
        uri <- map["uri"]
        permalink_url <- map["permalink_url"]
        avatar_url <- map["avatar_url"]
    }
}
