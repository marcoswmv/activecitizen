//
//  ReportsManager.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class ReportsManager: BaseNetworkManager {

    typealias ReportsListCompletionHandler = (_ reports:[Report]?, _ error:Error?) -> Void
    
    @discardableResult
    func getReportsList(completion: @escaping ReportsListCompletionHandler) -> DataRequest {
        
        // TODO: pages
        let params = ["firstResult": 0, "maxResults": 10]
        return request(apiEndpoint: "complain/filter", method: .post, parameters: params, completion: { (response, error) in
          
            if error != nil {
                
                // Error
                completion(nil, error)
            } else {
                
                // Success
                var result: [Report] = []
                
                if let responseDict = response as? [String: Any] {
                    
                    if let reportsArray = responseDict["data"] as? [[String: Any]] {
                      
                        for element in reportsArray {
                            let report = Report(dictionary: element)
                            result.append(report)
                        }
                        
                    }
                }
                completion(result, nil)
            }
        })
    }
    
}
