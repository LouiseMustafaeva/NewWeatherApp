//
//  MainCell.swift
//  WeatherApp
//
//  Created by Louise on 05/02/24.
//

import SwiftUI

struct MainCell: View {
    let day: String
    let minTemp: Float
    let maxTemp: Float
    var imageUrl: String
    
    var body: some View {
        HStack {
            Text("Monday")
                .foregroundColor(.black)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .font(.custom("AvenirNext-bold", size: 20))
        
            Image(systemName: "camera")
                .frame(width: 60, height: 60)
            
            VStack {
                Text("min")
                    .font(.custom("AvenirNext", size: 15))
                    .foregroundColor(.gray)
                Text("15°C")
                    .font(.custom("AvenirNext-bold", size: 22))
                    .foregroundColor(.black)
                    .frame(width: 60)
            }
            VStack {
                Text("max")
                    .font(.custom("AvenirNext", size: 15))
                    .foregroundColor(.gray)
                Text("17°C")
                    .font(.custom("AvenirNext-bold", size: 22))
                    .foregroundColor(.black)
                    .frame(width: 60)
            }
        }.padding(.horizontal)
    }
}

#Preview {
    MainCell(day: "", minTemp: 3, maxTemp: 5, imageUrl: "")
}
