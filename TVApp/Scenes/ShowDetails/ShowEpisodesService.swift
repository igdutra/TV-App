import Foundation

protocol ShowEpisodesServicing {
    func getEpisodes(showId: Int, completion: @escaping (Result<Episodes, ApiError>) -> Void)
}

final class ShowEpisodesService: ShowEpisodesServicing {
    func getEpisodes(showId: Int, completion: @escaping (Result<Episodes, ApiError>) -> Void) {
        let api = Api<Episodes>(endpoint: TVMazeEndpoints.showEpisodes(showId: 1))
        api.request { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
