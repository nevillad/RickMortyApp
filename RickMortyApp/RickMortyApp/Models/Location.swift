//
//  Location.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//

import Foundation

// MARK: - LocationData
struct LocationData: Codable {
    let results: [LocationDetails]
    let info: Info
}

// MARK: - LocationDetails
struct LocationDetails: Codable {
    let dimension: String?
    let id: Int?
    let created, type: String?
    let residents: [String]?
    let name: String?
    let url: String?
}
