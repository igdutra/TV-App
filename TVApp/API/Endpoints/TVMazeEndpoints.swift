//
//  TVMazeEndpoints.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

import Foundation

public enum TVMazeEndpoints {
    case showsIndex
    case episodes
    case episodesWithParameters
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
        case .showsIndex:
            return "/shows"
        case .episodes:
            return "/episodes/1"
        case .episodesWithParameters:
            return "/shows/1/episodebynumber"
        }
    }
    
    public var parameters: [URLQueryItem]? {
        switch self {
        case .episodesWithParameters:
            return [URLQueryItem(name: "season", value: "1"),
                    URLQueryItem(name: "number", value: "1")]
        default:
            return nil
        }
    }
    
    public var method: String {
        "GET"
    }
}
