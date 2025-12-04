//
//  BackgroundColorView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 30.11.2025.
//

import SwiftUI

struct BackgroundColorView: View {
    
    @State private var isNight = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Group{
            LinearGradient(gradient: Gradient(colors: (isNight || colorScheme.isDark ? [.black, .gray] : [.mint, .blue])),
                       startPoint:.topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.top)
        }
        .onAppear{
            isNight = isNightTime()
            startTimer()
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            isNight = isNightTime()
        }
        
    }
}

struct BackgroundColorView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundColorView()
    }
}
