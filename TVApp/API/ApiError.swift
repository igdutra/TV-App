//
//  ApiError.swift
//  TVApp
//
//  Created by Ivo Dutra on 15/02/22.
//

import Foundation

enum ApiError: Error {
    case clientOrServerError(URLResponse?)
    case emptyData
    case decodeError(Error)
    case generalError(Error)
}
