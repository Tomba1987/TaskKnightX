//
//  DetailButtonView.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import SwiftUI

struct DetailButtonsView: View {
    
    var viewModel: DetailViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .tint(Color.white)
                }
                .frame(width: 25, height: 25)
                .padding()
                
                Spacer()
                Spacer()
                
                HStack(spacing: 20) {
                    Button {
                        viewModel.isChecked.toggle()
                    } label: {
                        Image(systemName: viewModel.isChecked ? "checkmark.seal.fill" : "checkmark.seal")
                            .resizable()
                    }
                    .frame(width: 40, height: 40)
                    .padding(0)
                    .tint(Color.green)
                    
                    Button {
                        viewModel.isFavorite.toggle()
                    } label: {
                        Image(systemName: viewModel.isFavorite ? "star.fill" : "star")
                            .resizable()
                    }
                    .frame(width: 40, height: 40)
                    .padding(0)
                    .tint(Color.yellow)
                }
                .padding(.trailing, 20)
            }
            Spacer()
        }
    }
}
