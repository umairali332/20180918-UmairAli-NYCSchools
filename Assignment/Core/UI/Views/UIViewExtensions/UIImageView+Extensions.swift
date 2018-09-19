//
//  UIImageView+Extensions.swift
//  Assignment
//
//  Created by Umair Ali on 4/9/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit
import AlamofireImage

protocol ImageLazyLoading {
    
    func lazyLoadImage(withUrlString urlString:String?,placeholderImage placeholder:UIImage?)
    
}

extension UIImageView:ImageLazyLoading {
    
    func lazyLoadImage(withUrlString urlString: String?, placeholderImage placeholder: UIImage?) {
        
        image = placeholder
        
        guard
            let _urlString = urlString,
            let imageURL = URL(string:_urlString)
            else { return }
        
        af_setImage(withURL: imageURL, placeholderImage: placeholder,imageTransition: .crossDissolve(0.2))
    }
    
}
