//
//  MockSimilarMovies.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 03/12/22.
//

import Foundation

// MARK: - MOCK SIMILAR MOVIE
extension SimilarMovieModel {
    static let JusticeLeague: Self = .init(
        id: 14011,
        title: "Justice League: The New Frontier",
        release_date: "2008-02-26",
        poster_path: "/z9VHoUcZ1GiH3f3qYz7Me7Zc1Fd.jpg",
        genre_ids: [
            16,
            10751,
            12,
            35
        ]
    )
    
    static let Watchmen: Self = .init(
        id: 13183,
        title: "Watchmen",
        release_date: "2009-03-04",
        poster_path: "/1MpPEstGQPEsLJM9FGHqJUGtO6S.jpg",
        genre_ids: [
            27,
            14,
            16,
            10751
        ]
    )
}
