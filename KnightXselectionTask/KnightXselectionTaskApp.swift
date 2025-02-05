//
//  KnightXselectionTaskApp.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 31.01.2025..
//

import SwiftUI

@main
struct KnightXselectionTaskApp: App {
    var dataModel = MovieListViewDataModel(networkManager: NetworkManager.shared)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MovieListView(viewModel: MovieListViewModel(dataModel: dataModel))
            }
        }
    }
}
