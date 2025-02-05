//
//  CompilerResponse.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import Foundation

struct CompilerResponse: Codable {
    var topRatedMovieList: [TopRatedMovieListItem]
    var totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case topRatedMovieList = "results"
        case totalPages = "total_pages"
    }
}
