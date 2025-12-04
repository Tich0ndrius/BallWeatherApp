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
            
            // Круг со сторонами света
            ZStack {
                ForEach(Direction.allCases, id: \.self) { direction in
                    Text(direction.rawValue)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(y: -70)
                        .rotationEffect(.degrees(direction.angle))
                }
                
                // Иконка компаса
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
