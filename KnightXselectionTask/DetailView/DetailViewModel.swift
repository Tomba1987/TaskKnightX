//
//  DetailViewModel.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import SwiftUI
import Combine

class DetailViewModel: ObservableObject {
    
    var dataModel: DetailDataModel
    internal var bag = Set<AnyCancellable>()
    var movieId: Int
    @Binding var isFavorite: Bool
    @Binding var isChecked: Bool
    
    @Published var movie: MovieDetails?
    var genres = ""
    @Published var isLoading: Bool = true
    @Published var isError: Bool = false
    
    init(dataModel: DetailDataModel, movieId: Int, isFavorite: Binding<Bool>, isChecked: Binding<Bool>) {
        self.dataModel = dataModel
        self.movieId = movieId
        _isFavorite = isFavorite
        _isChecked = isChecked
    }
    
    func loadDataIntoViewModel() {
        dataModel.loadDataModel(movieId: movieId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Detail Data Model loaded!")
                    self.isError = false
                case.failure(let error):
                    print("Detail Data model loading failed with error: \(error.localizedDescription)")
                    self.isError = true
                }
            } receiveValue: { result in
                self.movie = result
                self.isLoading = false
            }
            .store(in: &bag)
    }
    
    func loadGenres() -> String {
        if let movie = movie {
            genres = movie.genres.map({ genre in
                genre.name
            }).joined(separator: ", ").capitalized
        }
        
        return genres
    }
}
