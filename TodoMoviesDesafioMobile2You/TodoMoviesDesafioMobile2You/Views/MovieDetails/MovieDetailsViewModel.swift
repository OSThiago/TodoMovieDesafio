//
//  MovieDetailsViewModel.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 02/12/22.
//

import Foundation

protocol MovieDetaisDelegate: AnyObject {
    func movieDetailsFeteched()
}

class MovieDetailsViewModel {
    
    private weak var delegate: MovieDetaisDelegate?
    
    var movieDetailsModel = MovieDetailsModel()
    
    init(delegate: MovieDetaisDelegate) {
        self.delegate = delegate
    }
    
    func fetchMovieDetail(movieID: Int) {
        Task {
            do {
                let movieDetails = (try await ServiceTMDB.shared.getMovieDetails(id: movieID))
                print(movieDetails)
                
                self.movieDetailsModel = movieDetails
                
                // Faz com que a view seja atualizada após terminar de baixar os dados
                delegate?.movieDetailsFeteched()
            }
        }
    }
}
