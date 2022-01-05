//
//  FontUtility.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//

import Foundation
import UIKit

struct Font {

  enum FontType {
    case installed(FontName)
    case custom(String)
    case system
    case systemBold
    case systemItatic
    case systemWeighted(weight: CGFloat)
    case monoSpacedDigit(size: Double, weight: Double)
  }

  enum FontSize {
    case standard(StandardSize)
    case custom(Double)
    var value: Double {
      switch self {
      case .standard(let size):
        return size.value
      case .custom(let customSize):
        return customSize
      }
    }
  }

  enum FontName: String {

    case black = "black"
    case blackItalic = "blackItalic"
    case bold = "bold"
    case boldItalic = "boldItalic"
    case light = "light"
    case lightItalic = "lightItalic"
    case medium = "medium"
    case mediumItalic = "mediumItalic"
    case book = "book"
    case bookItalic = "bookItalic"
    case extraLight = "extraLight"
    case extraLightItalic = "extraLightItalic"
    case thin = "thin"
    case thinItalic = "thinItalic"
    case ultraItalic = "ultraItalic"
    case ultra = "ultra"

    var value: String {
      return Environment.fetchFontNameFromConfiguration(forFontName: self.rawValue)
    }

    var weight: CGFloat {

      switch self {
      case .black, .blackItalic:
        return UIFont.Weight.black.rawValue
      case .bold, .boldItalic:
        return UIFont.Weight.bold.rawValue
      case .light, .lightItalic:
        return UIFont.Weight.light.rawValue
      case .medium, .mediumItalic:
        return UIFont.Weight.medium.rawValue
      case .book, .bookItalic:
        return UIFont.Weight.regular.rawValue
      case .extraLight, .extraLightItalic:
        return UIFont.Weight.thin.rawValue
      case .thin, .thinItalic:
        return UIFont.Weight.thin.rawValue
      case .ultra, .ultraItalic:
        return UIFont.Weight.ultraLight.rawValue
      }
    }
  }

  enum StandardSize: String {
    case h1 = "h1"
    case h2 = "h2"
    case h25 = "h25"
    case h3 = "h3"
    case h4 = "h4"
    case h5 = "h5"
    case h55 = "h55"
    case h6 = "h6"
    case h7 = "h7"
    case h8 = "h8"
    var value: Double {
      switch self {
      case .h1:
        return 36.0
      case .h2:
        return 30.0
      case .h25:
        return 25.0
      case .h3:
        return 22.0
      case .h4:
        return 18.0
      case .h5:
        return 15.0
      case .h55:
        return 14.0
      case .h6:
        return 13.0
      case .h7:
        return 11.0
      case .h8:
        return 10.0
      }
    }
  }

  var type: FontType
  var size: FontSize
  var name: String

  init(_ type: FontType, size: FontSize) {
    self.type = type
    self.size = size

    switch type {
    case .installed(let fontName):
      self.name = fontName.value
    default:
      self.name = "Gotham-Book"
    }
  }
}


extension Font {

  var instance: UIFont {

    var instanceFont: UIFont!

    switch type {

    case .custom(let fontName):
      guard let font =  UIFont(name: fontName, size: CGFloat(size.value)) else {
        fatalError("\(fontName) font is not installed, make sure it added in Info.plist and logged with AppUtility.sharedInstance.logAllAvailableFonts()")
      }
      instanceFont = font

    case .installed(let fontName):
      guard let font =  UIFont(name: fontName.value, size: CGFloat(size.value)) else {
        fatalError("\(fontName.value) font is not installed, make sure it added in Info.plist and logged with AppUtility.sharedInstance.logAllAvailableFonts()")
      }
      instanceFont = font

    case .system:
      instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value))

    case .systemBold:
      instanceFont = UIFont.boldSystemFont(ofSize: CGFloat(size.value))

    case .systemItatic:
      instanceFont = UIFont.italicSystemFont(ofSize: CGFloat(size.value))

    case .systemWeighted(let weight):
      instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value),
                                       weight: UIFont.Weight(rawValue: weight))
    case .monoSpacedDigit(let size, let weight):
      instanceFont = UIFont.monospacedDigitSystemFont(ofSize: CGFloat(size),
                                                      weight: UIFont.Weight(rawValue: CGFloat(weight)))
    }
    return instanceFont
  }
}
