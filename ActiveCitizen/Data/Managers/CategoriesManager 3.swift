//
//  CategoriesManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesManager: BaseNetworkManager {
    
    typealias CategoriesCompletionHandler = (_ reports:[Category]?, _ error:Error?) -> Void
    
    @discardableResult
    func getCategories(completion: @escaping CategoriesCompletionHandler) -> DataRequest {
        
        return request(apiEndpoint: "utils/categories", method: .get, parameters: nil) { (response, error) in
            if error != nil {
                
                // Error
                completion(nil, error)
            } else {
                
                // Success
                var result: [Category] = []
                
                if let categoriesArray = response as? [[String: Any]] {
                    for element in categoriesArray {
                        let category = Category(dictionary: element)
                        result.append(category)
                    }
                }
                completion(result, nil)
            }
        }
    }
}
