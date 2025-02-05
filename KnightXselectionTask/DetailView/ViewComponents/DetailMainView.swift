//
//  DetailMainView.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import SwiftUI

struct DetailsMainView: View {
    
    var viewModel: DetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: String.ImageURL.imageURL + (viewModel.movie?.backdrop_path ?? ""))) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.movie?.title ?? "")
                    .font(.title)
                    .foregroundStyle(Color.white)
                Text(viewModel.loadGenres())
                    .foregroundStyle(Color.white)
                Text(String.DetailsMainView.status)
                    .font(.title2)
                    .foregroundStyle(Color.white)
                Text(viewModel.movie?.status ?? "")
                    .foregroundStyle(Color.white)
                Text(String.DetailsMainView.releaseYear)
                    .font(.title2)
                    .foregroundStyle(Color.white)
                Text(viewModel.movie?.release_date.prefix(4) ?? "")
                    .foregroundStyle(Color.white)
                Text(String.DetailsMainView.description)
                    .font(.title2)
                    .foregroundStyle(Color.white)
                Text(viewModel.movie?.overview ?? "")
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
            }
            .padding(.leading, 15)
        }
    }
}
