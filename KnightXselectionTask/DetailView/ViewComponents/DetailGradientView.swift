//
//  DetailGradientView.swift
//  KnightXselectionTask
//
//  Created by Tomislav Tomic on 05.02.2025..
//

import SwiftUI

struct DetailsGradientView: View {
    var body: some View {
        LinearGradient(stops: [Gradient.Stop(color: .black, location: 0), Gradient.Stop(color: .clear, location: 0.2)],
                       startPoint: .top,
                       endPoint: .bottom)
    }
}
