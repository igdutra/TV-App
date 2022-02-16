//
//  ViewConfiguration.swift
//  TVApp
//
//  Created by Ivo Dutra on 16/02/22.
//

protocol ViewConfiguration: AnyObject {
    func viewSetup()
    func setupHierarchy()
    func setupConstraints()
    func setupConfigurations()
    func setupAccessibility()
}

extension ViewConfiguration {
    func viewSetup() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
        setupAccessibility()
    }
    
    func setupAccessibility() {
        // Option Method
    }
}
