//
//  EpisodeDetails.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/03/22.
//

import Foundation

struct EpisodeDetails: Identifiable {
    let id: Int
    let image: String
    let name: String
    let season: String
    let number: String
    let summary: NSAttributedString
}

extension EpisodeDetails {
    init(from episode: Episode) {
        self.id = episode.id
        self.name = episode.name
        self.image = episode.image.original
        self.season = episode.season.description
        self.number = episode.number.description
        self.summary = episode.summary.htmlAttributed() ?? episode.summary.withoutHtmlTags
    }
}
