//
//  FilesManager.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 02.04.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Kingfisher

class ImagesManager: BaseNetworkManager {
    
    typealias FilesCompletionHandler = (_ image: UIImage?, _ error: Error?) -> Void
    
    
    func getFiles(id: String, completion: @escaping FilesCompletionHandler) {
        
        let baseUrl = "https://active-citizen.ru/rest/utils/getFile?isMini=true&id="
        
        let url = URL(string: baseUrl + id)!
        let resource = ImageResource(downloadURL: url)
        
        KingfisherManager.shared.retrieveImage(with: resource) { (result) in
            
            switch result {
                
            case .success(let value):
                
                completion(value.image, nil)
                
            case .failure(let error):
                
                completion(nil, error)
                
            }
        }
    }
}
