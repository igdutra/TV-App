//
//  EpisodeService.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

import Foundation

final class EpisodeService {
  
    func getEpisode(completion: @escaping (Result<Episode, Error>) -> Void) {
        guard let url = URL(string: "https://api.tvmaze.com/episodes/1") else { return }
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { data, response, error in
            // 5.
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }
            guard response != nil, let data = data else {
                return
            }
            do {
                let responseObject = try JSONDecoder().decode(Episode.self, from: data)
                // 7.
                DispatchQueue.main.async {
                    // 8.
                    completion(.success(responseObject))
                }
            } catch let error {
                // TODO: create error enum
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
