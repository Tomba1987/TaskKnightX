//
//  TopRatedMovieCard.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import SwiftUI

struct TopRatedMovieCard: View {
    
    @ObservedObject var cardViewModel: CardViewModel
    
    var body: some View {
        ZStack {
            HStack {
                AsyncCachedImage(url: URL(string: String.ImageURL.imageURL + (cardViewModel.movieItem.poster_path ?? ""))) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 120)
                        .cornerRadius(15)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(cardViewModel.movieItem.title)
                        .padding()
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text(cardViewModel.movieItem.overview)
                        .padding()
                        .font(.subheadline)
                        .lineLimit(3)
                        .foregroundStyle(.white)
                    HStack(spacing: 30) {
                        Spacer()
                        Button {
                            cardViewModel.movieItem.isChecked.toggle()
                        } label: {
                            Image(systemName: cardViewModel.movieItem.isChecked ? "checkmark.seal.fill" : "checkmark.seal")
                        }
                        .buttonStyle(.borderless)
                        .tint(.green)
                        .contentTransition(.symbolEffect)
                        
                        Button {
                            cardViewModel.movieItem.isFavorite.toggle()
                        } label: {
                            Image(systemName: cardViewModel.movieItem.isFavorite ? "star.fill" : "star")
                        }
                        .buttonStyle(.borderless)
                        .tint(.yellow)
                        .contentTransition(.symbolEffect)
                    }
                }
            }
        }
    }
}
