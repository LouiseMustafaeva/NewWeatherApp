//
//  ImageView.swift
//  WeatherApp
//
//  Created by Louise on 06/02/24.
//

import SwiftUI
struct ImageView: View {
    
    @ObservedObject private var imageViewModel: ImageViewModel
    
    init(urlString: String?) {
        imageViewModel = ImageViewModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: imageViewModel.image ?? UIImage())
            .resizable()
    }
}

#Preview {
    ImageView(urlString: "")
}
