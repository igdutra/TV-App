import Foundation

protocol EpisodeServicing {
    func getEpisode(completion: @escaping (Result<EpisodeResponse, ApiError>) -> Void)
}

final class EpisodeService: EpisodeServicing {
    func getEpisode(completion: @escaping (Result<EpisodeResponse, ApiError>) -> Void) {
        let api = Api<EpisodeResponse>(endpoint: TVMazeEndpoints.episodesWithParameters)
        api.request { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
