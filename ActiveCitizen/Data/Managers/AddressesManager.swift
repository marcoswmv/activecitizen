//
//  DistrictsManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 26.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class AddressesManager: BaseNetworkManager {

    typealias AddressesCompletionHandler = (_ addresses:[Address]?, _ error:Error?) -> Void
    
    @discardableResult
    func getAddresses(for geocode: String, completion: @escaping AddressesCompletionHandler) -> DataRequest {
        
        let apiKey = "ecb5b296-ee1b-4d76-a3ff-7692eade004c"
        
        let params = ["format": "json", "geocode": geocode, "apikey": apiKey, "kind": "house"]
        
        return requestToGeocoder(method: .get, parameters: params, completion: { (response, error) in
          
            if error != nil {
                
                // Error
                completion(nil, error)
            } else {
                
                // Success
                var result: [Address] = []
                
                if let responseDict = response as? [String: Any] {
                    if let geoObjectCollection = responseDict["response"] as? [String: Any] {
                        
                        if let objectsDict = geoObjectCollection["GeoObjectCollection"] as? [String: Any] {
                            
                            if let geoObejcts = objectsDict["featureMember"] as? [[String: Any]] {
                                
                                for eachObject in geoObejcts {
                                    if let addressElement = eachObject["GeoObject"] as? [String: Any] {
                                        
                                        let address = Address(dictionary: addressElement)
                                        result.append(address)
                                    }
                                }
                            }
                        }
                    }
                }
                completion(result, nil)
            }
        })
    }
    
}
