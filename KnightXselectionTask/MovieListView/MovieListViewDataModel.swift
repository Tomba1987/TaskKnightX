//
//  MovieListViewDataModel.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import Foundation
import Combine

class MovieListViewDataModel {
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func loadDataModel(_ page: Int) -> AnyPublisher<CompilerResponse, Error> {
        return networkManager.requestMovieList(page: page)
    }
}
