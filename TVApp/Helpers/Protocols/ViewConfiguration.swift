//
//  ViewConfiguration.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

protocol ViewConfiguration: AnyObject {
    func setup()
    func setupHierarchy()
    func setupConstraints()
    func setupConfigurations()
    func setupAccessibility()
}

extension ViewConfiguration {
    func setup() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
        setupAccessibility()
    }
    
    func setupAccessibility() {
        // Option Method
    }
}
