//
//  CustomLabel.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//

import UIKit

class CustomLabel: UILabel {

    var oldtext: String?

    override var text: String? {
        willSet {
            oldtext = text
        }

        didSet {
            guard let newText = text else {
                return
            }

            if oldtext != newText {
                self.text = NSLocalizedString(newText, comment: "localised version of the text")
            }
        }
    }

    @IBInspectable var LabelColor : String?  {
        willSet {
            if let newColor = Color(rawValue : newValue ?? "") {
                self.textColor = newColor.value
            }
        }
    }

    @IBInspectable var Size : String? {
        willSet {
            if let newSize = Font.StandardSize(rawValue : newValue?.lowercased() ?? "")  {
                self.font = self.font.withSize(CGFloat(newSize.value))
            }
        }
    }

    @IBInspectable var Weight : String? {
        willSet {
            if let newFont = Font.FontName(rawValue: newValue ?? "") {
                self.font = Font(.installed(newFont), size: .custom(Double(self.font.pointSize))).instance
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        if LabelColor == nil {
            self.textColor = Color.black.value
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if LabelColor == nil {
            self.textColor = Color.black.value
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        if let currentText = text  {
            self.text = currentText
        }
    }

}
