//
//  Activity.swift
//  Pods
//
//  Created by Timothy Barrett on 10/7/16.
//
//

import Foundation
import ObjectMapper
public class Activity: NSObject, Mappable {
    public private(set) var createdAt:String?
    public private(set) var origin:Track?
    public private(set) var tags:String?
    public private(set) var type:String?
    public required init?(map: Map) {
        super.init()
    }
    
    public func mapping(map: Map) {
        createdAt <- map["created_at"]
        origin <- map["origin"]
        tags <- map["tags"]
        type <- map["type"]
    }
}
