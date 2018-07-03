//
//  Network.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import Alamofire

class Network {
    
    static func request(url: URL, method: EnumNetworkMethod = .get, parameters: Parameters? = nil, headers: [String: String]? = nil, encoding: ParameterEncoding = JSONEncoding.default, log: Bool = true, completion: @escaping ([String:Any]) -> Void, failure: @escaping(_ error: String) -> Void) {
        let alamofireMethod = HTTPMethod.init(rawValue: method.rawValue) ?? .get
        Alamofire.SessionManager.default.request(url, method: alamofireMethod, parameters: parameters, encoding: encoding, headers: headers).responseJSON(completionHandler: { response in
            if log {
                logAlamofireRequest(response: response)
            }
            guard let statusCode = response.response?.statusCode, statusCode == 200, let result = response.result.value! as? [String:Any]  else {
                var errorMessage = "Error in loading data of API"
                if let result = response.result.value! as? [String:Any], let message = result["message"] as? String {
                    errorMessage = message
                }
                failure(errorMessage)
                return
            }
            completion(result)
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
