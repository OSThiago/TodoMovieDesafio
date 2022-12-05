//
//  SimilarMovieModel.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 03/12/22.
//

import Foundation

struct SimilarMoviesBaseModel: Decodable {
    var page: Int
    var results: [SimilarMovieModel]
}

struct SimilarMovieModel: Decodable {
    var id: Int
    var title: String
    var release_date: String
    var poster_path: String
    var genre_ids: [Int]
}
