//
//  BaseAPI.swift
//  iOS Capability Final Project
//
//  Created by Jeofferson Dela Peña on 9/12/22.
//

import Foundation

class BaseAPI {
    
    private static let baseURL = "https://fakestoreapi.com"
    
    static let defaultSession = URLSession(configuration: .default)
    
    static func getURL(forEndpoint endpoint: String) -> URL? {
        URL(string: "\(baseURL)\(endpoint)")
    }
}
