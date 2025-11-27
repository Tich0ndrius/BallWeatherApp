//
//  DayCombinedView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 27.11.2025.
//

import SwiftUI

struct DayCombinedView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.mint, .blue]),
                           startPoint:.topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                CityButtonView()
//                Spacer()
                DayColumnView(day: days[0])
                Spacer()
                
                DayRowView(days: days)
                
                
                Spacer()
            }
        }
    }
}

struct DayCombinedView_Previews: PreviewProvider {
    static var previews: some View {
        DayCombinedView()
    }
}
