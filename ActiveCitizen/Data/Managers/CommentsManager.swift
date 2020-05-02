//
//  CommentsManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 03.04.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class CommentsManager: BaseNetworkManager {
    
    typealias CommentsCompletionHandler = (_ comments: [Comment]?, _ error: Error?) -> Void
    
    @discardableResult
    func getComments(with caseID: String, completion: @escaping CommentsCompletionHandler) -> DataRequest {
        
        let apiEndPoint = "activity/byCase?caseId=" + caseID
        return request(apiEndpoint: apiEndPoint, method: .get, parameters: nil, completion: { (response, error) in
          
            if error != nil {
                
                // Error
                completion(nil, error)
            } else {
                // Success
                var result: [Comment] = []
                
                if let responseDict = response as? [String: Any] {
                    
                    if let commentsArray = responseDict["data"] as? [[String: Any]] {
                      
                        for comment in commentsArray {
                            let comment = Comment(dictionary: comment)
                            result.append(comment)
                        }
                        
                    }
                }
                completion(result, nil)
            }
        })
    }
}
