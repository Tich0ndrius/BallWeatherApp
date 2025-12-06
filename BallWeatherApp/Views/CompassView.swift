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
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.top)
            
            // Cardinal directions
            ZStack {
                ForEach(Direction.allCases, id: \.self) { direction in
                    Text(direction.rawValue)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundStyle(.white)
                        .offset(y: -70)
                        .rotationEffect(.degrees(direction.angle))
                }
                
                // Compass icon
                Image(systemName: "location.north.line.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .rotationEffect(.degrees(-heading.heading))
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(Circle())
                    .shadow(radius: 3)
            }
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
