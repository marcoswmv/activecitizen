//
//  UsersManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 28.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class MembersManager: BaseNetworkManager {

    typealias UsersCompletionHandler = (_ reports:[Member]?, _ error:Error?) -> Void
    
    @discardableResult
    func getMemberUsers(completion: @escaping UsersCompletionHandler) -> DataRequest {
        
//        let params = ["firstResult": 0, "maxResult": 10]
        let apiEndPoint = "statistics/allUsers?firstResult=0&maxResult=10"
        return request(apiEndpoint: apiEndPoint, method: .get, parameters: nil, completion: { (response, error) in
          
            if error != nil {
//                print(error?.localizedDescription)
                // Error
                completion(nil, error)
            } else {
                
//                 Success
                var result: [Member] = []
                
                if let responseDict = response as? [String: Any] {
                    
                    if let UsersArray = responseDict["data"] as? [[String: Any]] {
                        
                        for element in UsersArray {
                            
                            let user = Member(dictionary: element)
                            result.append(user)
                        }
                    }

                }
                completion(result, nil)
            }
        })
    }

}
