//
//  Environment.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//

import Foundation
import Foundation

/// Defines set of Environment variables that will be used across the app for different Environments. Mainly corresponds to Local Staging/UAT, Production Debug and Production Release.
enum Environment {

    /// List of Keys set in the Information Dictionary.
    enum Keys {

        enum API: String {
            case baseURL = "AppBaseURL"
            case isDebugMode = "IsDebugMode"
        }

        enum AppDetails: String {
            case appName = "AppName"
            case displayName = "Display"
        }

    }

    /// Method to fetch Info Dictionary for the specific Environment
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    /// Returns BASE URL String set in the configuration.
    static let baseURL: String = {
        guard let baseURL = Environment.infoDictionary[Keys.API.baseURL.rawValue] as? String else {
            fatalError("Base URL is not set in the plist for the current environment.")
        }
        return baseURL
    }()

    /// Returns areDebugMode value set in the configuration.
    static let isDebugMode: Bool  = {
        guard let localizedIsDebugMode = Environment.infoDictionary[Keys.API.isDebugMode.rawValue] as? String else {
            fatalError("IsAppStoreBuild value is not set in the plist for the current environment.")
        }

        guard let value = Bool(localizedIsDebugMode) else {
            fatalError("Could not create Bool type with the given isAppStoreBuild value")
        }

        return value
    }()


    // MARK: - API
    private static let appDetails: [String: String] = {
        guard let appdetails = Environment.infoDictionary["AppDetails"] as? [String: String] else {
            fatalError("App Details are not set in the plist for the current environment.")
        }
        return appdetails
    }()

    static let appName: String = {
        guard let sourceApp = Environment.appDetails[Keys.AppDetails.appName.rawValue] else {
            fatalError("App name is not set in the plist for the current environment.")
        }

        return sourceApp
    }()

    static let displayName: String = {
        guard let displayName = Environment.appDetails[Keys.AppDetails.displayName.rawValue] else {
            fatalError("Display name is not set in the plist for the current environment.")
        }

        return displayName
    }()

    // MARK: - Color
    private static let colors: [String: String] = {
        guard let colors = Environment.infoDictionary["Colors"] as? [String: String] else {
            fatalError("Colors are not set in the plist for the current environment.")
        }
        return colors
    }()

    /** Returns Color Code based on the Color Type passed from the configuration.
     - Parameter colorType: Custom Color Name
     */
    static func fetchColorCodeFromConfiguration(forColorType colorType: String) -> String {
        guard let colorCode = Environment.colors[colorType] else {
            fatalError("The given color type has not been set in plist for the current environment.")
        }

        return colorCode
    }

    // MARK: - Font
    private static let fonts: [String: String] = {
        guard let fonts = Environment.infoDictionary["Fonts"] as? [String: String] else {
            fatalError("Fonts are not set in the plist for the current environment.")
        }
        return fonts
    }()

    /** Returns Font Name based on the Font Type passed from the configuration.
     - Parameter fontName: Custom Font Name
     */
    static func fetchFontNameFromConfiguration(forFontName fontName: String) -> String {
        guard let fontName = Environment.fonts[fontName] else {
            fatalError("The given font name has not been set in plist for the current environment.")
        }

        return fontName
    }

    /* ================================================================
     MARK: Returns Font File name based on the Font Type passed
     from the configuration.
     ================================================================ */
    static func fetchFontFileFromConfiguration(forFontType fontType: String) -> String {
        guard let fontFileName = Environment.infoDictionary[fontType] as? String else {
            fatalError("The given font type has not been set in plist for the current environment.")
        }

        return fontFileName
    }

    /* ================================================================
     MARK: Returns Font File name based on the Font Type passed
     from the configuration.
     ================================================================ */
    static func fetchFontSizeFromConfiguration(forFontSizeType fontSizeType: String) -> Double {
        guard let fontSizeString = Environment.infoDictionary[fontSizeType] as? String else {
            fatalError("The given font type has not been set in plist for the current environment.")
        }

        guard let fontSize = Double(fontSizeString) else {
            fatalError("Could not create font size from given font size string.")
        }

        return fontSize
    }
}
