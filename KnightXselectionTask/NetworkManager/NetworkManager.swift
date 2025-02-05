//
//  NetworkManager.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import Foundation
import Combine

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func requestMovieList<T: Codable>(page: Int) -> AnyPublisher<T, Error> {
        
        let fullUrlString = "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=" + "\(page)" + "&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200"
        
        guard let url = URL(string: fullUrlString) else {
            print("INVALID URL")
            return Fail(error: NSError(domain: "Missing feed URL", code: -10001)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": String.BearerToken.bearerToken
        ]
        
        return self.request(urlRequest: request)
    }
    
    func requestMovieDetails<T: Codable>(movieId: Int) -> AnyPublisher<T, Error> {
        let fullUrlString = "https://api.themoviedb.org/3/movie/\(movieId)?language=en-US"
        
        guard let url = URL(string: fullUrlString) else {
            print("INVALID URL")
            return Fail(error: NSError(domain: "Missing feed URL", code: -10001)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": String.BearerToken.bearerToken
        ]
        
        return self.request(urlRequest: request)
    }
}
