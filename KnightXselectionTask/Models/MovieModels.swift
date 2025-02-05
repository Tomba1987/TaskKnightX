//
//  MovieModels.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import Foundation

struct TopRatedMovieListItem: Codable, Equatable, Identifiable {
    var id: Int
    var backdrop_path: String
    var poster_path: String
    var title: String
    var overview: String
    var genre_ids: [Int]
    var release_date: String
}

struct MovieItem {
    var id: Int
    var backdrop_path: String
    var poster_path: String?
    var title: String
    var overview: String
    var genre_ids: [Int]
    var release_date: String
    var isFavorite: Bool = false
    var isChecked: Bool = false
}

struct MovieDetails: Codable {
    var title: String
    var genres: [Genre]
    var status: String
    var release_date: String
    var overview: String
    var backdrop_path: String
}

struct Genre: Codable {
    var name: String
}
