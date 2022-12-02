//
//  ServiceTMDB.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 30/11/22.
//

import Foundation
import Alamofire

class ServiceTMDB {
    
    static let shared = ServiceTMDB()
    
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    
    // Minha chave de acesso para fazer as requests na API
    private let key = "5b65b89c8ead4ee6c270cf07f8e0e6d9"
    
    /// Usado para fazer request de um filme especifíco
    /// - Parameter id: Valor `Int` que representa o ID do filme
    /// - Returns:
    func getMovieDetails(id: Int) async throws -> MovieDetailsModel {
        
        // Combinação da url base com id do filme e chave de acesso
        let url = "\(baseURL)\(id)?api_key=\(key)"
        
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<MovieDetailsModel, Error>) in
            
            AF.request(url, method: .get)
                .responseDecodable(of: MovieDetailsModel.self) { response in
                    switch response.result {
                    case .success(let movieDetails):
                        continuation.resume(returning: movieDetails)
                        
                    case .failure(_):
                        continuation.resume(throwing: APIError.moviesDetailsError)
                    }
                }
        })
    }
}

struct MovieDetailsModel: Decodable {
    var id: Int?
    var title: String?
    var vote_count: Int?
    var popularity: Float?
    var backdrop_path: String?
    var poster_path: String?
}

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
