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
    
    // MY KEY to fech in API
    private let key = "5b65b89c8ead4ee6c270cf07f8e0e6d9"
    
    ///  Use to request single movie by id
    /// - Parameter id:`Int` value represents movie id
    /// - Returns:
    func getMovieDetails(id: Int) async throws -> MovieDetailsModel {
        
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
    
    /// Use to request a list of similar movies
    /// - Parameter id: `Int` value represents movie id
    /// - Returns: list of similar movies
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
    
    /// Use to request all genres
    /// - Returns: genre list with id and name
    func getGenresList() async throws -> GenresModel {
        
        let url = "https://api.themoviedb.org/3/genre/movie/list?api_key=5b65b89c8ead4ee6c270cf07f8e0e6d9&language=en-US"
        
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<GenresModel, Error>) in
            
            AF.request(url, method: .get)
                .responseDecodable(of: GenresModel.self) { response in
                    switch response.result {
                    case .success(let genresModel):
                        continuation.resume(returning: genresModel)
                    case .failure(_):
                        continuation.resume(throwing: APIError.genresError)
                    }
                }
        })
    }
}
