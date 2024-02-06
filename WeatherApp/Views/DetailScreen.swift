//
//  DetailScreen.swift
//  WeatherApp
//
//  Created by Louise on 06/02/24.
//

import SwiftUI

struct DetailScreen: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    @State var days: [WeatherModel.Forecast.ForecastDay]?
    @State var hours = [WeatherModel.Forecast.ForecastDay.Hour]()
    
    var dayIndex: Int
    var body: some View {
        VStack {
            ImageView(urlString: viewModel.model?.current?.condition.icon)
                .frame(width: Constants.Sizes.xl, height: Constants.Sizes.xl, alignment: .center)
            Text("\(viewModel.model?.current?.temp_c ?? 0)°C")
                .font(.custom(Constants.FontNames.avenirNext, size: Constants.FontSizes.xxl))
                .foregroundColor(.black)
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<(hours.count), id: \.self) { i in
                            Cell(time: hours[i].time, temp: hours[i].temp_c, imageUrl: hours[i].condition.icon)
                        }
                    }
                }.onAppear(perform: {
                    Task {
                        days =  try await viewModel.getForecastDays()
                        guard let days = days else { return }
                        hours = try await viewModel.getHours(array: days, index: dayIndex)
                    }
                })
                .padding(.top)
            }
            Spacer()
        }
    }
}

struct Cell: View {
    
    let time: String
    let temp: Float
    let imageUrl: String
    
    var body: some View {
        VStack {
            Text(time.convertToHours() ?? "")
            ImageView(urlString: imageUrl)
                .frame(width: Constants.Sizes.s, height: Constants.Sizes.s, alignment: .center)
            Text("\(Int(temp))°C")
        }.frame(width: Constants.Sizes.m, height: Constants.Sizes.l)
    }
}
