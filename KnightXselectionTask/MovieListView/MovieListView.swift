//
//  MovieListView.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(Color.white)
                    .progressViewStyle(.circular)
                    .controlSize(.large)
            } else {
                
                VStack {
                    List($viewModel.movieItemList, id: \.id) { $movie in
                        TopRatedMovieCard(cardViewModel: CardViewModel(movieItem: $movie))
                            .task {
                                if viewModel.hasReachedEnd(of: movie) {
                                    await viewModel.loadMoreMovies()
                                }
                            }
                            .overlay(content: {
                                NavigationLink {
                                    DetailView(viewModel: DetailViewModel(dataModel: DetailDataModel(networkManager: NetworkManager.shared),
                                                                          movieId: movie.id,
                                                                          isFavorite: $movie.isFavorite,
                                                                          isChecked: $movie.isChecked))
                                } label: {
                                    EmptyView()
                                }
                                .opacity(0.0)
                            })
                            .buttonStyle(.plain)
                            .listRowBackground(Color.black)
                    }
                    .listRowSpacing(15)
                    .listRowSeparator(.hidden)
                    .scrollContentBackground(.hidden)
                    .refreshable {
                        viewModel.refreshScreen()
                    }
                }
            }
        }
        .onAppear {
            if viewModel.movieItemList.isEmpty { viewModel.loadDataModelIntoViewModel() }
        }
        .alert("An error has occured", isPresented: $viewModel.isError) {
            Button {
                viewModel.loadDataModelIntoViewModel()
            } label: {
                Text("Try again")
            }
        }
    }
}
