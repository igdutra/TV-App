import Foundation

typealias Shows = [Show]

// NOTE: It is not clear which properties can be nil, some shows have some, some don't.

// MARK: - Show
struct Show: Decodable, Identifiable {
    let id: Int
    let url: String?
    let name: String
    let type: String?
    let language: String?
    let genres: [String]
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let ended: String?
    let officialSite: String?
    let schedule: Schedule
    let rating: Rating?
    let weight: Int?
    let network, webChannel: Network?
    let dvdCountry: Country?
    let externals: Externals?
    let image: Image
    let summary: String
    let updated: Int?
    let links: ShowLinks?

    enum CodingKeys: String, CodingKey {
        // swiftlint:disable line_length
        case id, url, name, type, language, genres, status, runtime, averageRuntime, premiered, ended, officialSite, schedule, rating, weight, network, webChannel, dvdCountry, externals, image, summary, updated
        case links = "_links"
    }
}

// MARK: - Links
struct ShowLinks: Decodable {
    let linksSelf, previousepisode: Nextepisode?
    let nextepisode: Nextepisode?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousepisode, nextepisode
    }
}
