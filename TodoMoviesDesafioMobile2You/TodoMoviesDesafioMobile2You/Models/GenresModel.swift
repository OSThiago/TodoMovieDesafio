//
//  GenresModel.swift
//  TodoMoviesDesafioMobile2You
//
//  Created by Thiago de Oliveira Sousa on 05/12/22.
//

import Foundation

struct GenresModel: Decodable {
    var genres:[GenreModel]
}

struct GenreModel: Decodable {
    var id: Int
    var name: String
}

// MARK: - ALL GENRES
extension GenresModel {
    static let AllGenres: Self = .init(
        genres: [
            GenreModel.action,
            GenreModel.adventure,
            GenreModel.Animation,
            GenreModel.Comedy,
            GenreModel.Crime,
            GenreModel.Documentary,
            GenreModel.Drama,
            GenreModel.Family,
            GenreModel.Fantasy,
            GenreModel.History,
            GenreModel.Horror,
            GenreModel.Music,
            GenreModel.Mystery,
            GenreModel.Romance,
            GenreModel.ScienceFiction,
            GenreModel.TVMovie,
            GenreModel.Thriller,
            GenreModel.War,
            GenreModel.Western
        ])
}


// MARK: - MOCK GENRE
extension GenreModel {
    static let action: Self = .init(id: 28, name: "Action")
    static let adventure: Self = .init(id: 12, name: "Adventure")
    static let Animation: Self = .init(id: 16, name: "Animation")
    static let Comedy: Self = .init(id: 35, name: "Comedy")
    static let Crime: Self = .init(id: 80, name: "Crime")
    static let Documentary: Self = .init(id: 99, name: "Documentary")
    static let Drama: Self = .init(id: 18, name: "Drama")
    static let Family: Self = .init(id: 10751, name: "Family")
    static let Fantasy: Self = .init(id: 14, name: "Fantasy")
    static let History: Self = .init(id: 36, name: "History")
    static let Horror: Self = .init(id: 27, name: "Horror")
    static let Music: Self = .init(id: 10402, name: "Music")
    static let Mystery: Self = .init(id: 9648, name: "Mystery")
    static let Romance: Self = .init(id: 10749, name: "Romance")
    static let ScienceFiction: Self = .init(id: 878, name: "Science Fiction")
    static let TVMovie: Self = .init(id: 10770, name: "TV Movie")
    static let Thriller: Self = .init(id: 53, name: "Thriller")
    static let War: Self = .init(id: 10752, name: "War")
    static let Western: Self = .init(id: 37, name: "Western")

    
}
