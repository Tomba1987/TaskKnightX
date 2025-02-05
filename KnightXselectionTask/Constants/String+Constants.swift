//
//  String+Constants.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import Foundation

public extension String {
    
    enum ImageURL {
        public static let imageURL = "https://image.tmdb.org/t/p/original"
    }
    
    enum BearerToken {
        public static let bearerToken = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYmRiN2U4YjVlNDQ1YTY3MTBiYjk4YTc1MWVjNjIyMyIsIm5iZiI6MTYyNTMwMjY2NS40ODUsInN1YiI6IjYwZTAyNjg5YjY4NmI5MDA3NWY4ZGYzZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Z0h7VRW1QnJUNyEASjmRb8r1jGD4edbNWAb3hQWlHuk"
    }
    
    enum DetailsMainView {
        public static let status = "Status:"
        public static let releaseYear = "Release year:"
        public static let description = "Description:"
    }
}
