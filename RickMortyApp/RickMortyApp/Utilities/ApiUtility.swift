//
//  ApiUtility.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//

import Foundation

enum ApiActions: String {
    case getCharacters = "character"
    case getLocations = "location"
    case getEpisodes = "episode"

    var finalURL: String {
        return BaseURL + self.rawValue
    }

}

class ApiUtility: NSObject {
    static var sharedInstance = ApiUtility()

    func parseJSON(_ inputData: Data) -> NSDictionary? {
        do {
            let boardsDictionary: NSDictionary = try JSONSerialization.jsonObject(with: inputData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            return boardsDictionary

        } catch _ {
            return nil
        }
    }

}
