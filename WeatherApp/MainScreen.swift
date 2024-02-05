//
//  ContentView.swift
//  WeatherApp
//
//  Created by Louise on 05/02/24.
//

import SwiftUI

struct MainScreen: View {
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack {
            Text("15°C")
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
                ForEach(0..<10, id: \.self) { item in
                    Text("item")
                }
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    MainScreen()
}
