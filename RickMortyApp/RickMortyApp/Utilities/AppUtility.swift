//
//  AppUtility.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//

import Foundation
import Reachability
import UIKit

struct AppDetails {
    var appName: String
    var displayName: String
}

open class AppUtility: NSObject {
    static var sharedInstance = AppUtility()

    // MARK: - Properties
    let appDetails: AppDetails = {
        return AppDetails(appName: Environment.appName, displayName: Environment.displayName)
    }()
    /// isOnline to get the status of network
    /// `True` - indicates that network is reachble
    /// `False` - indicates that  network is not reachble
    var isOnline = false
    /// Global object of reachability for customised uses
    var reachability: Reachability?

    // MARK: - Methods
    /// Logs all available fonts from iOS SDK and installed custom font
    func logAllAvailableFonts() {
        for family in UIFont.familyNames {
            debugPrint("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                debugPrint("   \(name)")
            }
        }
    }
}


