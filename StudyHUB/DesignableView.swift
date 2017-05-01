//
//  DesignableView.swift
//  StudyHUB
//
//  Created by Miguel Silva da Rocha Junior on 4/19/17.
//  Copyright © 2017 StudyHUB. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }

}
