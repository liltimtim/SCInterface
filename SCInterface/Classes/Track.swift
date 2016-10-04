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
    public required init?(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        ownerId <- map["user_id"]
        user <- map["user"]
    }
}
