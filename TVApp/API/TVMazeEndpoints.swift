//
//  TVMazeEndpoints.swift
//  TVApp
//
//  Created by Ivo Dutra on 14/02/22.
//

enum TVMazeEndpoints {
    case showsIndex
}

extension TVMazeEndpoints {
    var path: String {
        switch self {
        case .showsIndex:
            return "/shows"
        }
    }
}
