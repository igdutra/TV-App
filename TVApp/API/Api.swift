//
//  Api.swift
//  TVApp
//
//  Created by Ivo Dutra on 15/02/22.
//

import Foundation

class Api<Model: Decodable> {
    private let endpoint: ApiEndpointProtocol
    
    init(endpoint: ApiEndpointProtocol) {
        self.endpoint = endpoint
    }
    
    func request(completion: @escaping (Result<Model, ApiError>) -> Void) {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.parameters
        
        guard let url = components.url else { return completion(.failure(.invalidURL))}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
    
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                return completion(.failure(.generalError(err)))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(.clientOrServerError(response)))
            }
            
            guard let responseData = data else {
                return completion(.failure(.emptyData))
            }
            
            do {
                let responseObject = try JSONDecoder().decode(Model.self, from: responseData)
                completion(.success(responseObject))
            } catch let decodeError {
                return completion(.failure(.decodeError(decodeError)))
            }
        }
        dataTask.resume()
    }
}
