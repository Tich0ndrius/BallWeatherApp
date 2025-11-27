//
//  CityButtonView.swift
//  BallWeatherApp
//
//  Created by Tykhon on 26.11.2025.
//

import SwiftUI

struct CityButtonView: View {
    var body: some View {
        Button {
            
        } label: {
            Text("City")
                .frame(width: 280, height: 40)
                .background(Color.white)
                .foregroundColor(.blue)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        }
        .padding(.bottom)
    }
}

struct CityButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CityButtonView()
    }
}
