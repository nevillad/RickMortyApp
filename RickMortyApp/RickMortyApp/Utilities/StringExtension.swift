//
//  StringExtension.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 05/01/22.
//

import Foundation
import UIKit

extension String {

    func isEmpty() -> Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }

}
