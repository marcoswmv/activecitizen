//
//  VotesManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 11.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class VotesManager: BaseNetworkManager {
    
    typealias VotesCompletionHandler = (_ votes: [Vote]?, _ error: Error?) -> Void
    
    @discardableResult
    func getVotes(with caseID: String, completion: @escaping VotesCompletionHandler) -> DataRequest {
        
        let apiEndPoint = "activity/byCase?caseId=" + caseID
        return request(apiEndpoint: apiEndPoint, method: .get, parameters: nil, completion: { (response, error) in
          
            if error != nil {
                
                // Error
                completion(nil, error)
            } else {
                // Success
                var result: [Vote] = []
                
                if let responseDict = response as? [String: Any] {
                    
                    if let votesArray = responseDict["data"] as? [[String: Any]] {
                      
                        for vote in votesArray {
                            let vote = Vote(dictionary: vote)
                            result.append(vote)
                        }
                        
                    }
                }
                completion(result, nil)
            }
        })
    }
}
