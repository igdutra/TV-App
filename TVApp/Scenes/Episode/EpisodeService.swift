import Foundation

protocol EpisodeServicing {
    func getEpisode(completion: @escaping (Result<Episodes, ApiError>) -> Void)
}

final class EpisodeService: EpisodeServicing {
    func getEpisode(completion: @escaping (Result<Episodes, ApiError>) -> Void) {
        let api = Api<Episodes>(endpoint: TVMazeEndpoints.showEpisodes(showId: 1))
        api.request { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
