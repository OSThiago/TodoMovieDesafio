//
//  APIError.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 02/12/22.
//

import Foundation

enum APIError: LocalizedError {
    // Movies
    case moviesDetailsError
    case similarMoviesError
    case genresError
}

extension APIError {
    var errorDescription: String? {
        switch self {
        case .moviesDetailsError:
            return "Error on fetch movie details"
        case .similarMoviesError:
            return "Error on fetch similar Movies"
        case .genresError:
            return "Error on fetch genres list"
        }
    }
}
