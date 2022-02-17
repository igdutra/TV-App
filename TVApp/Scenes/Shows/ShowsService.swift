import Foundation

protocol ShowsServicing {
    func getShows(page: Int, completion: @escaping (Result<Shows, ApiError>) -> Void)
}

final class ShowsService: ShowsServicing {
    func getShows(page: Int, completion: @escaping (Result<Shows, ApiError>) -> Void) {
        let api = Api<Shows>(endpoint: TVMazeEndpoints.shows(page: page))
        api.request { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
