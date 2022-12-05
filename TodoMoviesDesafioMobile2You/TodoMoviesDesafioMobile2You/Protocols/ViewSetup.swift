//
//  ViewSetup.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 02/12/22.
//

import Foundation

protocol ViewSetup {
    /// Use to add views
    func addViews()
    
    /// Use to set components constraints
    func setupConstraints()
    
    /// Use to set others configurations like background
    func otherConfigurations()
    
    /// Use to add protocols funtions in view
    /// add into viewDidLoad() function
    func setupView()
}

extension ViewSetup {
    func setupView() {
        addViews()
        setupConstraints()
        otherConfigurations()
    }
}
