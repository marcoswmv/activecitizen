//
//  DistrictsManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 26.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class DistrictsManager: BaseNetworkManager {

    typealias DistrictsCompletionHandler = (_ reports:[Report]?, _ error:Error?) -> Void
    
    @discardableResult
    func getDistrictsList(completion: @escaping DistrictsCompletionHandler) -> DataRequest {
        
        // TODO: pages
        let params = ["page": 1, "sizePerPage": 10]
        return request(apiEndpoint: "utils/districts-list", method: .get, parameters: params, completion: { (response, error) in
          
            if error != nil {
                
                // Error
                completion(nil, error)
            } else {
                
                // Success
//                var result: [District] = []
                
                if let responseDict = response as? [String: Any] {
                    
                    for (key, value) in responseDict {
                        print(key, value)
                    }
                    
//                    if let reportsArray = responseDict["data"] as? [[String: Any]] {
//
//                        for element in reportsArray {
//                            let report = Report(dictionary: element)
//                            result.append(report)
//                        }
//
//                    }
                }
//                completion(result, nil)
            }
        })
    }
    
}
