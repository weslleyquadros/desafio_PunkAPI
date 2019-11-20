//
//  CustomTextField.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 19/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//


import Foundation
import UIKit

class CustomTextField: UITextField {

    var padding = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 50)
    var bottomBorder = UIView()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder = UIView.init(frame: CGRect(x: 0, y: 0, width: percentOfWidth(percente: 16), height: percentOfHeight(percente: 16)))
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.backgroundColor = .white
        self.tintColor = #colorLiteral(red: 0.3803921569, green: 0.3764705882, blue: 0.3764705882, alpha: 1)
        
        self.elevate(elevation: 4)
        self.layer.cornerRadius = 15
        
      
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 16
        return textRect
    }
    
    

    
    func setIconSearchLeft(){
        let btnView = UIButton(type: .custom)
        //btnView.backgroundColor = #colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.9019607843, alpha: 1)
        btnView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        btnView.setImage(#imageLiteral(resourceName: "search"), for: .normal)
       
        
        btnView.contentMode = .scaleAspectFill
        btnView.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        leftView = btnView
        leftViewMode = .always
        leftView?.isHidden = false
        
    }
    

    
}
