//
//  CardViewModel.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import SwiftUI

class CardViewModel: ObservableObject {
    @Binding var movieItem: MovieItem
    
    init(movieItem: Binding<MovieItem>) {
        _movieItem = movieItem
    }
}
