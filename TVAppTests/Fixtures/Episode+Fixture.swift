//
//  Episode+Fixture.swift
//  TVAppTests
//
//  Created by Ivo Dutra on 16/03/22.
//

import Foundation
@testable import TVApp

extension Episode {
    static func fixture(id: Int = .init(),
                        url: String = .init(),
                        name: String = .init(),
                        season: Int = .init(),
                        number: Int  = .init(),
                        type: String = .init(),
                        airdate: String = .init(),
                        airtime: String = .init(),
                        airstamp: String = .init(),
                        runtime: Int = .init(),
                        rating: Rating = .init(average: 0),
                        image: Image = .init(medium: .init(), original: .init()),
                        summary: String = .init(),
                        links: EpisodeLinks? = nil
    ) -> Episode {
        return .init(id: id,
                     url: url,
                     name: name,
                     season: season,
                     number: number,
                     type: type,
                     airdate: airdate,
                     airtime: airtime,
                     airstamp: airstamp,
                     runtime: runtime,
                     rating: rating,
                     image: image,
                     summary: summary,
                     links: links)
    }
}
