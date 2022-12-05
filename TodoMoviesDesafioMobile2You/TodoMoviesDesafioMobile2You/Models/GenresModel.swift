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

// MARK: - MOCK GENRES
extension GenresModel {
    static let mockGenres: Self = .init(
        genres: [
            GenreModel.action,
            GenreModel.adventure
        ])
}


// MARK: - MOCK GENRE
extension GenreModel {
    static let action: Self = .init(id: 28, name: "Action")
    static let adventure: Self = .init(id: 12, name: "Adventure")
}

/*
 "genres": [
         {
             "id": 28,
             "name": "Action"
         },
         {
             "id": 12,
             "name": "Adventure"
         },
         {
             "id": 16,
             "name": "Animation"
         },
         {
             "id": 35,
             "name": "Comedy"
         },
         {
             "id": 80,
             "name": "Crime"
         },
         {
             "id": 99,
             "name": "Documentary"
         },
         {
             "id": 18,
             "name": "Drama"
         },
         {
             "id": 10751,
             "name": "Family"
         },
         {
             "id": 14,
             "name": "Fantasy"
         },
         {
             "id": 36,
             "name": "History"
         },
         {
             "id": 27,
             "name": "Horror"
         },
         {
             "id": 10402,
             "name": "Music"
         },
         {
             "id": 9648,
             "name": "Mystery"
         },
         {
             "id": 10749,
             "name": "Romance"
         },
         {
             "id": 878,
             "name": "Science Fiction"
         },
         {
             "id": 10770,
             "name": "TV Movie"
         },
         {
             "id": 53,
             "name": "Thriller"
         },
         {
             "id": 10752,
             "name": "War"
         },
         {
             "id": 37,
             "name": "Western"
         }
     ]
 */
