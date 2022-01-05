//
//  ApiUtility.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//

import Foundation
import Alamofire

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

    func getDefaultHTTPHeaders() -> HTTPHeaders {
        // NOTE: app crashes if no bundle versions are set for the current target
        guard let bundleVersion = Bundle.main.infoDictionary!["CFBundleVersion"] as? String else {
            fatalError("Could not get app bundle version.")
        }

        let headers: HTTPHeaders = [
            "DeviceType":  DEVICE_TYPE,
            "Version": bundleVersion,
            "App": AppUtility.sharedInstance.appDetails.appName,
            "languagecode": LANGUAGE_CODE,
            "Content-Type": "application/json"
        ]

        return headers
    }

    func parseJSON(_ inputData: Data) -> NSDictionary? {
        do {
            let boardsDictionary: NSDictionary = try JSONSerialization.jsonObject(with: inputData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            return boardsDictionary

        } catch _ {
            return nil
        }
    }

}
