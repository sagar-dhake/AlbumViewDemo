//
//  CardView.swift
//  AlbumViewDemoApp
//
//  Created by Sagar Dhake on 22/08/20.
//  Copyright © 2020 Sagar Dhake. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class CardView: UIView {
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor:UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var shadowOpacity:Float = 0.0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOfset:CGSize = CGSize.zero {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var backgroundImage:UIImage? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOffsetWidth: Int = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowOffsetHeight: Int = 3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor1: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowY: CGFloat = -3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowBlur: CGFloat = 3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointX: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var roundView: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }

    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override public func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        
        if backgroundImage != nil
        {
            self.setBackgroundImage(image: backgroundImage!)
        }
        
        if roundView
        {
            layer.cornerRadius = self.frame.width * 0.5
        }
    }
    
    private func setBackgroundImage(image:UIImage)
    {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        imageView.image = image
        self.addSubview(imageView)
        self.sendSubviewToBack(imageView)
    }
}



