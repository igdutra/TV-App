//
//  ShowDetailsViewModel.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import Foundation
// FIXME: NAME
// NOTE: ViewModel: pass to ViewController only the necessary Infos
struct ShowDetailsViewModel: Identifiable {
    let id: Int
    let name: String
    let image: String
    let days: [String]
    let genres: [String]
    let summary: String
}

extension ShowDetailsViewModel {
    init(from show: Show) {
        self.id = show.id
        self.name = show.name
        self.image = show.image.medium
        self.days = show.schedule.days
        self.genres = show.genres
        self.summary = show.summary
    }
}
