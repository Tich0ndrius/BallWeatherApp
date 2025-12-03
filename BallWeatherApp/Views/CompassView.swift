//
//  CompassView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 27.11.2025.
//

import SwiftUI

struct CompassView: View {
    @ObservedObject var heading = CompassViewModel()

    var body: some View {
        Image(systemName: "location.north.line.fill")
            .resizable()
            .frame(width: 30, height: 30)
            .rotationEffect(.degrees(-Double(heading.heading)))
            .padding()
            .background(.thinMaterial)
            .clipShape(Circle())
            .shadow(radius: 3)
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
