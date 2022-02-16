//
//  TVMazeEndpoints.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

import Foundation

public enum TVMazeEndpoints {
    case shows(page: Int)
    case showEpisodes(showId: Int)
}

extension TVMazeEndpoints: ApiEndpointProtocol {
    public var scheme: String {
        "https"
    }
    
    public var host: String {
        "api.tvmaze.com"
    }
    
    public var path: String {
        switch self {
        case .shows:
            return "/shows"
        case .showEpisodes(let showId):
            return "/shows/\(showId)/episodes"
        }
    }
    
    public var parameters: [URLQueryItem]? {
        switch self {
        case .shows(let page):
            return [URLQueryItem(name: "page", value: page.description)]
        default:
            return nil
        }
    }
    
    public var method: String {
        "GET"
    }
}
