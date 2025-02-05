//
//  DetailView.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            if viewModel.isLoading {
                ProgressView()
                    .tint(Color.white)
                    .progressViewStyle(.circular)
                    .controlSize(.large)
                    .onAppear {
                        viewModel.loadDataIntoViewModel()
                    }
            } else {
                ScrollView {
                    DetailsMainView(viewModel: viewModel)
                    DetailsGradientView()
                }
                DetailButtonsView(viewModel: viewModel)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if viewModel.movie == nil {
                viewModel.loadDataIntoViewModel()
            }
        }
        .alert("An error has occured", isPresented: $viewModel.isError) {
            Button("Try again", role: .cancel) {
                viewModel.loadDataIntoViewModel()
            }
        }
    }
}
