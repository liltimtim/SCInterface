//
//  ActivityCollection.swift
//  Pods
//
//  Created by Timothy Barrett on 10/7/16.
//
//

import Foundation
import ObjectMapper
public class Activities : NSObject, Mappable {
    public private(set) var collection:[Activity]?
    public private(set) var nextCollectionURL:String?
    public required init?(map: Map) { super.init() }
    public func mapping(map: Map) {
        collection <- map["collection"]
        nextCollectionURL <- map["next_href"]
    }
}
