//
//  ViewSetup.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 02/12/22.
//

import Foundation

protocol ViewSetup {
    func addViews()
    func setupConstraints()
    func otherConfigurations()
    func setupView()
}

extension ViewSetup {
    func setupView() {
        addViews()
        setupConstraints()
        otherConfigurations()
    }
}
