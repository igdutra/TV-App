//
//  CommonModels.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import Foundation

// MARK: - Image
struct Image: Decodable {
    let medium, original: String
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double?
}

// MARK: - Externals
struct Externals: Codable {
    let tvrage: Int?
    let thetvdb: Int?
    let imdb: String?
}

// MARK: - Nextepisode
struct Nextepisode: Decodable {
    let href: String?
}

// MARK: - Network
struct Network: Decodable {
    let id: Int
    let name: String?
    let country: Country?
    let officialSite: String?
}

// MARK: - Country
struct Country: Decodable {
    let name: String?
    let code: String?
    let timezone: String?
}

// MARK: - Schedule
struct Schedule: Codable {
    let time: String?
    let days: [String]
}
