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
import p2_OAuth2
public class TTInterface: NSObject {
    // TODO: These should be moved to AppDelegate when the instance is first started
    public var scClientID:String = "0086921a441b81faf030f38882f1ec0a"
    public var scClientSecret:String = "2ea1a94bac58e8ded1dadb97cb3300de"
    public var scRedirectURI:String = "tubeTunes://soundcloud/oauth"
    private static let baseURL:String = "https://api.soundcloud.com"
    public static let shared:TTInterface = TTInterface()
    public var oauth2:OAuth2CodeGrant?
    private override init() { super.init() }
    
    public func search(searchTerm terms:String, success:@escaping (_ tracks:[Track])->Void, failure:@escaping (_ error:Error)->Void) -> Request {
        var params = [String:AnyObject]()
        params["q"] = terms as AnyObject
        params["client_id"] = scClientID as AnyObject?
        return Alamofire.request("\(TTInterface.baseURL)/tracks", method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[Track]>) in
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
    
    @available(iOS 9.0, *)
    public func authenticate(withViewController view:UIViewController) {
        oauth2 = OAuth2CodeGrant(settings: [
            "client_id": self.scClientID,
            "client_secret": self.scClientSecret,
            "authorize_uri": "https://soundcloud.com/connect",
            "token_uri": "https://api.soundcloud.com/oauth2/token",
            "scope": "non-expiring",
            "redirect_uris": [self.scRedirectURI],
            "keychain": false,
            "verbose":true,
            "secret_in_body":true //soundcloud requests everything in body
            ] as OAuth2JSON)
        oauth2?.authorizeEmbedded(from: view) { (json, error) in
            print(json)
            print(error)
        }
    }
}
