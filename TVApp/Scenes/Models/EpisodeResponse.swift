import Foundation

struct EpisodeResponse: Decodable {
    let id: Int
    let url: String
    let name: String
    let season, number: Int
    let type, airdate, airtime: String
    let airstamp: String
    let runtime: Int
    let rating: Rating
    let image: Image
    let summary: String
    let links: Links

    enum CodingKeys: String, CodingKey {
        case id, url, name, season, number, type, airdate, airtime, airstamp, runtime, rating, image, summary
        case links = "_links"
    }
}

// MARK: - Image
struct Image: Decodable {
    let medium, original: String
}

// MARK: - Links
struct Links: Decodable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double
}
