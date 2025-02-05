//
//  MovieListViewModel.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movieItemList = [MovieItem]()
    var currentPage = 1
    var maxNumberOfPages = 1
    
    @Published var isLoading: Bool = true
    @Published var isError: Bool = false
    
    internal var bag = Set<AnyCancellable>()
    var dataModel: MovieListViewDataModel
    
    init(dataModel: MovieListViewDataModel) {
        self.dataModel = dataModel
    }
    
    func loadDataModelIntoViewModel() {
        dataModel.loadDataModel(currentPage)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Root Data Model loaded!")
                    self.isError = false
                case.failure(let error):
                    print("Root Data model loading failed with error: \(error.localizedDescription)")
                    self.isError = true
                }
            } receiveValue: { result in
                self.maxNumberOfPages = result.totalPages
                
                self.movieItemList = result.topRatedMovieList.compactMap({ movie in
                    MovieItem(id: movie.id,
                              backdrop_path: movie.backdrop_path,
                              poster_path: movie.poster_path,
                              title: movie.title,
                              overview: movie.overview,
                              genre_ids: movie.genre_ids,
                              release_date: movie.release_date)
                })
                
                self.isLoading = false
            }
            .store(in: &bag)
    }
    
    @MainActor
    func loadMoreMovies() async {
        currentPage += 1
        
        dataModel.loadDataModel(currentPage)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Root Data Model loaded!")
                case.failure(let error):
                    print("Root Data model loading failed with error: \(error.localizedDescription)")
                }
            } receiveValue: { result in
                let moreMovies = result.topRatedMovieList.compactMap { movie in
                    MovieItem(id: movie.id,
                              backdrop_path: movie.backdrop_path,
                              poster_path: movie.poster_path,
                              title: movie.title,
                              overview: movie.overview,
                              genre_ids: movie.genre_ids,
                              release_date: movie.release_date)
                }
                self.movieItemList += moreMovies
            }
            .store(in: &bag)
    }
    
    func hasReachedEnd(of movie: MovieItem) -> Bool {
        movieItemList.last?.id == movie.id
    }
    
    func refreshScreen() {
        movieItemList.removeAll()
        currentPage = 1
        loadDataModelIntoViewModel()
    }
}
