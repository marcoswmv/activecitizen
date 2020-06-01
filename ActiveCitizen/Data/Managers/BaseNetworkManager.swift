//
//  BaseNetworkManager.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import Alamofire

class BaseNetworkManager: NSObject {

    let baseUrl = "https://active-citizen.ru/rest"
    let geocodeURL = "https://geocode-maps.yandex.ru/1.x/?"
    
    typealias GenericNetworkCompletionHandler = (_ value:Any?, _ error:Error?) -> Void
    
    override init() {
        super.init()
    }
    
    @discardableResult
    func request(apiEndpoint: String, method:HTTPMethod, parameters: Parameters?, completion: @escaping GenericNetworkCompletionHandler) -> DataRequest  {
    
        let url = URL(string: baseUrl + "/" + apiEndpoint)!
        
        return request(url: url, method: method, parameters: parameters, completion: completion)
    }
    
    @discardableResult
    func request(url: URL, method:HTTPMethod, parameters: Parameters?, completion: @escaping GenericNetworkCompletionHandler) -> DataRequest  {
        
        // TODO: new auth
        let user = "developer"
        let password = "GisPwd!2019"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = [
            "Authorization": "Basic \(base64Credentials)",
            "Content-Type": "application/json"
        ]
        
        return AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON  { response in
            completion(response.value, response.error)
           }
    }
    
    @discardableResult
    func requestToGeocoder(method: HTTPMethod, parameters: Parameters?, completion: @escaping GenericNetworkCompletionHandler) -> DataRequest  {
        
        let url = URL(string: geocodeURL)!
        
        return AF.request(url, method: method, parameters: parameters).responseJSON  { response in
            completion(response.value, response.error)
           }
    }
}
