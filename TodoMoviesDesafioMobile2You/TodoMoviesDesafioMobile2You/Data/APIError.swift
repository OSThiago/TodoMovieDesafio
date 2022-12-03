//
//  APIError.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 02/12/22.
//

import Foundation

enum APIError: LocalizedError {
    // Images
    case imageRequestError
    case dataConversionToImageError
    
    // Movies
    case moviesDetailsError
}

extension APIError {
    var errorDescription: String? {
        switch self {
        case .imageRequestError:
            return "Error on fetch image"
        case .dataConversionToImageError:
            return "Error on convert data for image"
        case .moviesDetailsError:
            return "Error on fetch movie details"
        }
    }
}
