//
//  ApiEndpointProtocol.swift
//  TVApp
//
//  Created by Ivo Dutra on 15/02/22.
//

import Foundation

public protocol ApiEndpointProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var method: String { get }
}
