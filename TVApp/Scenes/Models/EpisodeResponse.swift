import Foundation

typealias Episodes = [EpisodeResponse]

struct EpisodeResponse: Decodable, Identifiable {
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
    let links: EpisodeLinks

    enum CodingKeys: String, CodingKey {
        case id, url, name, season, number, type, airdate, airtime, airstamp, runtime, rating, image, summary
        case links = "_links"
    }
}

// MARK: - Links
struct EpisodeLinks: Decodable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}
