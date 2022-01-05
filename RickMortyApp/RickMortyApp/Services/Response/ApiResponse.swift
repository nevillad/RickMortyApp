//
//  ApiResponse.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//

import Alamofire

struct ApiResponse: Decodable {
    var success: Bool?
    var msg: String?
    var data: AnyObject?

    private enum CodingKeys: String, CodingKey{
        case success, msg, data
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success) ?? false
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
    }
}
