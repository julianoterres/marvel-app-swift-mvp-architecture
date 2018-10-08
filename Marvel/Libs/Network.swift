//
//  MainService.swift
//  Marvel
//
//  Created by Juliano Terres on 08/10/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Alamofire

class Network: NetworkProtocol {
    
    static func request(url: URL, method: HTTPMethod, parameters: Parameters?, completion: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
        Alamofire.request(url, method: method, parameters: parameters).validate().responseJSON(completionHandler: { response in
            logAlamofireRequest(response: response)
            switch response.result {
            case .success:
                if let data = response.data {
                    completion(data)
                }
            case .failure(let error):
                failure(error.localizedDescription)
            }
        })
    }
    
    private static func logAlamofireRequest(response: DataResponse<Any>) {
        guard let request = response.request else { return }
        guard let url = request.url else { return }
        guard let httpMethod = request.httpMethod else { return }
        
        print("->REQUEST(\(httpMethod))\n\(url)\n")
        
        if let requestHeaders = request.allHTTPHeaderFields, !requestHeaders.isEmpty {
            print("->HEADERS\n\(requestHeaders)\n")
        }
        
        if let httpBody = request.httpBody {
            do {
                let jsonBody = try JSONSerialization.jsonObject(with: httpBody)
                print("->BODY\n\(jsonBody)\n")
            } catch {
                print("Error in the print of the body")
            }
        }
        
        if let responseData = response.response {
            let statusCode = responseData.statusCode
            let statusCodeString = (statusCode != 0) ? "(\(statusCode))" : ""
            print("->RESPONSE" + statusCodeString)
        }
        
        if let values = response.result.value {
            print(values)
        }
    }
    
}
