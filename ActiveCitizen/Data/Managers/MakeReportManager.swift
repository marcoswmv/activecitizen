//
//  MakeReportManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 30.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class MakeReportManager: BaseNetworkManager {
    
    typealias MakeReportCompletionHandler = (_ reports: String?, _ error: Error?) -> Void
    
    @discardableResult
    func makeReport(dictionary: [String: Any],completion: @escaping MakeReportCompletionHandler) -> DataRequest {
        let params = dictionary
        return request(apiEndpoint: "complain", method: .post, parameters: params) { (response, error) in
            if error != nil {
                completion(nil, error)
            } else {
                completion(response as? String, nil)
            }
        }
    }
}
