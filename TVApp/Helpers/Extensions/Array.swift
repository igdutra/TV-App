//
//  Array.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

extension Array {
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
