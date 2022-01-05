//
//  Episode.swift
//  RickMortyApp
//
//  Created by Nevilkumar Lad on 06/01/22.
//

import Foundation


// MARK: - EpisodesData
struct EpisodesData: Codable {
    let results: [Episode]?
    let info: Info
}

// MARK: - Episode
struct Episode: Codable {
    let url: String?
    let characters: [String]?
    let id: Int?
    let created, episode, name, airDate: String?

    enum CodingKeys: String, CodingKey {
        case url, characters, id, created, episode, name
        case airDate = "air_date"
    }
}
