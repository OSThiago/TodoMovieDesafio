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
    
    var similarMoviesModel = [SimilarMovieModel]()
    
    init(delegate: MovieDetaisDelegate) {
        self.delegate = delegate
    }
    
    func fetchMovieDetail(movieID: Int) {
        Task {
            do {
                let movieDetails = (try await ServiceTMDB.shared.getMovieDetails(id: movieID))
                self.movieDetailsModel = movieDetails
                //print(movieDetails)
            }
        }
        Task {
            do {
                let similarMovies = (try await ServiceTMDB.shared.getSimilarMovies(id: movieID))
                self.similarMoviesModel.append(contentsOf: similarMovies.results)
                //print(self.similarMoviesModel)
                delegate?.movieDetailsFeteched()
            }
        }
        
        //delegate?.movieDetailsFeteched()
    }
}
