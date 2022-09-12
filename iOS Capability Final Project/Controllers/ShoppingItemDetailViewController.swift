//
//  ShoppingItemDetailViewController.swift
//  iOS Capability Final Project
//
//  Created by Jeofferson Dela Peña on 9/12/22.
//

import UIKit

class ShoppingItemDetailViewController: UIViewController {
    
    var shoppingItem: ShoppingItem!
    
    @IBOutlet var ivImage: UIImageView!
    
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelPrice: UILabel!
    @IBOutlet var labelRating: UILabel!
    
    @IBOutlet var tvDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = shoppingItem.category.capitalized
        
        ivImage.displayImage(usingURLString: shoppingItem.image)
        
        labelTitle.text = shoppingItem.title
        labelPrice.text = shoppingItem.price.toDollarFormatString()
        labelRating.text = "\(shoppingItem.rating.rate) (\(shoppingItem.rating.count))"
        
        tvDescription.text = shoppingItem.shoppingItemDescription
    }
}
