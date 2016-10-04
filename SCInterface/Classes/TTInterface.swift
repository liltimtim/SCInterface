//
//  TTInterface.swift
//  TubeTunes
//
//  Created by Timothy Barrett on 10/3/16.
//  Copyright © 2016 Tim Barrett. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
public class TTInterface: NSObject {
    private static let scClientID:String = "0086921a441b81faf030f38882f1ec0a"
    private static let baseURL:String = "https://api.soundcloud.com"
    
    public static func search(searchTerm terms:String, success:@escaping (_ tracks:[Track])->Void, failure:@escaping (_ error:Error)->Void) -> Request {
        var params = [String:AnyObject]()
        params["q"] = terms as AnyObject?
        params["client_id"] = TTInterface.scClientID as AnyObject?
        return Alamofire.request("\(baseURL)/tracks", method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[Track]>) in
            switch(response.result) {
            case .success(let data):
                print(data)
                success(data)
            case .failure(let error):
                print(error)
                failure(error)
            }
        }
    }
}
