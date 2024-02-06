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
            Text(day.weekday()?.capitalized ?? "")
                .foregroundColor(.black)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .font(.custom(Constants.FontNames.avenirNextBold, size: Constants.FontSizes.m))
            
            ImageView(urlString: imageUrl)
                .frame(width: Constants.Sizes.xs, height: Constants.Sizes.xs)
            
            VStack {
                Text("min".localized)
                    .font(.custom(Constants.FontNames.avenirNext, size: Constants.FontSizes.s))
                    .foregroundColor(.gray)
                Text("\(Int(minTemp))°C")
                    .font(.custom(Constants.FontNames.avenirNextBold, size: Constants.FontSizes.l))
                    .foregroundColor(.black)
                    .frame(width: Constants.Sizes.s)
            }
            
            VStack {
                Text("max".localized)
                    .font(.custom(Constants.FontNames.avenirNext, size: Constants.FontSizes.s))
                    .foregroundColor(.gray)
                Text("\(Int(maxTemp))°C")
                    .font(.custom(Constants.FontNames.avenirNextBold, size: Constants.FontSizes.l))
                    .foregroundColor(.black)
                    .frame(width: Constants.Sizes.s)
            }
        }
    }
}

#Preview {
    MainCell(day: "", minTemp: 3, maxTemp: 5, imageUrl: "")
}
