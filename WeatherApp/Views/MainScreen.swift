//
//  ContentView.swift
//  WeatherApp
//
//  Created by Louise on 05/02/24.
//

import SwiftUI

struct MainScreen: View {
    @State private var selectedSegment = 0
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.model?.current?.temp_c ?? 0)°C")
                .font(.custom("AvenirNext-Bold", size: 75 ))
                .foregroundColor(.black)
                .padding(.top, 20)
            Picker("", selection: $selectedSegment) {
                Text("3 дня").tag(0)
                Text("7 дней").tag(1)
                Text("10 дней").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            List {
                ForEach(0..<(viewModel.model?.forecast?.forecastday.count ?? 0), id: \.self) { item in
                    
                    MainCell(day: viewModel.model?.forecast?.forecastday[item].date ?? "", minTemp: viewModel.model?.forecast?.forecastday[item].day.mintemp_c ?? 0, maxTemp: viewModel.model?.forecast?.forecastday[item].day.maxtemp_c ?? 0, imageUrl: viewModel.model?.forecast?.forecastday[item].day.condition.icon ?? "")
        
                }
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scrollContentBackground(.hidden)
        }
        .onChange(of: selectedSegment) { _, _ in
            updateData()
        }
        .onAppear {
            updateData()
        }
    }
    
    func updateData() {
        Task {
            switch selectedSegment {
            case 0:
                try await viewModel.getDataFromNetwork(type: .threeDays)
            case 1:
                try await viewModel.getDataFromNetwork(type: .sevenDays)
            case 2:
                try await viewModel.getDataFromNetwork(type: .tenDays)
            default:
                break
            }
        }
    }
}


#Preview {
    MainScreen()
}
