import Foundation

protocol ShowEpisodesServiceProtocol {
    func getEpisodes(showId: Int, completion: @escaping (Result<Episodes, ApiError>) -> Void)
}

final class ShowEpisodesService: ShowEpisodesServiceProtocol {
    func getEpisodes(showId: Int, completion: @escaping (Result<Episodes, ApiError>) -> Void) {
        let api = Api<Episodes>(endpoint: TVMazeEndpoints.showEpisodes(showId: showId))
        api.request { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
