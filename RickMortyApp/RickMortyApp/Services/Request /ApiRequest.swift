//
//  APIRequest.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//

import Foundation
import Alamofire

open class ApiRequest {
    static var sessionManager: Session?

    static func AlamofireRequest (_ url: String,
                                  method: HTTPMethod = .post,
                                  parameters: Parameters? = nil,
                                  encoding: ParameterEncoding = JSONEncoding.default,
                                  headers: HTTPHeaders = [:],
                                  completionHandler: @escaping (_ response: DataResponse<ApiResponse, AFError>) -> Void) {

        if sessionManager == nil {
            sessionManager = configureSessionManager()
        }

        var encode: ParameterEncoding = encoding
        if method == .get {
            encode = URLEncoding.default
        }

        var headers = headers
        if headers.isEmpty {
            headers = ApiUtility.sharedInstance.getDefaultHTTPHeaders()
        }

        let request = sessionManager?.request( url,
                                         method: method,
                                         parameters: parameters,
                                         encoding: encode,
                                         headers: headers)
        request?.responseDecodable(completionHandler: completionHandler)
    }

    static func configureSessionManager() -> Session {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.timeoutIntervalForRequest = 180
        configuration.timeoutIntervalForResource = 180

        return Session(configuration: configuration)
    }

}
