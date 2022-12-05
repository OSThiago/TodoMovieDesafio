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
//    var backdrop_path: String?
    var poster_path: String?
}

extension MovieDetailsModel {
    
    static let mock: Self = .init(
        id: 436270,
        title: "Black Adam",
        vote_count: 2267,
        popularity: 10405.742,
//        backdrop_path: <#T##String?#>,
        poster_path: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg"
    )
}
