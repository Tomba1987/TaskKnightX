//
//  DetailDataModel.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import Foundation
import Combine

class DetailDataModel {
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func loadDataModel(movieId: Int) -> AnyPublisher<MovieDetails, Error> {
        return networkManager.requestMovieDetails(movieId: movieId)
    }
}
