//
//  ImageView+Extensions.swift
//  iOS Capability Final Project
//
//  Created by Jeofferson Dela Peña on 9/12/22.
//

import UIKit

extension UIImageView {

    func displayImage(usingURLString urlString: String) {
        ImageUtil.getImage(fromURLString: urlString) { image, _ in
            self.image = image
        }
    }
}
