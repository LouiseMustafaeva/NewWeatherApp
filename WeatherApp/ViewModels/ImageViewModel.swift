//
//  ImageViewModel.swift
//  WeatherApp
//
//  Created by Louise on 06/02/24.
//

import UIKit

class ImageViewModel: ObservableObject {
    @Published var image: UIImage?
    
    private var imageCache: NSCache<NSString, UIImage>?
    
    init(urlString: String?) {
        loadImage(urlString: urlString)
    }
    
    private func loadImage(urlString: String?)  {
        
        guard let urlString = urlString else { return }
        if let imageFromCache = getImageFromCache(from: urlString) {
            self.image = imageFromCache
            return
        }
        
        Task {
            await loadImage(from: urlString)
        }
    }
    
    @MainActor func loadImage(from urlString: String) async {
        let newUrlString = addHeadForImageUrl(string: urlString)
        let url = URL(string: newUrlString)
        guard let url = url else { return }
        
        if let cachedImage = getCachedImage(for: url) {
            image = cachedImage
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let downloadedImage = UIImage(data: data) {
                cacheImage(downloadedImage, for: url)
                image = downloadedImage
            }
        } catch {
            print("Error loading image: \(error.localizedDescription)")
        }
    }
    
    private func getCachedImage(for url: URL) -> UIImage? {
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)),
           let cachedImage = UIImage(data: cachedResponse.data) {
            return cachedImage
        }
        return nil
    }
    
    private func cacheImage(_ image: UIImage, for url: URL) {
        let data = image.jpegData(compressionQuality: 0.8)
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        let cachedResponse = CachedURLResponse(response: response, data: data!)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
    }
    
    
    func addHeadForImageUrl(string: String) -> String {
        
        if string.count >= 2{
            let prefix = "https:"
            return prefix + string
        }
        return ""
    }
    
    private func setImageCache(image: UIImage, key: String) {
        imageCache?.setObject(image, forKey: key as NSString)
    }
    
    private func getImageFromCache(from key: String) -> UIImage? {
        return imageCache?.object(forKey: key as NSString) as? UIImage
    }
}
