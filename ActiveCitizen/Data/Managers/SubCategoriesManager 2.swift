//
//  SubCategoriesManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class SubCategoriesManager: BaseNetworkManager {

    typealias SubCategoriesCompletionHandler = (_ reports:[SubCategory]?, _ error:Error?) -> Void
    
    @discardableResult
    func getSubCategories(categoryId: Int, completion: @escaping SubCategoriesCompletionHandler) -> DataRequest {
        let apiEndPoint = "utils/topics?parentId=\(categoryId)"
        return request(apiEndpoint: apiEndPoint, method: .get, parameters: nil) { (response, error) in
            if error != nil {
                
                // Error
                completion(nil, error)
            } else {
                
                // Success
                var result: [SubCategory] = []
                
                if let subCategoriesArray = response as? [[String: Any]] {
                    for element in subCategoriesArray {
                        let subCategory = SubCategory(dictionary: element)
                        result.append(subCategory)
                    }
                }
                completion(result, nil)
            }
        }
    }
}
