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
import SafariServices
import ObjectMapper
public class TTInterface: NSObject {
    // TODO: These should be moved to AppDelegate when the instance is first started
    public var scClientID:String = "0086921a441b81faf030f38882f1ec0a"
    public var scClientSecret:String = "2ea1a94bac58e8ded1dadb97cb3300de"
    public var scRedirectURI:String = "tubeTunes://soundcloud/oauth"
    private static let baseURL:String = "https://api.soundcloud.com"
    private let scConnectURL:String = "https://soundcloud.com/connect"
    public static let shared:TTInterface = TTInterface()
    public var oauth2:OAuth2CodeGrantNoTokenType?
    private override init() { super.init() }
    /** 
     Search for SoundCloud track resources.
    */
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
    /**
     Get /me/activities for an authenticated SC User
    */
    public func activities(oauthToken:String, nextRef:String, completion:@escaping (_ activities: Activities?, _ error: Error?)->Void) -> Request {
        var params = [String:AnyObject]()
        params["oauth_token"] = oauthToken as AnyObject
        return Alamofire.request(nextRef, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<Activities>) in
            switch(response.result) {
            case .success(let data):
                completion(data, nil)
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func activities(oauthToken:String, completion:@escaping (_ activities:Activities?, _ error:Error?)->Void) -> Request {
        var params = [String:AnyObject]()
        params["oauth_token"] = oauthToken as AnyObject
        let url = "\(TTInterface.baseURL)/me/activities"
        return Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<Activities>) in
            switch(response.result) {
            case .success(let collection):
                completion(collection, nil)
                
            case .failure(let error):
                print(error)
                completion(nil, error)
            }
        }
    }
    
    @available(iOS 9.0, *)
    public func authenticate(withViewController view:UIViewController) {
        oauth2 = OAuth2CodeGrantNoTokenType(settings: [
            "client_id": self.scClientID,
            "client_secret": self.scClientSecret,
            "authorize_uri": "https://soundcloud.com/connect",
            "token_uri": "https://api.soundcloud.com/oauth2/token",
            "scope": "non-expiring",
            "redirect_uris": [self.scRedirectURI],
            "response_type": ["code", "token"],
            "keychain": true,
            "verbose":false,
            "display":"popup",
            "grant_type": ["authorization_code"],
            "secret_in_body":true //soundcloud requests everything in body
            ])
        oauth2?.authConfig.authorizeEmbedded = true
        oauth2?.authConfig.authorizeContext = self
        oauth2?.authorize()
        oauth2?.authorizeEmbedded(from: view) { (json, error) in
            print(json)
            print(error)
            print(self.oauth2?.accessToken)
        }
    }
    
    static public func convertURL(url:URL) -> URL? {
        let urlString = url.absoluteString
        let replacedString = urlString.replacingOccurrences(of: "betu", with: "beTu")
        guard let newURL = URL(string: replacedString) else { return nil }
        return newURL
    }
}

extension TTInterface : SFSafariViewControllerDelegate {
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
