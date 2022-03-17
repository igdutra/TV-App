//
//  ShowDetailsViewModel.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

import Foundation

struct ShowDetails: Identifiable, Equatable {
    let id: Int
    let name: String
    let image: String
    let schedule: String
    let genres: String
    let summary: NSAttributedString
}

extension ShowDetails {
    init(from show: Show) {
        self.id = show.id
        self.name = show.name
        self.image = show.image.medium
        self.schedule = show.schedule.days.joined(separator: ", ") + " " + (show.schedule.time ?? .init())
        self.genres = show.genres.joined(separator: ", ")
        self.summary = show.summary.htmlAttributed() ?? show.summary.withoutHtmlTags
    }
}
