//
//  UIImageViewAdditions.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func load(urlString: String?, placeholderImageName: String) {
        let placeholderImage = UIImage(named: placeholderImageName)
        self.image = placeholderImage
        if let finalUrlString = urlString {
            let url = imageUrl(finalUrlString)
            self.kf_setImageWithURL(url, placeholderImage: placeholderImage)
        }
    }
    
    private func imageUrl(path: String) -> NSURL {
        return NSURL(string: path, relativeToURL: Config.gathererBaseEndpoint)!
    }
    
}