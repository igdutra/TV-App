//
//  EpisodeService.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

import Foundation

final class EpisodeService {
    func getEpisode(completion: @escaping (Result<EpisodeResponse, ApiError>) -> Void) {
        let api = Api<EpisodeResponse>(endpoint: TVMazeEndpoints.episodesWithParameters)
        api.request { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
