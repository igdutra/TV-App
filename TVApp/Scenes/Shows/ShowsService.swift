import Foundation

protocol ShowsServiceProtocol {
    func getShows(page: Int, completion: @escaping (Result<Shows, ApiError>) -> Void)
}

final class ShowsService: ShowsServiceProtocol {
    func getShows(page: Int, completion: @escaping (Result<Shows, ApiError>) -> Void) {
        let api = Api<Shows>(endpoint: TVMazeEndpoints.shows(page: page))
        api.request { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
