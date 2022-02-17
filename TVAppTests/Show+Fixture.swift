//
//  Show+Fixture.swift
//  TVAppTests
//
//  Created by Ivo Dutra on 17/02/22.
//

import Foundation
@testable import TVApp

extension Show {
    static func fixture(id: Int = 1,
                        url: String = .init(),
                        name: String = .init(),
                        type: String? = nil,
                        language: String? = nil,
                        genres: [String] = [],
                        status: String = .init(),
                        runtime: Int? = nil,
                        averageRuntime: Int? = nil,
                        premiered: String = .init(),
                        ended: String? = nil,
                        officialSite: String? = nil,
                        schedule: Schedule = Schedule(time: String(), days: []),
                        rating: Rating? = nil,
                        weight: Int = 0,
                        network: Network? = nil,
                        webChannel: Network? = nil,
                        dvdCountry: Country? = nil,
                        externals: Externals = .init(tvrage: 0, thetvdb: 0, imdb: nil),
                        image: Image = Image(medium: String(), original: String()),
                        summary: String = .init(),
                        updated: Int = 0,
                        links: ShowLinks? = nil
    ) -> Show {
        return .init(id: id,
                     url: url,
                     name: name,
                     type: type,
                     language: language,
                     genres: genres,
                     status: status,
                     runtime: runtime,
                     averageRuntime: averageRuntime,
                     premiered: premiered,
                     ended: ended,
                     officialSite: officialSite,
                     schedule: schedule,
                     rating: rating,
                     weight: weight,
                     network: network,
                     webChannel: webChannel,
                     dvdCountry: dvdCountry,
                     externals: externals,
                     image: image,
                     summary: summary,
                     updated: updated,
                     links: links)
    }
}
