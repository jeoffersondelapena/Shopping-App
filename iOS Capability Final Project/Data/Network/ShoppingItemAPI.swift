//
//  ShoppingItemAPI.swift
//  iOS Capability Final Project
//
//  Created by Jeofferson Dela Peña on 9/12/22.
//

import Foundation

class ShoppingItemAPI: BaseAPI {
    
    static func getShoppingItems(completion: @escaping ([ShoppingItem]?, Error?) -> Void) {
        guard let url = getURL(forEndpoint: "/products") else {
            return
        }
        defaultSession.shoppingItemsTask(with: url) { shoppingItems, _, error in
            DispatchQueue.main.async {
                completion(shoppingItems, error)
            }
        }.resume()
    }
}
