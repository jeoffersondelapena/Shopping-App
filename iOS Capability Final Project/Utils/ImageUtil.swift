//
//  ImageUtil.swift
//  iOS Capability Final Project
//
//  Created by Jeofferson Dela Peña on 9/12/22.
//

import UIKit

class ImageUtil {

    static func getImage(
        fromURLString urlString: String,
        _ imageView: UIImageView? = nil,
        _ index: Int = -1,
        completion: @escaping (UIImage, Int) -> Void)
    {
        if let image = CacheManager.getImage(forKey: urlString) {
            completion(image, index)
            return
        }
        
        imageView?.image = UIImage(named: Constants.imgLoading)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                return
            }

            guard let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                completion(image, index)
            }
            
            CacheManager.setImage(image, forKey: urlString)
        }
    }
}
