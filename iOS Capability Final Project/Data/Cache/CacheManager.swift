//
//  CacheManager.swift
//  iOS Capability Final Project
//
//  Created by Jeofferson Dela Peña on 9/12/22.
//

import UIKit

class CacheManager {
    
    private static let cache: NSCache = NSCache<AnyObject, AnyObject>()
    
    static func setObject(_ obj: UIImage, forKey key: String) {
        cache.setObject(obj, forKey: key as AnyObject)
    }
    
    static func getImage(forKey key: String) -> UIImage? {
        cache.object(forKey: key as AnyObject) as? UIImage
    }
}
