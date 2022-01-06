//
//  ColorUtility.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//

import Foundation
import UIKit

enum Color: String {

    case primary = "primary"
    case secondary = "secondary"
    case border = "border"
    case separator = "separator"
    case primaryNavbar = "primaryNavbar"
    case navBarTitle = "navBarTitle"
    case navBarButtonTint = "navBarButtonTint"
    case white = "white"
    case black = "black"
    case red = "red"
    case lightText = "lightText"
    case darkBackground = "darkBackground"
    case lightBackground = "lightBackground"

    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }

}

extension Color {

    var value: UIColor {
        return UIColor(hexString: Environment.fetchColorCodeFromConfiguration(forColorType: self.rawValue))
    }

}

extension UIColor {
    /**
     Creates an UIColor from HEX String in `#363636` format `#RRGGBBAA` OR `#RRGGBB`

     - parameter hexString: HEX String in `#363636` format

     - returns: UIColor from HexString
     */
    convenience init(hexString: String) {
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner  = Scanner(string: hexString as String)

        if !hexString.hasPrefix("#") {
            debugPrint("Bad input: init(hexString: String) function")
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        } else {
            scanner.scanLocation = 1
            var color: UInt32 = 0
            scanner.scanHexInt32(&color)

            let mask = 0x000000FF
            let hasAlphaChar = hexString.count == 9

            let r = (hasAlphaChar ? Int(color >> 24) : Int(color >> 16)) & mask
            let g = (hasAlphaChar ? Int(color >> 16) : Int(color >> 8)) & mask
            let b = (hasAlphaChar ? Int(color >> 8) : Int(color)) & mask
            let a = hasAlphaChar ? Int(color) & mask : 255

            let red   = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue  = CGFloat(b) / 255.0
            let alpha = CGFloat(a) / 255.0

            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    }
}

extension UIColor {
    var hex: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        self.getRed(&r, green: &g, blue: &b, alpha: &a)

        let rInt = Int(r * 255) << 24
        let gInt = Int(g * 255) << 16
        let bInt = Int(b * 255) << 8
        let aInt = Int(a * 255)

        let rgba = rInt | gInt | bInt | aInt

        return String(format:"#%08x", rgba)
    }

    var shortHex: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        self.getRed(&r, green: &g, blue: &b, alpha: &a)

        return String(
            format: "#%02x%02x%02x",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }

}
