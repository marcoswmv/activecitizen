//
//  FilesManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 02.04.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Kingfisher

class ImagesManager {
    
    typealias FilesCompletionHandler = (_ image: RetrieveImageResult?, _ error: KingfisherError?) -> Void
    
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
}
