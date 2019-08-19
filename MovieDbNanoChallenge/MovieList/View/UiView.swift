//
//  UiView.swift
//  MovieDbNanoChallenge
//
//  Created by Marcus Vinicius Vieira Badiale on 15/08/19.
//  Copyright © 2019 Marcus Vinicius Vieira Badiale. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView{
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var parentViewController: UIViewController? {
        if let nextResponder = next as? UIViewController {
            return nextResponder
        }else if let nextResponder = next as? UIView {
            return nextResponder.parentViewController
        }else {
            return nil
        }
    }
}
