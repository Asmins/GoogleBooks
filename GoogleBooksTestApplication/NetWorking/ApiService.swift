//
//  ApiService.swift
//  GoogleBooksTestApplication
//
//  Created by Asmins on 03.03.17.
//  Copyright © 2017 Asmins. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ApiRequestProtocol {
    func apiResponse(completion: @escaping (DataResponse<JSON>) -> Void) -> Self
}

protocol ApiManagerProtocol {
    func apiRequest(_ endPoint: Router, parameters: [String:Any]?, headers: [String: String]?) -> ApiRequestProtocol
}

extension ApiManagerProtocol {
    func apiRequest(_ endpoint: Router) -> ApiRequestProtocol {
        return apiRequest(endpoint, parameters: [:], headers: [:])
    }

    func apiRequest(_ endpoint: Router, parameters: [String : AnyObject]?) -> ApiRequestProtocol {
        return apiRequest(endpoint, parameters: parameters, headers: nil)
    }
}

extension SessionManager: ApiManagerProtocol {
    func apiRequest(_ endPoint: Router, parameters: [String : Any]?, headers: [String : String]?) -> ApiRequestProtocol {
        return request(endPoint.url, method: endPoint.httpMethod, parameters: parameters, encoding: URLEncoding.default, headers: headers)
    }
}

extension Alamofire.DataRequest: ApiRequestProtocol {
    static func apiResponseSerializer() -> DataResponseSerializer<JSON> {
        return DataResponseSerializer { _, _, data, error in
            if let error = error {
                return .failure(error)
            }

            guard let validData = data else {
                let reason = "Data could not be serialized. Input data was nil."
                return .failure(NSError(domain: "my domain", code: 1001, userInfo: [NSLocalizedDescriptionKey : reason]))
            }

            do {
                let json = try JSONSerialization.jsonObject(with: validData, options: [])
                // TODO: Should consider HTTP response as well.
                return sanitizeError(json: JSON(json))
            } catch let error as NSError {
                return .failure(error)
            }
        }
    }

    static func sanitizeError(json: JSON) -> Result<JSON> {
        if json["error"].array == nil {
            return .success(json)
        }

        let code = json["error"]["code"].intValue
        let message = json["error"]["message"].stringValue
        let error = NSError(domain: "my domain", code: code, userInfo: [NSLocalizedDescriptionKey : message])
        return .failure(error)
    }

    func apiResponse(completion: @escaping (DataResponse<JSON>) -> Void) -> Self {
        return response(responseSerializer: DataRequest.apiResponseSerializer(), completionHandler: completion)
    }
}
