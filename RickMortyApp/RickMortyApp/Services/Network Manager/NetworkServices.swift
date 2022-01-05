//
//  NetworkServices.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//


import Alamofire

enum CustomResult<T> {
    case success(T)
    case failure(Error)
}

enum CustomeErrors: Error {
    case backend
    case decodingFailed
    case dataUnavailable
    case custome(message: String)
    ///To show  bottom error prompt with user action
    case customErrorPrompt(message: String)
    ///To show top bar error pop up/ banner with auto dismissal
    case customErrorPopup(message: String)
}

struct Resource<T: Decodable> {
    let url: String
    var body: Parameters?
    var httpMethod = HTTPMethod.get
}

final class NetworkServices {

    static func fetchJson<T>(resource: Resource<T>,
                             completion: @escaping(CustomResult<T>) -> Void) {

        let request = AF.request(
            resource.url,
            method: resource.httpMethod
        )
        request.responseData { (response) in
            if let data = response.data {
                //debugPrint(response)
                if let decodeData = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(decodeData))
                } else {
                    completion(.failure(CustomeErrors.decodingFailed))
                }
            } else {
                completion(.failure(CustomeErrors.dataUnavailable))
            }
        }
    }

}

