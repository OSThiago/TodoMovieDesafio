//
//  MovieDetailsModel.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 02/12/22.
//

import Foundation

struct MovieDetailsModel: Decodable {
    var id: Int?
    var title: String?
    var vote_count: Int?
    var popularity: Double?
    var backdrop_path: String?
    var poster_path: String?
}
