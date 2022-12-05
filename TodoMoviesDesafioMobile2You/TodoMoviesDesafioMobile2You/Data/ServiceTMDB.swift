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
    
    let baseURL = "https://api.themoviedb.org/3/movie/"
    
    let baseImage = "https://image.tmdb.org/t/p/w500/"
    
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
    
    func getSimilarMovies(id: Int) async throws -> SimilarMoviesBaseModel {
        
        let url = "\(baseURL)\(id)/similar?api_key=\(key)&page=1"
        
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<SimilarMoviesBaseModel, Error>) in
            
            AF.request(url, method: .get)
                .responseDecodable(of: SimilarMoviesBaseModel.self) { response in
                    switch response.result {
                    case .success(let similarMoviesBaseModel):
                        continuation.resume(returning: similarMoviesBaseModel)
                    case .failure(_):
                        continuation.resume(throwing: APIError.similarMoviesError)
                    }
                }
            
        })
    }
    
    
}
