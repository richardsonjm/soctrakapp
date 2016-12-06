//
//  Partnership+Networking.swift
//  soctrakapp
//
//  Created by John Richardson on 12/6/16.
//  Copyright © 2016 John Richardson. All rights reserved.
//

import Foundation
import Alamofire

enum BackendError: Error {
    case objectSerialization(reason: String)
}

extension Partnership {
    class func endpointForID(_ id: Int) -> String {
        return "http://localhost:5000/v1/partnerships/\(id)"
    }
    class func endpointForPartnerships() -> String {
        return "http://localhost:5000/v1/partnerships/"
    }
    
    convenience init?(json: [String: Any]) {
        guard let userId = json["userId"] as? Int,
            let partnerId = json["partnerId"] as? Int,
            let confirmed = json["confirmed"] as? Bool
            else {
                return nil
        }
        
        let idValue = json["id"] as? Int
        let userName = json["userName"] as? String
        let partnerName = json["partnerName"] as? String
        
        self.init(id: idValue, userId: userId, userName: userName, partnerId: partnerId, partnerName: partnerName, confirmed: confirmed)
    }
    
    func toJSON() -> [String: Any] {
        var json = [String: Any]()
        if let id = id {
            json["id"] = id
        }
        json["userId"] = userId
        if let userName = userName {
            json["userName"] = userName
        }
        json["partnerId"] = partnerId
        if let partnerName = partnerName {
            json["partnerName"] = partnerName
        }
        json["confirmed"] = confirmed
        return json
    }
    
    class func partnershipByID(_ id: Int, completionHandler: @escaping (Result<Partnership>) -> Void) {
        Alamofire.request(Partnership.endpointForID(id))
            .responseJSON { response in
                let result = Partnership.partnershipFromResponse(response: response)
                completionHandler(result)
        }
    }
    
    func save(completionHandler: @escaping (Result<Partnership>) -> Void) {
        let fields = self.toJSON()
        Alamofire.request(Partnership.endpointForPartnerships(),
                          method: .post,
                          parameters: fields,
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { response in
                let result = Partnership.partnershipFromResponse(response: response)
                completionHandler(result)
        }
    }
    
    private class func partnershipFromResponse(response: DataResponse<Any>) -> Result<Partnership> {
        guard response.result.error == nil else {
            // got an error in getting the data, need to handle it
            print(response.result.error!)
            return .failure(response.result.error!)
        }
        
        // make sure we got JSON and it's a dictionary
        guard let json = response.result.value as? [String: Any] else {
            print("didn't get todo object as JSON from API")
            return .failure(BackendError.objectSerialization(reason:
                "Did not get JSON dictionary in response"))
        }
        
        // turn JSON in to Partnership object
        guard let partnership = Partnership(json: json) else {
            return .failure(BackendError.objectSerialization(reason:
                "Could not create Partnership object from JSON"))
        }
        return .success(partnership)
    }
}
