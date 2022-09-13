//
//  ShoppingItemCell.swift
//  iOS Capability Final Project
//
//  Created by Jeofferson Dela Peña on 9/12/22.
//

import UIKit

class ShoppingItemCell: UITableViewCell {
    
    @IBOutlet var ivImage: UIImageView!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelPrice: UILabel!
    
    func bind(_ shoppingItem: ShoppingItem, atIndex index: Int) {
        tag = index
        
        ivImage.image = nil
        ImageUtil.getImage(fromURLString: shoppingItem.image, index) { [weak self] image, index in
            if index == self?.tag {
                self?.ivImage.image = image
            }
        }
        
        labelTitle.text = shoppingItem.title
        labelPrice.text = shoppingItem.price.toDollarFormatString()
    }
}
