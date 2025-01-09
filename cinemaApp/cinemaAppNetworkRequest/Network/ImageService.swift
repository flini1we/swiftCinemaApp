//
//  ImageService.swift
//  cinemaAppNetworkRequest
//
//  Created by Данил Забинский on 24.12.2024.
//

import Foundation
import UIKit

class ImageService {
    
    static let imageCache: NSCache<NSURL , NSData> = .init()
    
    static func downloadImage(from urlString: String) async throws -> UIImage? {
        
        guard let url = URL(string: urlString) else { return nil }
        
        if let image = imageCache.object(forKey: url as NSURL) {
            return UIImage(data: image as Data)
        }
        
        let responceData = try await URLSession.shared.data(from: url)
        imageCache.setObject(responceData.0 as NSData, forKey: url as NSURL)
        
        return UIImage(data: responceData.0 as Data)
    }
}
