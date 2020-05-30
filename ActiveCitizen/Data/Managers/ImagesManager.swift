//
//  FilesManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 02.04.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ImagesManager: BaseNetworkManager {
    
    typealias FilesCompletionHandler = (_ image: RetrieveImageResult?, _ error: KingfisherError?) -> Void
    typealias UploadImageCompletionHandler = (_ reports: String?, _ error: Error?) -> Void
    
    @discardableResult
    func getImage(with ID: String, completion: @escaping FilesCompletionHandler) -> DownloadTask? {
        
        let baseUrl = "https://active-citizen.ru/rest/utils/getFile?isMini=true&id="
        
        let url = URL(string: baseUrl + ID)!
        let resource = ImageResource(downloadURL: url)
        
        return KingfisherManager.shared.retrieveImage(with: resource) { (result) in
            switch result {
            case .success(let value):
                completion(value, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    @discardableResult
    func uploadImages(dictionary: [String: Any],completion: @escaping UploadImageCompletionHandler) -> DataRequest {
        
        let params = dictionary
        return request(apiEndpoint: "utils/uploadFile", method: .post, parameters: params) { (response, error) in
            if error != nil {
                completion(nil, error)
            } else {
                completion(response as? String, nil)
            }
        }
    }
}
